# LLVM, clang, and WebAssembly

Following a [blog post][post] by [Alexander Surma][email].

[post]: https://surma.dev/things/c-to-webassembly/
[email]: surma@surmair.de

## Installers

* [clang+LLVM][1]
* [WebAssembly Binary Toolkit][2]
* [Python][3] for running a simple webserver

[1]: https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/clang+llvm-18.1.8-x86_64-pc-windows-msvc.tar.xz
[2]: https://github.com/WebAssembly/wabt/releases/download/1.0.36/wabt-1.0.36-windows.tar.gz
[3]: https://www.python.org/ftp/python/3.13.1/python-3.13.1-amd64.exe



## Definitions and Tools

| Thing              | Meaning                                                                                      | 
|--------------------|----------------------------------------------------------------------------------------------| 
| `clang`            | C language front-end for LLVM.  It compiles C to LLVM intermediate representation            | 
| IR                 | Intermediate representation                                                                  | 
| `llc`              | back end compiler that turns IR into the target executable type                              | 
| `lld`              | LLVM linker                                                                                  | 
| LLVM               | Low level virtual machine                                                                    | 
| `llvm-mc`          | LLVM machine code playground                                                                 | 
| wabt               | WebAssembly Binary Toolkit                                                                   | 
| `wasm2wat`         | Read a file in the WebAssembly binary format, and convert it to the WebAssembly text format  | 
| `wasm-ld`          | LLVM linker specific for WASM targets                                                        | 
| `wasm-objdump`     | print information about the contents of Wasm binaries                                        | 
| WAT                | WebAssembly Text                                                                             | 
| WebAssembly, Wasm  | "a binary instruction format for a stack-based virtual machine" -- webassembly.org           | 


## Notes on some command line flags


```txt
clang 
    --target=wasm32          # Targets the WebAssembly 32-bit architecture
    -O3                      # Highest optimization level
    -flto                    # Add metadata for link-time optimizations
    -nostdlib                # Don’t try and link against a standard library
    -S                       # State selection = preprocessor + parse + semantic analysis + LLVM generation
    -emit-llvm               # Generates LLVM intermediate language assembly files (_.ll_, text)
    
llc 
    -march=wasm32            # Targets the WebAssembly 32-bit architecture
    -O3                      # Highest optimization level
    -filetype=obj            # Create an object file (_.o_, binary)
    -filetype=asm            # Create a Wasm "assembler" file (_.s_, text)

wasm-ld 
    --no-entry               # No main function
    --export-all             # Export everything
    --lto-O3                 # Highest link-time optimization level
    -z stack-size=8388608    # Set maximum stack size to 8mb
```
