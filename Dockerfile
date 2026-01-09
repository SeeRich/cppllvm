FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential \
    git \
    zstd \
    python3 \
    python3-pip \
    python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Use python to install common c++ tools inside venv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN python3 -m pip install -U pip && \
    python3 -m pip install cmake==4.2.1 ninja==1.13.0 conan==2.24.0

# Build static zlib
ARG ZLIB_VERSION=5a82f71ed1dfc0bec044d9702463dbdf84ea3b71
ADD https://github.com/madler/zlib.git#${ZLIB_VERSION} /tmp/zlib
RUN cd /tmp/zlib && \
    cmake -B build -S . -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DZLIB_BUILD_SHARED=OFF \
        -DZLIB_BUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DCMAKE_INSTALL_LIBDIR=lib && \
    cmake --build build --config Release --target install --verbose && \
    rm -rf /tmp/zlib

# IWYU (include-what-you-use)
ARG IWYU_VERSION=clang_21
ADD https://github.com/include-what-you-use/include-what-you-use.git#${IWYU_VERSION} /tmp/include-what-you-use

ARG LLVM_VERSION=21.1.8
ADD https://github.com/llvm/llvm-project.git#llvmorg-${LLVM_VERSION} /tmp/llvm-project
# SEE: https://github.com/dslm4515/CMLFS/issues/12
# https://github.com/llvm/llvm-project/commit/e0184357fc781e939f4e4368fc8aff692ce227ed
RUN sed -i '/check_library_exists(atomic __atomic_fetch_add_8 "" LIBCXX_HAS_ATOMIC_LIB)/d' \
    /tmp/llvm-project/libcxx/cmake/config-ix.cmake
RUN cd /tmp/llvm-project && \
    cmake -B build -S llvm -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local/llvm \
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb;" \
        -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind;compiler-rt" \
        -DLLVM_ENABLE_ZSTD=ON \
        -DLLVM_ENABLE_ZLIB=ON \
        -DLLVM_EXTERNAL_PROJECTS=iwyu \
        -DLLVM_EXTERNAL_IWYU_SOURCE_DIR=/tmp/include-what-you-use \
        -DCMAKE_PREFIX_PATH=/usr/lib \
        -DLIBUNWIND_ENABLE_SHARED=OFF \
        -DLIBUNWIND_ENABLE_STATIC=ON \
        -DLIBUNWIND_USE_COMPILER_RT=ON \
        -DCOMPILER_RT_USE_LLVM_UNWINDER=ON \
        -DLIBCXXABI_ENABLE_SHARED=OFF \
        -DLIBCXXABI_ENABLE_STATIC=ON \
        -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON \
        -DLIBCXXABI_USE_COMPILER_RT=ON \
        -DLIBCXX_ENABLE_SHARED=ON \
        -DLIBCXX_ENABLE_STATIC=OFF \
        -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
        -DLIBCXX_USE_COMPILER_RT=ON \
        -DCLANG_DEFAULT_LINKER=lld \
        -DCLANG_DEFAULT_CXX_STDLIB=libc++ \
        -DCLANG_DEFAULT_RTLIB=compiler-rt \
        -DCLANG_DEFAULT_UNWINDLIB=libunwind \
        -DLLVM_TARGETS_TO_BUILD=host && \
    cmake --build build --target install --parallel && \
    rm -rf /tmp/llvm-project

# Standalone build of openmp
# Build fails above when adding openmp to LLVM_ENABLE_RUNTIMES
# Installed into /usr because: could not get downstream cmake consumer to find it using find_package(OpenMP)...
ADD https://github.com/llvm/llvm-project.git#llvmorg-${LLVM_VERSION} /tmp/llvm-project
RUN cd /tmp/llvm-project/openmp && \
    cmake -B build -S . -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIBOMP_ENABLE_SHARED=OFF \
        -DCMAKE_C_COMPILER=/usr/local/llvm/bin/clang \
        -DCMAKE_CXX_COMPILER=/usr/local/llvm/bin/clang++ && \
    cmake --build build --target install --parallel && \
    rm -rf /tmp/llvm-project

# Setup usage of clang compiler
RUN update-alternatives --install /usr/bin/clang clang /usr/local/llvm/bin/clang 100 \
    --slave /usr/bin/clang++ clang++ /usr/local/llvm/bin/clang++ \
    --slave /usr/bin/clang-format clang-format /usr/local/llvm/bin/clang-format \
    --slave /usr/bin/clang-tidy clang-tidy /usr/local/llvm/bin/clang-tidy \
    --slave /usr/bin/run-clang-tidy run-clang-tidy /usr/local/llvm/bin/run-clang-tidy \
    --slave /usr/bin/include-what-you-use include-what-you-use /usr/local/llvm/bin/include-what-you-use
ENV CC=/usr/local/llvm/bin/clang CXX=/usr/local/llvm/bin/clang++