#include <stdlib.h>
#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/types.h>
#include <unistd.h>

void appendFile(int fd[],int myargc, char c)
{
	if(write(fd[myargc], &c , 1) < 1)
	{
		perror("Error writing char in file");
	}
}

void appendFileInt(int fd[],int myargc, int c)
{
	if(write(fd[myargc],&c, 4) < 4)
	{
		perror("Error writing int in file");
	}
}

void readFile(int fds[],int myargc, int fd)
{
    char buffer[10];
    int bytes_read;
    int k = 0;
    do {
        char t = 0;
        bytes_read = read(fd, &t, 1); 
        buffer[k++] = t; 
        printf("%c", t);
		appendFile(fds,myargc,t); 
        /*if(t == '\n' && t == '\0') {
            printf("%d", atoi(buffer));
			appendFileInt(fds,myargc,atoi(buffer));
            for(int i=0; i<10; i++) 
                buffer[i]='\0';
            k = 0;
        }*/
    }
    while (bytes_read != 0); 
}


int fd[50]={0};

int main(int argc, char *argv[])
{
	int i;

	if(argc >= 3)
	{
	argc = argc;
	fd[argc-1]= open (argv[argc-1], O_CREAT|O_APPEND|O_WRONLY, 0700);
	if (fd[argc] < 0)
	{
		perror("Error creating file for writing");
	}
		

	for(i =1; i<=argc-2; i++)
	{
		printf("\n%d %s",i, argv[i]);
	

		fd[i] = open (argv[i], O_RDONLY);
		
		if (fd[i] < 0)
		{
			perror("Error creating read file descriptor");
		}
		else
		{
			readFile(fd,argc-1, fd[i]);
			printf("readFile2)");
			if(close(fd[i]) < 0)
			{
			perror("Close file for reading");
			}
			
		}
		
	}

	if(close(fd[argc])<0)
	perror("Close file for writing");

	}
	else
	{
	printf("Pass more arguments! \n");
	}
	return 1;
}
