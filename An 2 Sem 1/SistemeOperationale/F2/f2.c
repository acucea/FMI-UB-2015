#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool isPrime( int nr)
{
	int i;
	if(nr == 0 || nr == 1)
		return true;
	for(i= 2 ; i< nr/2; i++)
		{
			if(nr % i == 0)
				return false;
		}
	return true;

}

int main(int argc, char *argv[])
{
	if(argc == 2)
	{
		int a;c
		a = strtol(argv[1], (char **)NULL, 10);
		printf("The number is %d \n", a);
		if(isPrime(a) == true)
			printf("%d is prime",a);
		else
			printf("%d is not prime",a);
	}
	else
	{	
	printf("You have to pass one argument!");
	}
	return 0;
}
