SRC_NAME = Sully.c
SRC_PATH = ./
OBJ_PATH = ./
INC_PATH = ./
OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

CC = clang
CFLAGS = -Wall -Wextra -Werror
NAME = Sully

CCA = nasm
CAFLAGS = -Wall -Wextra -Werror
ASM_EXE = Sully_ASM

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJ)
	@printf "%-50s" "create executable "$(notdir $@)...
	@$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	@printf "\e[1;32m[OK]\e[0m\n"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@printf "%-50s" "compiling "$(notdir $<)...
	@mkdir -p $(OBJ_PATH)
	@$(CC) $(CFLAGS) -o $@ -c $<
	@printf "\e[1;32m[OK]\e[0m\n"

clean:
	@printf "%-50s" "deleting objects..."
	@$(RM) $(OBJ) Sully_0 Sully_1 Sully_2 Sully_3 Sully_4 Sully_5 Sully_0.o Sully_1.o Sully_2.o Sully_3.o Sully_4.o Sully_5.o Sully_0.c Sully_1.c Sully_2.c Sully_3.c Sully_4.c Sully_5.c
	@printf "\e[1;32m[OK]\e[0m\n"

fclean: clean
	@printf "%-50s" "deleting executable..."
	@$(RM) $(NAME)
	@printf "\e[1;32m[OK]\e[0m\n"

re: fclean all

