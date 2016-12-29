#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void factoriPrimi(int number)
{
	int div = 2;

	while(number!=0){
        if(number%div!=0)
            div = div + 1;
        else {
            number = number / div;
            printf("%d ",div);
            if(number==1)
                break;
        }
    }
}

int main(int argc, char *argv[])
{
	if(argc == 2)
	{
		int a, sum;
		a = strtol(argv[1], (char **)NULL, 10);
		printf("The number is %d \n", a);
		printf("Descompunere : ");
		factoriPrimi(a);
		
		
	}
	else
	{	
	printf("You have to pass one argument!");
	}
	return 0;
}
