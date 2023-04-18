##
##EPITECHPROJECT,2021
##undefined
##Filedescription:
##Makefile
##


SRC			=		strnlen.asm		\
					putstr.asm		\
					

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

.PHONY:		all clean fclean re