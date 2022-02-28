#include <stdio.h>


void f(){
  int j = 1;
  int b = 2;
}

int main (int argc, char *argv[])
{
  int i, *p, count = 0;
  p = &count;
  f();
  for (i = 0; i < 10; i++) {
  	(*p)++;	//Do you understand this line of code and all the other permutations of the operators? ;)
  }

  printf("Thanks for waddling through this program. Have a nice day.");
  return 0;
}
