SRCS = srcs/Docker-compose.yml

all : build up

up : ${SRCS}
	@sudo docker-compose -f ${SRCS} up 

build : ${SRCS}
	@mkdir -p /home/maboulho/data/db /home/maboulho/data/wp
	@sudo docker-compose -f ${SRCS} build

down :
	@sudo docker-compose -f ${SRCS} down
	
clean :
	@sudo docker system prune -af
	# docker volume rm $(docker volume ls -q)

fclean: clean
	sudo rm -rf /home/maboulho/data

re: fclean build up

.PHONY: all up build down clean fclean