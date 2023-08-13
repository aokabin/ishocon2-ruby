pull:
	git pull origin main

set-file: pull
	sudo mv nginx.conf cd /etc/nginx/nginx.conf
	sudo mv mysql.conf.d/mysqld.conf /etc/mysql/mysql.conf.d/mysqld.cnf

reset-nginx:
	sudo rm /var/log/nginx/access.log && sudo systemctl restart nginx

restart: pull set-file reset-nginx
