# Howto IoT (Linux)

### update system to have required libs
```
sudo apt update ; sudo apt upgrade -y
sudo apt install -y git cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev ca-certificates
gcc --version
cmake --version
```

### get source from git
```
git clone https://github.com/Azure/azure-iot-sdk-c.git
cd azure-iot-sdk-c
git submodule update --init
cd ..
```

### Configure connection string

to find the files to change
`egrep -r '\[device connection string'` 

### fast compile

you may change a few configuration
- using 10 jobs
- in debug mode
- amqp OFF
- with unit test
```
cd azure-iot-sdk-c
mkdir cmake
cd cmake
cmake ..
cmake --build .  -j 10

cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake -Duse_amqp=OFF ..

cmake -Drun_unittests=ON ..
cmake --build . -j 10
ctest -C "debug" -V
```
