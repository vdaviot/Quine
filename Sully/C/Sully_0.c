#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){
	int nb = 0;
	if (strcmp(__FILE__, "Sully.c") == 0)
		nb = nb + 1;
	if (nb <= 0)
		return 0;
	char * filename;
	FILE * fd;
	char * command;
	char content[] = "#include <stdio.h>%c#include <string.h>%c#include <stdlib.h>%c%cint main(){%c%cint nb = %d;%c%cif (strcmp(__FILE__, %cSully.c%c) == 0)%c%c%cnb = nb + 1;%c%cif (nb <= 0)%c%c%creturn 0;%c%cchar * filename;%c%cFILE * fd;%c%cchar * command;%c%cchar content[] = %c%s%c;%c%c%casprintf(&filename, %cSully_%%d.c%c, nb - 1);%c%cfd = fopen(filename, %cw%c);%c%cfprintf(fd, content, 10, 10, 10, 10, 10, 9, nb - 1, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, content, 34, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 9, 10, 9, 10);%c%cfclose(fd);%c%casprintf(&command, %cgcc -Wall -Wextra -Wall %%s -o Sully && ./Sully%c, filename);%c%cif (nb >= 1)%c%c%csystem(command);%c%creturn 1;%c}";

	asprintf(&filename, "Sully_%d.c", nb - 1);
	fd = fopen(filename, "w");
	fprintf(fd, content, 10, 10, 10, 10, 10, 9, nb - 1, 10, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, content, 34, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 9, 10, 9, 10);
	fclose(fd);
	asprintf(&command, "gcc -Wall -Wextra -Wall %s -o Sully && ./Sully", filename);
	if (nb >= 1)
		system(command);
	return 1;
}