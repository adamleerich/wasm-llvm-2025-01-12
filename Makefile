.SUFFIXES:  # Disable implicit rules

.PRECIOUS: %.ll %.o %.s  # Prevent deletion of intermediate files

# Comments
#   .ll      LLVM IR (Intermediate Representation)
#   .s       WebAssembly Assembly Code
#   .o       WebAssembly Object File
#   .wasm    Final WebAssembly Module


%.ll: %.c
	clang --target=wasm32 -O3 -flto -S -emit-llvm -o $@ $<

%.s: %.ll
	llc -march=wasm32 -O3 -filetype=asm -o $@ $<

%.o: %.ll
	llc -march=wasm32 -O3 -filetype=obj -o $@ $<

%.wasm: %.o %.s
	wasm-ld $< --no-entry --export-all --lto-O3 -z stack-size=8388608 -o $@

clean:
	rm -f *.ll *.o *.s *.wasm
