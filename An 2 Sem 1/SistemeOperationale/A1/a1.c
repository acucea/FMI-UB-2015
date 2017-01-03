#include <stdlib.h>
#include <stdio.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/types.h>

void appendFile(int fd[],int myargc, char c)
{
	if(write(fd[myargc],c , 2) < 2)
		printf("Error writing in file\n");
}

void appendFileInt(int fd[],int myargc, int c)
{
	if(write(fd[myargc],c, 4) < 4)
		printf("Error writing in file\n");
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
		appendFile(fds,myargc,t); 
        printf("%c", t);
        if(t == '\n' && t == '\0') {
            printf("%d", atoi(buffer));
			appendFileInt(fds,myargc,atoi(buffer));
            for(int i=0; i<10; i++) 
                buffer[i]='\0';
            k = 0;
        }
    }
    while (bytes_read != 0); 
}


int myargc;
int fd[50];
int main(int argc, char *argv[])
{
	int i;

	if(argc >= 3)
	{
	myargc = argc;
	fd[argc]= open (argv[i], O_CREAT|O_APPEND|O_WRONLY, 0600);
	if (fd[argc] < 0)
		printf("Error creating file for writing\n ");

	for(i =1; i<=argc-2; i++)
	{
		fd[i] = open (argv[i],O_APPEND|O_RDONLY , 0600);
		
		if (fd[i] < 0)
			printf("Error creating read file descriptor\n");
		else{
			readFile(fd,myargc, fd[i]);
			close(fd[i]);
		}
		
	}

	close(fd[argc]);

	}
	else
	{
	printf("Pass more arguments! \n");
	}
	return 1;
}
