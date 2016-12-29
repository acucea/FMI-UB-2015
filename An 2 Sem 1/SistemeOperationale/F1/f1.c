#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	if(argc == 3)
	{
		int a,b;
	
		a = strtol(argv[1], (char **)NULL, 10);
		b = strtol(argv[2], (char **)NULL, 10);
		printf("The numbers are: %d and %d\n", a, b);
		while (a != b) {
        		if (a > b)
        		    a = a - b;
        		else
            		b = b - a;
    	}

		printf("The cmmmdc is %d \n", a);
	}
	else
	{	
	printf("You have to pass two arguments!");
	}
	return 0;
}
