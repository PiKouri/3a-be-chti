#include <stdio.h>
#include <stdint.h>

int32_t calcul(short i);
int32_t valeur;
int32_t min = 0x7FFFFFFF;
int32_t max = 0x00000000;
int main(void)
{
for (int i=0; i<64 ; ++i) {
	valeur = calcul(i);
	if (valeur > max) max = valeur; //Min = 0x3FFF0001 (notation 2.30) soit 0.9999389657750726
	if (valeur < min) min = valeur; //Max = 0x40006114 (notation 2.30) soit 1.0000231452286243
}
while	(1)
	{
	}
}
