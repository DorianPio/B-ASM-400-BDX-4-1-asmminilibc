##
##EPITECHPROJECT,2021
##undefined
##Filedescription:
##Makefile
##


SRC			=		strlen.asm		\
					strchr.asm		\
					memset.asm		\
					memcpy.asm		\
					strcmp.asm		\
					strncmp.asm		\
					strstr.asm		\
					rindex.asm		\
					memmove.asm		\
					strcspn.asm 	\
					strpbrk.asm 	\
					strcasecmp.asm 	\


OBJ2		=	$(SRC2:.cpp=.o)

CC			=		ld

ASM			=		nasm

RM			=		rm -f

NAME		=		libasm.so

OBJ			=		$(SRC:.asm=.o)

CFLAGS		=		-shared
ASMFLAGS	=		-f elf64


%.o: %.asm
			$(ASM) -o $@ $< $(ASMFLAGS)


all:				$(NAME)

$(NAME):			$(OBJ)
			$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

clean:
			$(RM) $(OBJ)

fclean: clean
			$(RM) $(NAME)

re:			fclean all

tests_run:
		cd tests/ && $(MAKE) tests_run

.PHONY:		all clean fclean re