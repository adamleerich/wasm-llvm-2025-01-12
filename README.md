# LLVM, clang, and WebAssembly

Following a [blog post][post] by [Alexander Surma][email].

[post]: https://surma.dev/things/c-to-webassembly/
[email]: surma@surmair.de

## Installers and tools

* [clang+LLVM][1]
* [WebAssembly Binary Toolkit][2]
* [Python][3] for running a simple webserver

[1]: https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/clang+llvm-18.1.8-x86_64-pc-windows-msvc.tar.xz
[2]: https://github.com/WebAssembly/wabt/releases/download/1.0.36/wabt-1.0.36-windows.tar.gz
[3]: https://www.python.org/ftp/python/3.13.1/python-3.13.1-amd64.exe

Tools used on the command line:

* `clang` -- front end compiler that turns C into IR
* `llc` -- back end compiler that turns IR into the target executable type
* `lld` -- LLVM linker
* `wasm-ld` -- LLVM linker specific for WASM targets
* `wasm2wat` -- "Read a file in the WebAssembly binary format, and convert it to the WebAssembly text format"
* `llvm-mc` -- "LLVM machine code playground"
* `wasm-objdump` -- "print information about the contents of Wasm binaries"



## Definitions

LLVM
: Low level virtual machine

clang
: C language front-end for LLVM.
: It compiles C to LLVM intermediate representation.

IR
: intermediate representation

WAT
: WebAssembly Text

wabt
: WebAssembly Binary Toolkit

WebAssembly, Wasm
: "a binary instruction format for a stack-based virtual machine" -- webassembly.org



