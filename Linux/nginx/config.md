#example nginx.conf       
       
       user www www;
       worker_processes auto;
       
       #error_log /data/wwwlogs/error_nginx.log crit;
       error_log /data/wwwlogs/error_nginx.log debug;
       pid /var/run/nginx.pid;
       worker_rlimit_nofile 51200;
       
       events {
         use epoll;
         worker_connections 51200;
         multi_accept on;
       }
       
       http {
         include mime.types;
         default_type application/octet-stream;
         server_names_hash_bucket_size 128;
         client_header_buffer_size 32k;
         large_client_header_buffers 4 32k;
         client_max_body_size 1024m;
         client_body_buffer_size 10m;
         sendfile on;
         tcp_nopush on;
         keepalive_timeout 120;
         server_tokens off;
         tcp_nodelay on;
       
         fastcgi_connect_timeout 300;
         fastcgi_send_timeout 300;
         fastcgi_read_timeout 300;
         fastcgi_buffer_size 64k;
         fastcgi_buffers 4 64k;
         fastcgi_busy_buffers_size 128k;
         fastcgi_temp_file_write_size 128k;
         fastcgi_intercept_errors on;
       
         #Gzip Compression
         gzip on;
         gzip_buffers 16 8k;
         gzip_comp_level 6;
         gzip_http_version 1.1;
         gzip_min_length 256;
         gzip_proxied any;
         gzip_vary on;
         gzip_types
           text/xml application/xml application/atom+xml application/rss+xml application/xhtml+xml image/svg+xml
           text/javascript application/javascript application/x-javascript
           text/x-json application/json application/x-web-app-manifest+json
           text/css text/plain text/x-component
           font/opentype application/x-font-ttf application/vnd.ms-fontobject
           image/x-icon;
         gzip_disable "MSIE [1-6]\.(?!.*SV1)";
       
         #If you have a lot of static files to serve through Nginx then caching of the files' metadata (not the actual files' contents) can save some latency.
         open_file_cache max=1000 inactive=20s;
         open_file_cache_valid 30s;
         open_file_cache_min_uses 2;
         open_file_cache_errors on;
       
       ######################## default ############################
         server {
           listen 80;
           server_name test.api.tagoyou.com;
           access_log /data/wwwlogs/access_nginx.log combined;
           root /data/wwwroot/tagoapp/public;
           index index.html index.htm index.php;
           #error_page 404 /404.html;
           #error_page 502 /502.html;
           location /nginx_status {
             stub_status on;
             access_log off;
             allow 127.0.0.1;
             deny all;
           }
            location / {
       	try_files $uri $uri/ /index.php?$query_string;
           }
           location ~ [^/]\.php(/|$) {
             #fastcgi_pass remote_php_ip:9000;
             fastcgi_pass unix:/dev/shm/php-cgi.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
           }
           location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
             expires 30d;
             access_log off;
           }
           location ~ .*\.(js|css)?$ {
             expires 7d;
             access_log off;
           }
           location ~ /\.ht {
             deny all;
           }
          
         }
       server {
           listen 80;
           server_name test.cms.tagoyou.com;
           access_log /data/wwwlogs/access_nginx.log combined;
           root /data/wwwroot/test.tagocms.com/public;
           index index.html index.htm index.php;
           #error_page 404 /404.html;
           #error_page 502 /502.html;
           location /nginx_status {
             stub_status on;
             access_log off;
             allow 127.0.0.1;
             deny all;
           }
           location / {
                if (!-e $request_filename){
                     rewrite ^/(.*)$ /index.php/$1 last;
                }
           }
           location ~ [^/]\.php(/|$) {
             #fastcgi_pass remote_php_ip:9000;
             fastcgi_pass unix:/dev/shm/php-cgi.sock;
             fastcgi_index index.php;
             fastcgi_split_path_info ^(.+?\.php)(/.*)$;
             set $path_info $fastcgi_path_info;
             fastcgi_param PATH_INFO       $path_info;
             try_files $fastcgi_script_name =404;
             include fastcgi.conf;
           }
           location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
             expires 30d;
             access_log off;
           }
           location ~ .*\.(js|css)?$ {
             expires 7d;
             access_log off;
           }
           location ~ /\.ht {
             deny all;
           }
           
       
         }
       server {
           listen 80;
           server_name cms.tagoyou.com;
           access_log /data/wwwlogs/access_nginx.log combined;
           root /data/wwwroot/www.tagocms.com;
           index index.html index.htm index.php;
           #error_page 404 /404.html;
           #error_page 502 /502.html;
           location /nginx_status {
             stub_status on;
             access_log off;
             allow 127.0.0.1;
             deny all;
           }
           location / {
       	try_files $uri $uri/ /index.php?$query_string;
           }
           location ~ [^/]\.php(/|$) {
             #fastcgi_pass remote_php_ip:9000;
             fastcgi_pass unix:/dev/shm/php-cgi.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
           }
           location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
             expires 30d;
             access_log off;
           }
           location ~ .*\.(js|css)?$ {
             expires 7d;
             access_log off;
           }
           location ~ /\.ht {
             deny all;
           }
           
         }
       
         server {
           listen 80;
           server_name test.www.tagoyou.com;
           access_log /data/wwwlogs/access_nginx.log combined;
           root /data/wwwroot/tagowww;
           index index.html index.htm index.php;
           #error_page 404 /404.html;
           #error_page 502 /502.html;
           location /nginx_status {
             stub_status on;
             access_log off;
             allow 127.0.0.1;
             deny all;
           }
            location / {
       	try_files $uri $uri/ /index.php?$query_string;
           }
           location ~ [^/]\.php(/|$) {
             #fastcgi_pass remote_php_ip:9000;
             fastcgi_pass unix:/dev/shm/php-cgi.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
           }
           location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
             expires 30d;
             access_log off;
           }
           location ~ .*\.(js|css)?$ {
             expires 7d;
             access_log off;
           }
           location ~ /\.ht {
             deny all;
           }
          
         }
       
         server {
           listen 80;
           server_name doc.tagoyou.com;
           access_log /data/wwwlogs/access_nginx.log combined;
           root /data/wwwroot/showdoc;
           index index.html index.htm index.php;
           #error_page 404 /404.html;
           #error_page 502 /502.html;
           location /nginx_status {
             stub_status on;
             access_log off;
             allow 127.0.0.1;
             deny all;
           }
           try_files $uri $uri/ @rewrite;  
              
            location @rewrite {  
                rewrite ^(.*)$ /index.php?_url=$1;  
            } 
           location ~ [^/]\.php(/|$) {
             #fastcgi_pass remote_php_ip:9000;
             fastcgi_pass unix:/dev/shm/php-cgi.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
           }
           location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
             expires 30d;
             access_log off;
           }
           location ~ .*\.(js|css)?$ {
             expires 7d;
             access_log off;
           }
           location ~ /\.ht {
             deny all;
           }
          
         }
       
        server {
           listen 80;
           server_name test.api3.tagoyou.com;
           access_log /data/wwwlogs/access_nginx.log combined;
           root /data/wwwroot/tagoappV3/public;
           index index.html index.htm index.php;
           #error_page 404 /404.html;
           #error_page 502 /502.html;
           location /nginx_status {
             stub_status on;
             access_log off;
             allow 127.0.0.1;
             deny all;
           }
            location / {
       	try_files $uri $uri/ /index.php?$query_string;
           }
           location ~ [^/]\.php(/|$) {
             #fastcgi_pass remote_php_ip:9000;
             fastcgi_pass unix:/dev/shm/php-cgi.sock;
             fastcgi_index index.php;
             include fastcgi.conf;
           }
           location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
             expires 30d;
             access_log off;
           }
           location ~ .*\.(js|css)?$ {
             expires 7d;
             access_log off;
           }
           location ~ /\.ht {
             deny all;
           }
          
         }
       
       
       
       
       
       
       
       ########################## vhost #############################
         include vhost/*.conf;
       }
