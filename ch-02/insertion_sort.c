#include <stdio.h>

void setUnsortedArray(long *array, long size);
void printArray(long *array, long size);
void sort(long *array, long size);

int
main() {
  long size = 10;
  long array[size];

  setUnsortedArray(array, size);
  printf("Unsorted Array:");
  printArray(array, size);

  sort(array, size);
  printf("Sorted Array:");
  printArray(array, size);

  return 0;
}

void sort(long *array, long size) {
  for(long j = 1; j < size; j++) {
    long key = array[j];
    long i = j - 1;

    while (i >= 0 && array[i] > key) {
      array[i + 1] = array[i];
      i = i - 1;
    }

    array[i + 1] = key;
  }
}

void setUnsortedArray(long *array, long size) {
  for (long i = size; i > 0; i--) {
    array[size - i] = i;
  }
}

void printArray(long *array, long size) {
  printf("\n");

  for (long i = 0; i < size; i++) {
    printf("%ld ", array[i]);
  }

  printf("\n");
}
