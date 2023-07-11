# stm32l496zg-repo-setup

1. Copy the contents of the [Template](template/) to a STM32L496ZG CubeMX project
2. Run ```./do-repo-setup.sh``` from the project root
3. Open the project folder in vscode and start the devcontainer
4. Build with CMake extension
5. Flash with st-flash (vscode task)
6. Debug with cortex-debug extension

## Notes

- [do-repo-setup.sh](template/do-repo-setup.sh)
  - initialises git
  - clones a required cmake repo
  - adds '#include app.h' to Core/Src/main.c
  - adds 'app();' to Core/Src/main.c
- clang-format is only applied to items within the [app](template/app/) directory
- Devcontainer includes all required dependencies to build, flash and debug using VSCode or a docker/podman/distrobox container
- Thanks to patrislav1 for [cubemx.cmake](https://github.com/patrislav1/cubemx.cmake), a collection of lightweight CMake and Python scripts that can build STM32 CubeMX projects with CMake and set up VSCode for editing/building/debugging.
