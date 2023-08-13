pull:
	git pull origin main

set-file: pull
	sudo cp nginx.conf /etc/nginx/nginx.conf
	sudo cp mysql.conf.d/mysqld.conf /etc/mysql/mysql.conf.d/mysqld.cnf

reset-nginx:
	sudo rm /var/log/nginx/access.log && sudo systemctl restart nginx

restart: pull set-file reset-nginx
	sudo systemctl restart ishocon
