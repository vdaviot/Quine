#include <stdio.h>

/*
	Quine the conqueror!
*/

#define VICCI "#include <stdio.h>%c%c/*%c%cQuine the conqueror!%c*/%c%c#define VICCI %c%s%c%c#define VIDDI(fd) fprintf(fd, VICCI, 10, 10, 10, 9, 10, 10, 10, 34, VICCI, 34, 10, 10, 34, 34, 34, 34, 10);fclose(fd);%c#define VENI int main(){FILE * fd = fopen(%cGrace_kid.c%c, %cw%c); VIDDI(fd);return 0;}%cVENI;"
#define VIDDI(fd) fprintf(fd, VICCI, 10, 10, 10, 9, 10, 10, 10, 34, VICCI, 34, 10, 10, 34, 34, 34, 34, 10);fclose(fd);
#define VENI int main(){FILE * fd = fopen("Grace_kid.c", "w"); VIDDI(fd);return 0;}
VENI;

