#!/bin/bash -eu
# 
echo "Initialising GIT"
git init -b main

echo "Adding cubemx.cmake"
git submodule add https://github.com/patrislav1/cubemx.cmake.git

echo "Adding app.h to Core/Src/main.c"
sed -i '/\/\* USER CODE BEGIN Includes \*\//a #include "app.h"' Core/Src/main.c

echo "Adding app(); to Core/Src/main.c"
sed -i '/\/\* USER CODE END WHILE \*\//a     app();' Core/Src/main.c
