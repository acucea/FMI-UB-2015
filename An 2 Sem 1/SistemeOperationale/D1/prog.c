#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int space = 0;

char* concat(const char *s1, const char *s2)
{
    char *result = malloc(strlen(s1)+strlen(s2)+1);//+1 for the zero-terminator
    //in real code you would check for errors in malloc here
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

void *parse_folder_name(char full_name[])
{
	int i;
	char *pch;
	char folder_name[256] = "";	
	pch=strrchr(full_name,'/');
	/*for (i = pch; i < strlen(full_name); i++){
		printf("%c",full_name[i])
	}*/
	printf("%s",pch+1);
	printf("\n");
	
}

int print_dirs(const char *path, int recursive)
{
	int i;
    struct dirent *direntp = NULL;
    DIR *dirp = NULL;
    size_t path_len;

    /* Check input parameters. */
    if (!path)
        return -1;
    path_len = strlen(path);  

    if (!path || !path_len || (path_len > _POSIX_PATH_MAX))
        return -1;

    /* Open directory */
    dirp = opendir(path);
    if (dirp == NULL)
        return -1;

    while ((direntp = readdir(dirp)) != NULL)
    {
        /* For every directory entry... */
        struct stat fstat;
        char full_name[_POSIX_PATH_MAX + 1];

        /* Calculate full name, check we are in file length limts */
        if ((path_len + strlen(direntp->d_name) + 1) > _POSIX_PATH_MAX)
            continue;

        strcpy(full_name, path);
        if (full_name[path_len - 1] != '/')
            strcat(full_name, "/");
        strcat(full_name, direntp->d_name);

        /* Ignore special directories. */
        if ((strcmp(direntp->d_name, ".") == 0) ||
            (strcmp(direntp->d_name, "..") == 0))
            continue;

        /* Print only if it is really directory. */
        if (stat(full_name, &fstat) < 0)
            continue;
        if (S_ISDIR(fstat.st_mode))
        {
			for(i = 0; i<= space; i++)
				printf("  ");
			parse_folder_name(full_name);
            //printf("%s\n", full_name);
            if (recursive)
			{
				space ++;
                print_dirs(full_name, 1);
			}
        }
    }

    /* Finalize resources. */
    (void)closedir(dirp);
	space --;
    return 0;
}

/* We are taking first argument as initial path name. */
int main(int argc, const char* argv[])
{
    if (argc < 2)
	{
		printf("Give the path of a directory\n");
        return -1;
	}

    print_dirs(argv[1], 1);
    return 0;
}

