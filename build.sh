sudo apt-get update
sudo apt-get upgrade
sudo apt-get install make git zlib1g-dev libssl-dev gperf cmake clang libc++-dev libc++abi-dev php-cli
git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
rm -rf build
mkdir build
cd build
CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
cmake --build . --target prepare_cross_compiling
cd ../td
php SplitSource.php
cd ../build
cmake --build . --target install
cd ../td
php SplitSource.php --undo
cd ../..
ls -l telegram-bot-api/bin/telegram-bot-api*