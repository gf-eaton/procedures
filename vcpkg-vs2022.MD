# Install vcpkg for VS 2022 (/VS Code) to be used with CMake 3.22+

Time : 20 minutes

## Requirements
  - Git-Bash

## Steps

 - [ ] Make sure you have both VS Pro and VS Code installed and up-to-date
 - [ ] Download cmake 3.22+
 - [ ] Install cmake
 - [ ] Install vcpkg


### Download cmake 3.22+
```
https://cmake.org/download/
```

### Install and config cmake

Just run the setup/msi you downloaded.

### Install vcpkg

 1.  using Git-bash, Clone vcpkg into a directory
```
cd zsource
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.bat -disableMetrics
```

  > Note if you get an error on clone this is due to the config of git (.gitconfig)

 2. Modify environment variables 
  - On Windows, use Windows search for “envir”
  - On Linux, open your .bashrc file and add `export PATH=$PATH:~/vcpkg`
    - Add the vcpkg cloned directory to PATH
    - Set VCPKG_DEFAULT_TRIPLET to `x64-windows` on Windows, or your computers triplet
      + Valid architectures are: `x86`, `x64`, `arm`, `arm64` and `wasm32`
      + Valid OS names are `windows`, `linux`

 3. Enable vcpkg packages to be used in VS/MSBuild:
  - in cmd.exe Run : `vcpkg integrate install`
  - copy the path to vcpkg.cmake for use later similar to 
    - `-DCMAKE_TOOLCHAIN_FILE=C:/Users/E0001234/zsource/vcpkg/scripts/buildsystems/vcpkg.cmake`
