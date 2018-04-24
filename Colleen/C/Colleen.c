#include <stdio.h>

/*
	My Beatifull Quine
*/

char * getQuine(void){return "#include <stdio.h>%c%c/*%c%cMy Beatifull Quine%c*/%c%cchar * getQuine(void){return %c%s%c;}%c%cint main()%c{%c/*%c%cSuch a doctor!%c*/%cchar * a = getQuine();%cprintf(a, 10, 10, 10, 9, 10, 10, 10, 34, a, 34, 10, 10, 10, 10, 10, 9,  10, 10, 10, 10, 10);%creturn 0;%c}";}

int main()
{
/*
	Such a doctor!
*/
char * a = getQuine();
printf(a, 10, 10, 10, 9, 10, 10, 10, 34, a, 34, 10, 10, 10, 10, 10, 9,  10, 10, 10, 10, 10);
return 0;
}