/*
 * @Author: CrazyIvanPro
 * @Date: 2018-12-19 17:36:32
 * @LastEditTime: 2018-12-30 20:00:59
 * @Description: proxy.c - A cached concurrent HTTP/1.0 Web Server
 */
#include "cache.h"
#include "csapp.h"

/* DEBUG */
#define DEBUG
#ifdef DEBUG
#define dbg(...) printf(__VA_ARGS__)
#else
#define dbg(...)
#endif

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define req_hdr_fmt "GET %s HTTP/1.0\r\n"

/* You won't lose style points for including this long line in your code */
static const char *user_agent_hdr =
    "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 "
    "Firefox/10.0.3\r\n";
static const char *con_hdr = "Connection: close\r\n";
static const char *pxycon_hdr = "Proxy-Connection: close\r\n";

/* Function prototypes */
/* thread - thread for concurrent programming */
void *thread(void *vargp);
/* doit - handle one HTTP request/response transaction */
void doit(int fd);
/* parse_url - parse URL into port, hostname, path */
int parse_url(char *url, char *port, char *hostname, char *path);
/* clienterror - returns an error message to the client */
void clienterror(int fd, char *cause, char *errnum, char *shortmsg,
                 char *longmsg);
/* gen_http_hdr - generate a new http header to be sent to server */
int gen_http_hdr(char *new_hdr, char *hostname, char *port, char *path,
                 rio_t *client_rio);
/* Pthread_sigmask - Wrapper function of pthread_sigmask */
int Pthread_sigmask(int how, const sigset_t *set, sigset_t *oldset);

/* Global variables */
cache_t cache;

/* $begin proxymain */
int main(int argc, char **argv) {
    int listenfd, *confdp;
    char hostname[MAXLINE], port[MAXLINE];
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    pthread_t tid;

    /* Check command line args */
    if (argc != 2) {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(1);
    }

    /* Ignore SIGPIPE signal in main thread */
    Signal(SIGPIPE, SIG_IGN);
    /* Ignore SIGPIPE signal in thread routines */
    sigset_t signal_mask;
    sigemptyset(&signal_mask);
    sigaddset(&signal_mask, SIGPIPE);
    Pthread_sigmask(SIG_BLOCK, &signal_mask, NULL);

    /* Init cache */
    init_cache(&cache);

    /* Handle request */
    listenfd = Open_listenfd(argv[1]);
    while (1) {
        clientlen = sizeof(struct sockaddr_storage);
        /* malloc memory to storage confd */
        confdp = Malloc(sizeof(int));
        *confdp = Accept(listenfd, (SA *)&clientaddr, &clientlen);

        /* print out information about hostname ans port */
        Getnameinfo((SA *)&clientaddr, clientlen, hostname, MAXLINE, port,
                    MAXLINE, 0);
        printf("Accepted connection from (%s, %s)\n", hostname, port);

        Pthread_create(&tid, NULL, thread, confdp); /* create thread */
    }

    printf("%s", user_agent_hdr);
    return 0;
}
/* $end proxymain */

/*
 * thread - thread for concurrent programming
 */
void *thread(void *vargp) {
    int confd = *((int *)vargp);
    /* detach thread self */
    Pthread_detach(pthread_self());
    Free(vargp);
    /* doit routine */
    doit(confd);
    Close(confd);
    return NULL;
}

/*
 * doit - handle one HTTP request/response transaction
 */
/* $begin doit */
void doit(int confd) {
    int server_fd, object_idx;
    char buf[MAXLINE], method[MAXLINE], url[MAXLINE], version[MAXLINE];
    char hostname[MAXLINE], port[MAXLINE], path[MAXLINE];
    char new_hdr[MAXLINE], temp_url[MAXLINE];
    rio_t client_rio, server_rio;

    /* Read request line and headers */
    Rio_readinitb(&client_rio, confd);
    if (!Rio_readlineb(&client_rio, buf, MAXLINE)) /* read request */
        return;

    sscanf(buf, "%s %s %s", method, url, version); /* parse request */
    if (strcasecmp(method, "GET")) {               /* request errer */
        clienterror(confd, method, "501", "Not Implemented",
                    "Proxy does not implement this method");
        return;
    }

    strncpy(temp_url, url, strlen(url));
    /* Parse URL from GET request */
    if (parse_url(temp_url, port, hostname, path)) {
        clienterror(confd, method, "502", "Bad URL",
                    "Proxy does not support this request");
        return;
    }
    printf("%s\n", buf);
    printf("port:\t%s\n", port);
    printf("hostname:\t%s\n", hostname);
    printf("path:\t%s\n", path);

    /* Try to find object in cache */
    if ((object_idx = find_obj(url, &cache)) >= 0) {
        P_reader(object_idx, &cache);
        char *contentp = cache.entry[object_idx].content;
        Rio_writen(confd, contentp, strlen(contentp));
        V_reader(object_idx, &cache);
        return;
    }

    /* Generate the new header to be sent to server */
    if (gen_http_hdr(new_hdr, hostname, port, path, &client_rio)) return;
    printf("new_hdr:\n%s\n", new_hdr);
    server_fd = Open_clientfd(hostname, port);

    Rio_readinitb(&server_rio, server_fd);
    /* Write new header to server */
    Rio_writen(server_fd, new_hdr, strlen(new_hdr));

    /* Transmit message from server to client */
    size_t n;
    size_t object_size = 0;
    char object_buf[MAX_OBJECT_SIZE];
    while ((n = Rio_readlineb(&server_rio, buf, MAXLINE))) {
        object_size += n;
        if (object_size < MAX_OBJECT_SIZE) strcat(object_buf, buf);
        Rio_writen(confd, buf, n);
    }
    printf("Proxy received %ld bytes.\n", object_size);
    /* Cache suitable object */
    if (object_size < MAX_OBJECT_SIZE) {
        cache_obj(url, object_buf, &cache);
        printf("url: %s has been cached with size %ld\n", url, object_size);
    }
    Close(server_fd);
    return;
}
/* $end doit */

/*
 * parse_url - parse URL into port, hostname, path
 *  return -1 if abnormal
 */
/* $begin parse_url */
int parse_url(char *url, char *port, char *hostname, char *path) {
    int num_port = 80;
    char *ptr_bg;
    char *ptr_path;

    /* bad request */
    if (!url || !strlen(url)) return -1;

    if (strstr(url, "//")) /* has // */
        ptr_bg = strstr(url, "//") + 2;
    else
        ptr_bg = url;

    if ((ptr_path = strstr(ptr_bg, ":"))) { /* has port number */
        *ptr_path = '\0';
        sscanf(ptr_bg, "%s", hostname);
        sscanf(ptr_path + 1, "%d%s", &num_port, path);
    } else {
        if ((ptr_path = strstr(ptr_bg, "/"))) { /* has path */
            sscanf(ptr_path, "%s", path);
            *ptr_path = '\0';
            sscanf(ptr_bg, "%s", hostname);
        } else { /* no path */
            sscanf(ptr_bg, "%s", hostname);
        }
    }
    sprintf(port, "%d", num_port);
    return 0;
}
/* $end parse_url */

/*
 *  gen_http_hdr - generate a new http header to be sent to server
 *  with strict format.
 */
/* $begin gen_http_hdr */
int gen_http_hdr(char *new_hdr, char *hostname, char *port, char *path,
                 rio_t *client_rio) {
    char buf[MAXLINE], req_hdr[MAXLINE], host_hdr[MAXLINE], other_hdr[MAXLINE];
    sprintf(req_hdr, req_hdr_fmt, path);
    while (Rio_readlineb(client_rio, buf, MAXLINE)) {
        if (!strcmp(buf, "\r\n")) break;
        /* read new Host header */
        if (!strncasecmp(buf, "Host", 4))
            strcpy(host_hdr, buf);
        else {
            int is_ign_hdr = strncasecmp(buf, "Connection", 10) ||
                             strncasecmp(buf, "Proxy-Connection", 16) ||
                             strncasecmp(buf, "User-Agent", 10);
            if (!is_ign_hdr) { /* other header */
                strcat(other_hdr, buf);
            }
        }
    }
    /* Default Host header */
    if (!strlen(host_hdr)) sprintf(host_hdr, "Host: %s\r\n", hostname);

    /* Output headers into new_hdr */
    sprintf(new_hdr, "%s%s%s%s%s%s%s", req_hdr, host_hdr, con_hdr, pxycon_hdr,
            user_agent_hdr, other_hdr, "\r\n");

    if (!strlen(new_hdr)) return -1;
    return 0;
}
/* $end gen_http_hdr */

/*
 * clienterror - returns an error message to the client
 */
/* $begin clienterror */
void clienterror(int fd, char *cause, char *errnum, char *shortmsg,
                 char *longmsg) {
    char buf[MAXLINE], body[MAXBUF];

    /* Build the HTTP response body */
    sprintf(body, "<html><title>Proxy Error</title>");
    sprintf(body,
            "%s<body bgcolor="
            "ffffff"
            ">\r\n",
            body);
    sprintf(body, "%s%s: %s\r\n", body, errnum, shortmsg);
    sprintf(body, "%s<p>%s: %s\r\n", body, longmsg, cause);
    sprintf(body, "%s<hr><em>The Proxy server</em>\r\n", body);

    /* Print the HTTP response */
    sprintf(buf, "HTTP/1.0 %s %s\r\n", errnum, shortmsg);
    Rio_writen(fd, buf, strlen(buf));
    sprintf(buf, "Content-type: text/html\r\n");
    Rio_writen(fd, buf, strlen(buf));
    sprintf(buf, "Content-length: %d\r\n\r\n", (int)strlen(body));
    Rio_writen(fd, buf, strlen(buf));
    Rio_writen(fd, body, strlen(body));
}
/* $end clienterror */

/* Helper routines */
/*
 * Pthread_sigmask - Wrapper function of pthread_sigmask
 */
int Pthread_sigmask(int how, const sigset_t *set, sigset_t *oldset) {
    int rc;

    if ((rc = pthread_sigmask(how, set, oldset)) != 0)
        posix_error(rc, "Pthread_sigmask error");
    return rc;
}