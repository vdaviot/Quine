SRC_NAME = Sully.asm
SRC_PATH = ./
OBJ_PATH = ./
OBJ_NAME = $(SRC_NAME:.asm=.o)

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

CC = clang
CFLAGS = -Wall -Wextra -Werror
NAME = Sully

CCA = /Users/vdaviot/homebrew/bin/nasm
CAFLAGS = -f macho64
ASM_EXE = Sully

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJ)
	@printf "%-50s" "create executable "$(notdir $@)...
	@$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	@printf "\e[1;32m[OK]\e[0m\n"

$(OBJ_PATH)%.o: $(SRC_PATH)%.asm
	@printf "%-50s" "compiling "$(notdir $<)...
	@$(CCA) $(CAFLAGS) $(SRC_NAME)
	@printf "\e[1;32m[OK]\e[0m\n"

clean:
	@printf "%-50s" "deleting objects..."
	@$(RM) $(OBJ_NAME)
	@printf "\e[1;32m[OK]\e[0m\n"

fclean: clean
	@printf "%-50s" "deleting executable..."
	@$(RM) $(ASM_EXE)
	@$(RM) $(OBJ_NAME)  Sully_5 Sully_4 Sully_3 Sully_2 Sully_1 Sully_0 Sully_5.asm Sully_4.asm Sully_3.asm Sully_2.asm Sully_1.asm Sully_0.asm Sully5 Sully_5.o Sully_4.o Sully_3.o Sully_2.o Sully_1.o Sully_0.o
	@printf "\e[1;32m[OK]\e[0m\n"

re: fclean all
