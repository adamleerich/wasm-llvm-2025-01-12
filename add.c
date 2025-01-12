extern unsigned char __heap_base;

// & returns the address of an object in memory
unsigned char* bump_pointer = &__heap_base;

void* malloc2(int n) {
  unsigned char* r = bump_pointer;
  bump_pointer += n;
  return (void *)r;
}

void free(void* p) {
  // lol
}

int add(int a, int b) {
	return a*a + b;
}

int sum(int a[], int len) {
  int sum = 0;
  for(int i = 0; i < len; i++) {
    sum += a[i];
  }
  return sum;
}
