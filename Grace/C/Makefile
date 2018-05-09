SRC_NAME = Grace.c
SRC_PATH = ./
OBJ_PATH = ./
INC_PATH = ./
OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

CC = clang
CFLAGS = -Wall -Wextra -Werror
NAME = Grace

CCA = nasm
CAFLAGS = -Wall -Wextra -Werror
ASM_EXE = Grace_ASM

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

asm:
	@nasm -Wall -Werror -Wextra ASM/Grace.s
	@printf "\e[1;32m[OK]\e[0m\n"

clean:
	@printf "%-50s" "deleting objects..."
	@$(RM) $(OBJ) Grace_kid.c
	@printf "\e[1;32m[OK]\e[0m\n"

fclean: clean
	@printf "%-50s" "deleting executable..."
	@$(RM) $(NAME)
	@printf "\e[1;32m[OK]\e[0m\n"

re: fclean all
