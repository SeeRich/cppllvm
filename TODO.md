* Fix the following error when adding `openmp` to `LLVM_ENABLE_RUNTIMES`
```
#14 4045.4 [1818/2002] Building CXX object libcxxabi/src/CMakeFiles/cxxabi_static_objects.dir/private_typeinfo.cpp.o
#14 4045.5 [1819/2002] Building CXX object openmp/runtime/src/CMakeFiles/omp.dir/kmp_ftn_cdecl.cpp.o
#14 4045.6 [1820/2002] Linking C shared library openmp/runtime/src/libomp.so
#14 4045.6 FAILED: [code=1] openmp/runtime/src/libomp.so
#14 4045.6 : && /tmp/llvm-project/build/bin/clang --target=aarch64-unknown-linux-gnu -fPIC -fPIC -fno-semantic-interposition -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra -Wno-unused-parameter -Wwrite-strings -Wcast-qual -Wmissing-field-initializers -Wimplicit-fallthrough -Wcovered-switch-default -Wstring-conversion -Wmisleading-indentation -Wctad-maybe-unsupported -fdiagnostics-color -ffunction-sections -fdata-sections -Wall -fcolor-diagnostics -Wcast-qual -Wformat-pedantic -Wimplicit-fallthrough -Wsign-compare -Wno-extra -Wno-pedantic -fno-semantic-interposition -fdata-sections -O3 -DNDEBUG  -shared  -Wl,-z,defs -Wl,-z,nodelete -Wl,--color-diagnostics -Wl,--as-needed -Wl,--version-script=/tmp/llvm-project/openmp/runtime/src/exports_so.txt -static-libgcc -Wl,-z,noexecstack -Wl,-soname,libomp.so -o openmp/runtime/src/libomp.so openmp/runtime/src/CMakeFiles/omp.dir/kmp_alloc.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_atomic.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_csupport.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_debug.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_itt.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_environment.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_error.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_global.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_i18n.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_io.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_runtime.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_settings.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_str.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_tasking.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_threadprivate.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_utility.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_barrier.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_wait_release.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_affinity.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_dispatch.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_lock.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_sched.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_collapse.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/z_Linux_util.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_gsupport.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/thirdparty/ittnotify/ittnotify_static.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_taskdeps.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_cancel.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_ftn_cdecl.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_ftn_extra.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/kmp_version.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/ompt-general.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/ompd-specific.cpp.o openmp/runtime/src/CMakeFiles/omp.dir/z_Linux_asm.S.o  -lm  -ldl && cd /tmp/llvm-project/build/runtimes/runtimes-bins/openmp/runtime/src && /opt/venv/lib/python3.12/site-packages/cmake/data/bin/cmake -E create_symlink libomp.so libgomp.so && /opt/venv/lib/python3.12/site-packages/cmake/data/bin/cmake -E create_symlink libomp.so libiomp5.so && cd /tmp/llvm-project/build/runtimes/runtimes-bins/openmp/runtime/src && /opt/venv/lib/python3.12/site-packages/cmake/data/bin/cmake -E create_symlink libomp.so libgomp.so.1
#14 4045.6 ld.lld: error: unable to find library -l:libunwind.a
#14 4045.6 ld.lld: error: unable to find library -l:libunwind.a
#14 4045.6 clang: error: linker command failed with exit code 1 (use -v to see invocation)
#14 4045.6 [1821/2002] Building CXX object openmp/libompd/src/CMakeFiles/ompd.dir/omp-state.cpp.o
#14 4046.0 [1822/2002] Building CXX object libcxxabi/src/CMakeFiles/cxxabi_static_objects.dir/stdlib_stdexcept.cpp.o
#14 4046.1 [1823/2002] Building CXX object libcxxabi/src/CMakeFiles/cxxabi_static_objects.dir/cxa_exception.cpp.o
#14 4049.8 [1824/2002] Building CXX object openmp/libompd/src/CMakeFiles/ompd.dir/omp-debug.cpp.o
#14 4050.1 [1825/2002] Building CXX object openmp/libompd/src/CMakeFiles/ompd.dir/TargetValue.cpp.o
#14 4050.9 [1826/2002] Building CXX object libcxx/src/CMakeFiles/cxx_experimental.dir/experimental/chrono_exception.cpp.o
#14 4053.2 [1827/2002] Building CXX object libcxx/src/CMakeFiles/cxx_experimental.dir/experimental/tzdb_list.cpp.o
#14 4053.8 [1828/2002] Building CXX object openmp/tools/archer/CMakeFiles/archer.dir/ompt-tsan.cpp.o
#14 4054.6 [1829/2002] Building CXX object openmp/tools/archer/CMakeFiles/archer_static.dir/ompt-tsan.cpp.o
#14 4055.5 [1830/2002] Building CXX object libcxxabi/src/CMakeFiles/cxxabi_static_objects.dir/cxa_demangle.cpp.o
#14 4056.8 [1831/2002] Building CXX object libcxx/src/CMakeFiles/cxx_shared.dir/locale.cpp.o
#14 4063.6 [1832/2002] Building CXX object libcxx/src/CMakeFiles/cxx_experimental.dir/experimental/tzdb.cpp.o
#14 4063.9 [1833/2002] Building CXX object libcxx/src/CMakeFiles/cxx_experimental.dir/experimental/time_zone.cpp.o
#14 4063.9 ninja: build stopped: subcommand failed.
#14 4064.0 [5739/6210] Building C object tools/clang/tools/c-index-test/CMakeFiles/c-index-test.dir/c-index-test.c.o
#14 4064.0 In file included from /tmp/llvm-project/clang/include/clang-c/Documentation.h:20,
#14 4064.0                  from /tmp/llvm-project/clang/tools/c-index-test/c-index-test.c:10:
#14 4064.0 /tmp/llvm-project/clang/include/clang-c/Index.h:6964:1: warning: ‘CXRemapping’ is deprecated [-Wdeprecated-declarations]
#14 4064.0  6964 | CINDEX_DEPRECATED CINDEX_LINKAGE unsigned clang_remap_getNumFiles(CXRemapping);
#14 4064.0       | ^~~~~~~~~~~~~~~~~
#14 4064.0 /tmp/llvm-project/clang/include/clang-c/Index.h:6967:1: warning: ‘CXRemapping’ is deprecated [-Wdeprecated-declarations]
#14 4064.0  6967 | clang_remap_getFilenames(CXRemapping, unsigned, CXString *, CXString *);
#14 4064.0       | ^~~~~~~~~~~~~~~~~~~~~~~~
#14 4064.0 /tmp/llvm-project/clang/include/clang-c/Index.h:6969:1: warning: ‘CXRemapping’ is deprecated [-Wdeprecated-declarations]
#14 4064.0  6969 | CINDEX_DEPRECATED CINDEX_LINKAGE void clang_remap_dispose(CXRemapping);
#14 4064.0       | ^~~~~~~~~~~~~~~~~
#14 4064.0 [5751/6210] Building CXX object tools/clang/tools/clang-scan-deps/CMakeFiles/clang-scan-deps.dir/ClangScanDeps.cpp.o
#14 4064.0 In file included from /tmp/llvm-project/clang/include/clang/Tooling/DependencyScanning/ModuleDepCollector.h:19,
#14 4064.0                  from /tmp/llvm-project/clang/include/clang/Tooling/DependencyScanning/DependencyScanningWorker.h:17,
#14 4064.0                  from /tmp/llvm-project/clang/include/clang/Tooling/DependencyScanning/DependencyScanningTool.h:13,
#14 4064.0                  from /tmp/llvm-project/clang/tools/clang-scan-deps/ClangScanDeps.cpp:15:
#14 4064.0 /tmp/llvm-project/clang/include/clang/Serialization/ASTReader.h:245:16: warning: ‘virtual bool clang::ASTReaderListener::visitInputFile(llvm::StringRef, llvm::StringRef, bool, bool, bool)’ was hidden [-Woverloaded-virtual=]
#14 4064.0   245 |   virtual bool visitInputFile(StringRef FilenameAsRequested, StringRef Filename,
#14 4064.0       |                ^~~~~~~~~~~~~~
#14 4064.0 /tmp/llvm-project/clang/include/clang/Serialization/ASTReader.h:306:8: note:   by ‘virtual bool clang::ChainedASTReaderListener::visitInputFile(llvm::StringRef, bool, bool, bool)’
#14 4064.0   306 |   bool visitInputFile(StringRef Filename, bool isSystem,
#14 4064.0       |        ^~~~~~~~~~~~~~
#14 4064.0 [5759/6210] Building CXX object tools/clang/tools/c-index-test/CMakeFiles/c-index-test.dir/core_main.cpp.o
#14 4064.0 In file included from /tmp/llvm-project/clang/tools/c-index-test/core_main.cpp:20:
#14 4064.0 /tmp/llvm-project/clang/include/clang/Serialization/ASTReader.h:245:16: warning: ‘virtual bool clang::ASTReaderListener::visitInputFile(llvm::StringRef, llvm::StringRef, bool, bool, bool)’ was hidden [-Woverloaded-virtual=]
#14 4064.0   245 |   virtual bool visitInputFile(StringRef FilenameAsRequested, StringRef Filename,
#14 4064.0       |                ^~~~~~~~~~~~~~
#14 4064.0 /tmp/llvm-project/clang/include/clang/Serialization/ASTReader.h:306:8: note:   by ‘virtual bool clang::ChainedASTReaderListener::visitInputFile(llvm::StringRef, bool, bool, bool)’
#14 4064.0   306 |   bool visitInputFile(StringRef Filename, bool isSystem,
#14 4064.0       |        ^~~~~~~~~~~~~~
#14 4064.0 [5769/6210] Building CXX object tools/clang/tools/extra/clang-tidy/plugin/CMakeFiles/obj.clangTidyPlugin.dir/ClangTidyPlugin.cpp.o
#14 4064.0 FAILED: [code=1] runtimes/runtimes-stamps/runtimes-build /tmp/llvm-project/build/runtimes/runtimes-stamps/runtimes-build
#14 4064.0 cd /tmp/llvm-project/build/runtimes/runtimes-bins && /opt/venv/lib/python3.12/site-packages/cmake/data/bin/cmake --build .
#14 4067.2 [5771/6210] Building CXX object tools/clang/tools/extra/pp-trace/CMakeFiles/pp-trace.dir/PPCallbacksTracker.cpp.o
#14 4068.6 [5772/6210] Building CXX object tools/clang/tools/extra/modularize/CMakeFiles/modularize.dir/Modularize.cpp.o
#14 4070.3 [5773/6210] Building CXX object tools/clang/tools/extra/clang-include-fixer/plugin/CMakeFiles/obj.clangIncludeFixerPlugin.dir/IncludeFixerPlugin.cpp.o
#14 4071.3 [5774/6210] Building CXX object tools/clang/tools/extra/clang-doc/tool/CMakeFiles/clang-doc.dir/ClangDocMain.cpp.o
#14 4072.7 [5775/6210] Building CXX object tools/clang/tools/extra/pp-trace/CMakeFiles/pp-trace.dir/PPTrace.cpp.o
#14 4072.8 [5776/6210] Building CXX object tools/clang/tools/extra/clang-include-fixer/tool/CMakeFiles/clang-include-fixer.dir/ClangIncludeFixer.cpp.o
#14 4073.9 [5777/6210] Building CXX object tools/clang/tools/extra/clang-change-namespace/tool/CMakeFiles/clang-change-namespace.dir/ClangChangeNamespace.cpp.o
#14 4075.7 [5778/6210] Building CXX object tools/clang/tools/extra/include-cleaner/tool/CMakeFiles/clang-include-cleaner.dir/IncludeCleaner.cpp.o
#14 4078.1 [5779/6210] Building CXX object tools/clang/tools/extra/clang-include-fixer/find-all-symbols/tool/CMakeFiles/find-all-symbols.dir/FindAllSymbolsMain.cpp.o
#14 4079.4 [5780/6210] Building CXX object tools/clang/tools/extra/clang-query/tool/CMakeFiles/clang-query.dir/ClangQuery.cpp.o
#14 4079.6 [5781/6210] Building CXX object tools/clang/tools/extra/clang-move/tool/CMakeFiles/clang-move.dir/ClangMove.cpp.o
#14 4083.2 [5782/6210] Building CXX object tools/clang/tools/extra/tool-template/CMakeFiles/tool-template.dir/ToolTemplate.cpp.o
#14 4090.0 [5783/6210] Building CXX object tools/clang/tools/extra/clangd/refactor/tweaks/CMakeFiles/obj.clangDaemonTweaks.dir/AddUsing.cpp.o
#14 4090.0 ninja: build stopped: subcommand failed.
#14 ERROR: process "/bin/sh -c cd /tmp/llvm-project &&     cmake -B build -S llvm -G Ninja         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr/local/llvm         -DLLVM_ENABLE_PROJECTS=\"clang;clang-tools-extra;lld;lldb;\"         -DLLVM_ENABLE_RUNTIMES=\"libcxx;libcxxabi;libunwind;compiler-rt;openmp\"         -DLLVM_ENABLE_ZSTD=ON         -DLLVM_ENABLE_ZLIB=ON         -DCMAKE_PREFIX_PATH=/usr/lib         -DLIBUNWIND_ENABLE_SHARED=OFF         -DLIBUNWIND_ENABLE_STATIC=ON         -DLIBUNWIND_USE_COMPILER_RT=ON         -DCOMPILER_RT_USE_LLVM_UNWINDER=ON         -DLIBCXXABI_ENABLE_SHARED=OFF         -DLIBCXXABI_ENABLE_STATIC=ON         -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON         -DLIBCXXABI_USE_COMPILER_RT=ON         -DLIBCXX_ENABLE_SHARED=ON         -DLIBCXX_ENABLE_STATIC=OFF         -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON         -DLIBCXX_USE_COMPILER_RT=ON         -DCLANG_DEFAULT_LINKER=lld         -DCLANG_DEFAULT_CXX_STDLIB=libc++         -DCLANG_DEFAULT_RTLIB=compiler-rt         -DCLANG_DEFAULT_UNWINDLIB=libunwind         -DLLVM_TARGETS_TO_BUILD=host &&     cmake --build build --target install --parallel &&     rm -rf /tmp/llvm-project" did not complete successfully: exit code: 1
------
 > [8/9] RUN cd /tmp/llvm-project &&     cmake -B build -S llvm -G Ninja         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr/local/llvm         -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb;"         -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind;compiler-rt;openmp"         -DLLVM_ENABLE_ZSTD=ON         -DLLVM_ENABLE_ZLIB=ON         -DCMAKE_PREFIX_PATH=/usr/lib         -DLIBUNWIND_ENABLE_SHARED=OFF         -DLIBUNWIND_ENABLE_STATIC=ON         -DLIBUNWIND_USE_COMPILER_RT=ON         -DCOMPILER_RT_USE_LLVM_UNWINDER=ON         -DLIBCXXABI_ENABLE_SHARED=OFF         -DLIBCXXABI_ENABLE_STATIC=ON         -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON         -DLIBCXXABI_USE_COMPILER_RT=ON         -DLIBCXX_ENABLE_SHARED=ON         -DLIBCXX_ENABLE_STATIC=OFF         -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON         -DLIBCXX_USE_COMPILER_RT=ON         -DCLANG_DEFAULT_LINKER=lld         -DCLANG_DEFAULT_CXX_STDLIB=libc++         -DCLANG_DEFAULT_RTLIB=compiler-rt         -DCLANG_DEFAULT_UNWINDLIB=libunwind         -DLLVM_TARGETS_TO_BUILD=host &&     cmake --build build --target install --parallel &&     rm -rf /tmp/llvm-project:
4072.7 [5775/6210] Building CXX object tools/clang/tools/extra/pp-trace/CMakeFiles/pp-trace.dir/PPTrace.cpp.o
4072.8 [5776/6210] Building CXX object tools/clang/tools/extra/clang-include-fixer/tool/CMakeFiles/clang-include-fixer.dir/ClangIncludeFixer.cpp.o
4073.9 [5777/6210] Building CXX object tools/clang/tools/extra/clang-change-namespace/tool/CMakeFiles/clang-change-namespace.dir/ClangChangeNamespace.cpp.o
4075.7 [5778/6210] Building CXX object tools/clang/tools/extra/include-cleaner/tool/CMakeFiles/clang-include-cleaner.dir/IncludeCleaner.cpp.o
```