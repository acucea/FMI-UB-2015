#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int sumCif(int nr)
{
	int sumaCif= 0;
	int nrCopy = nr;
	while(nrCopy!=0)
	{
		
		sumaCif = sumaCif + (nrCopy % 10);
		
		nrCopy = nrCopy / 10;
		
	}
	return sumaCif;

}

int main(int argc, char *argv[])
{
	if(argc == 2)
	{
		int a, sum;
		a = strtol(argv[1], (char **)NULL, 10);
		printf("The number is %d \n", a);
		sum = sumCif(a);
		printf("The Cif Sum is %d \n", sum);
		
		
	}
	else
	{	
	printf("You have to pass one argument!");
	}
	return 0;
}
