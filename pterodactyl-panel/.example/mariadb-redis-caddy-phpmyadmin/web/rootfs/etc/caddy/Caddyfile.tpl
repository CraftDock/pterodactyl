{{CADDY_DOMAIN}} {

	root   /var/www/public

	#log /var/log/pterodactyl_access.log {                          # Change path syntax for your OS or your preferred location!
	#	rotate_size 1          # Rotate after 1 MB
	#	rotate_age  7          # Keep log files for 7 days
	#	rotate_keep 2          # Keep at most 2 log files
	#}

	#errors /var/log/pterodactyl_errors.log {                        # Change path syntax for your OS or your preferred location!
	#	rotate_size 1          # Set max size 1 MB
	#	rotate_age  7          # Keep log files for 7 days
	#	rotate_keep 2          # Keep at most 2 log files
	#}

	#log    /var/log/pterodactyl_access.log
	#errors /var/log/pterodactyl_errors.log

	log     stdout
	errors  stdout

	gzip

	fastcgi / {{PHP_FPM_HOST}}:{{PHP_FPM_PORT}} php {
		env PATH /bin
		index index.php
	}

    rewrite {
        r .*
        ext /
        to /index.php?{query}
    }

	# .htaccess / data  shouldn't be accessible from outside
	status 403 {
		/.htacces
		/pterodactyl
		/data
	}

	header / Strict-Transport-Security "max-age=31536000;"
}
