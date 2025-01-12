import fs from 'node:fs';
const wasmBuffer = fs.readFileSync('add.wasm');
const wasmModule = await WebAssembly.instantiate(wasmBuffer);
const { add } = wasmModule.instance.exports; // Uses destructuring assignment
const sum = add(5, 6);
console.log(sum);
