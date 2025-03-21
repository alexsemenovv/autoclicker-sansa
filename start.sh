#!/bin/bash

echo "Запускаю Xvfb..."
Xvfb :99 -screen 0 1280x720x24 &
sleep 3

echo "Запускаю fluxbox..."
fluxbox &
sleep 3

echo "Запускаю x11vnc..."
x11vnc -display :99 -forever -nopw -listen 0.0.0.0 -xkb -cursor arrow &
sleep 3

echo "Запускаю xterm для теста..."
xterm &
sleep 2

echo "Запускаю Firefox..."
firefox &
sleep 10

echo "Запускаю бота..."
python3 app/bot.py

# Держим контейнер активным
tail -f /dev/null