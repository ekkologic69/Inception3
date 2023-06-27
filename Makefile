SRCS = srcs/Docker-compose.yml

all : build up

up : ${SRCS}
	@sudo docker-compose -f ${SRCS} up 

build : ${SRCS}
	@mkdir -p srcs/data/wp srcs/data/db 
	@sudo docker-compose -f ${SRCS} build

down :
	@sudo docker-compose -f ${SRCS} down
	
clean :
	@sudo docker system prune -a 
	# docker volume rm $(docker volume ls -q)

fclean: clean
	sudo rm -rf srcs/data

re: fclean build up

.PHONY: all up build down clean fclean