REM clang \
REM   --target=wasm32 \ # Target WebAssembly
REM   -emit-llvm \ # Emit LLVM IR (instead of host machine code)
REM   -c \ # Only compile, no linking just yet
REM   -S \ # Emit human-readable assembly rather than binary
REM   add.c
clang --target=wasm32 -emit-llvm -c -S add.c


REM llc \
REM   -march=wasm32 \ # Target WebAssembly
REM   -filetype=obj \ # Output an object file
REM   add.ll
llc -march=wasm32 -filetype=obj add.ll
llc -march=wasm32 add.ll


REM wasm-ld \
REM   --no-entry \ # We don’t have an entry function
REM   --export-all \ # Export everything (for now)
REM   -o add.wasm \
REM   add.o
wasm-ld --no-entry --export-all -o add.wasm add.o



REM clang \
REM   --target=wasm32 \
REM   -nostdlib \ # Don’t try and link against a standard library
REM   -Wl,--no-entry \ # Flags passed to the linker
REM   -Wl,--export-all \
REM   -o add.wasm \
REM   add.c
clang --target=wasm32 -nostdlib -Wl,--no-entry -Wl,--export-all -o add.wasm add.c



REM  clang \
REM    --target=wasm32 \
REM +  -O3 \ # Aggressive optimizations
REM +  -flto \ # Add metadata for link-time optimizations
REM    -nostdlib \
REM    -Wl,--no-entry \
REM    -Wl,--export-all \
REM +  -Wl,--lto-O3 \ # Aggressive link-time optimizations
REM    -o add.wasm \
REM    add.c
clang --target=wasm32 -O3 -flto -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--lto-O3 -o add.wasm add.c



REM  clang \
REM    --target=wasm32 \
REM    -O3 \
REM    -flto \
REM    -nostdlib \
REM    -Wl,--no-entry \
REM    -Wl,--export-all \
REM    -Wl,--lto-O3 \
REM +  -Wl,-z,stack-size=$[8 * 1024 * 1024] \ # Set maximum stack size to 8MiB
REM    -o add.wasm \
REM    add.c
clang --target=wasm32 -O3 -flto -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--lto-O3 -Wl,-z,stack-size=8388608 -o add.wasm add.c
