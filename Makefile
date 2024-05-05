# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: lvan-gef <lvan-gef@student.codam.nl>          +#+                     #
#                                                    +#+                       #
#    Created: 2022/10/25 16:26:47 by lvan-gef      #+#    #+#                  #
#    Updated: 2023/03/02 15:40:58 by lvan-gef      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Werror -Wextra

# Root source directory
SRC = src/

# dirs
OBJDIR = obj/

# c files
# CFILES = ft_formatter.c ft_printf.c ft_writers.c
CFILES = $(SRC)ft_formatter.c $(SRC)ft_printf.c $(SRC)ft_writers.c

# objects
OBJECTS = $(CFILES:%.c=$(OBJDIR)%.o)

HEADERS = -I include
NAME = libftprintf.a
LIB = ar rcs

.PHONY: all clean fclean re

$(NAME): $(OBJECTS) $(INCLUDE)
	$(LIB) $(NAME) $(OBJECTS) -s

all: $(NAME)

$(OBJDIR)src%.o: $(SRC)%.c
	@mkdir -p $(OBJDIR)src
	$(CC) $(HEADERS) -c $(CFLAGS) -o $@ $<

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
