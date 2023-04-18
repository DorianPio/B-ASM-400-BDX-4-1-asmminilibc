##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## create
##

TEST_SRC	=	test_strlen.c	\
				test_strcmp.c

TEST_NAME	=	unit_test

tests_run:	$(TEST_SRC)
			$(CC) -o $(TEST_NAME) $(TEST_SRC) -fno-builtin --coverage -lcriterion
			./$(TEST_NAME)

fclean:
			rm -rf *gc*
			rm $(TEST_NAME)