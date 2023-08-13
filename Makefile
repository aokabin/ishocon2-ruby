pull:
	git pull origin main

set-file: pull
	sudo cp nginx.conf /etc/nginx/nginx.conf
	sudo cp mysql.conf.d/mysqld.conf /etc/mysql/mysql.conf.d/mysqld.cnf

reset-nginx:
	sudo rm /var/log/nginx/access.log && sudo systemctl restart nginx

restart: set-file reset-nginx
	sudo rm /var/log/mysql-slow.log
	sudo systemctl restart ishocon nginx mysql

slow:
	sudo mysqldumpslow /var/log/mysql/mysql-slow.log
