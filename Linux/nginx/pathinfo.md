#支持pathinfo

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