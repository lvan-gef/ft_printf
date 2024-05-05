# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: lvan-gef <lvan-gef@student.codam.n>          +#+                      #
#                                                    +#+                       #
#    Created: 2022/10/25 16:26:47 by lvan-gef      #+#    #+#                  #
#    Updated: 2023/03/02 15:40:58 by lvan-gef      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

CC = gcc
CFLAGS = -c -Wall -Werror -Wextra

# dirs
OBJDIR = obj/

CFILES = ft_printf.c ft_formatter.c ft_writers.c
OBJECTS = $(CFILES:%.c=$(OBJDIR)%.o)
INCLUDE = ft_printf.h
NAME = libftprintf.a
LIB = ar rcs

.PHONY: all clean fclean re

$(NAME): $(OBJECTS) $(INCLUDE)
	$(LIB) $(NAME) $(OBJECTS)

all: $(NAME)

$(OBJDIR)%.o: %.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
