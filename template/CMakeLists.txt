cmake_minimum_required(VERSION 3.16)

# Possible values: openocd, pyocd, stlink, blackmagic. stlink is default
# set(CMX_DEBUGGER "openocd")
# set(OPENOCD_CFG "${CMAKE_CURRENT_SOURCE_DIR}/openocd.cfg")

include(cubemx.cmake/cubemx.cmake)

get_filename_component(CURRENT_DIR_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${CURRENT_DIR_NAME})

# Set project sources
set(PROJECT_SOURCES
    "Core/Src/main.c"
    "app/src/app.c"
)

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})
cubemx_target(
    TARGET ${PROJECT_NAME}
    IOC "${CMAKE_CURRENT_LIST_DIR}/${PROJECT_NAME}.ioc"
)
target_compile_options(${PROJECT_NAME} PRIVATE -Og -Wall -g -gdwarf-2)

# Depending on the project setup, sometimes one of these symbols must be omitted. (Cannot be reliably determined from the .ioc file)
target_compile_definitions(${PROJECT_NAME} PRIVATE USE_FULL_LL_DRIVER USE_HAL_DRIVER)

target_include_directories(${PROJECT_NAME} PRIVATE "app/inc")

