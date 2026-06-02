#!/bin/bash

# Очищаем экран и прячем курсор
clear
tput civis

# Возвращаем курсор и сбрасываем цвета при выходе
trap "tput cnorm; tput sgr0; clear; exit" INT TERM

# Массив стандартных ANSI-кодов цветов (без лишних символов экранирования)
COLORS=(31 32 33 34 35 36 91 92 93 94 95 96)

# Кадры анимации
frame1="
   /\_/\  
  ( o.o ) 
   > ^ <  
"
frame2="
   /\_/\  
  ( -.- ) 
   > ~ <  
"
frame3="
   /\_/\  
  ( 0.0 ) 
   > v <  
"

# Используем printf для надежности
printf "\033[1;35mПРИГОТОВЬСЯ К КОТОВЗРЫВУ... (Ctrl+C для выхода)\033[0m\n"
sleep 2

while true; do
    # Выбираем случайный цвет из массива
    RANDOM_COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}
    
    # Кадр 1: \033[...m задает цвет, \033[0m сбрасывает его в конце
    clear
    printf "\033[%sm%s\033[0m\n" "$RANDOM_COLOR" "$frame1"
    sleep 0.2
    
    # Кадр 2
    clear
    printf "\033[%sm%s\033[0m\n" "$RANDOM_COLOR" "$frame2"
    sleep 0.2
    
    # Кадр 3
    clear
    printf "\033[%sm%s\033[0m\n" "$RANDOM_COLOR" "$frame3"
    sleep 0.2
done
