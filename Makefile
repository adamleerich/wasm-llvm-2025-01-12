.SUFFIXES:  # Disable implicit rules

.PRECIOUS: %.ll %.o %.s  # Prevent deletion of intermediate files

# Comments
#   .ll      LLVM Intermediate Representation (text)
#   .s       WebAssembly Assembly Code (text)
#   .o       WebAssembly Object File (binary)
#   .wasm    Final WebAssembly Module (binary)


%.ll: %.c
	clang --target=wasm32 -nostdlib -O3 -flto -S -emit-llvm -o $@ $<

%.s: %.ll
	llc -march=wasm32 -O3 -filetype=asm -o $@ $<

%.o: %.ll
	llc -march=wasm32 -O3 -filetype=obj -o $@ $<

%.wasm: %.o %.s
	wasm-ld $< --no-entry --export-all --lto-O3 -z stack-size=8388608 -o $@

clean:
	rm -f *.ll *.o *.s *.wasm
