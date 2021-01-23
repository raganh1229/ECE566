set -e
clang-11 --version
make -C LectureCode all
pushd .
cd projects/p0 && mkdir build && cd build && cmake -DLLVM_DIR=/usr/local/lib/cmake/llvm .. && cmake --build .
popd
pushd .
mkdir p0-test && cd p0-test && ../wolfbench/configure && make all 
popd
