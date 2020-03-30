#include <stdio.h>
#include <stdint.h>

int32_t calcul_reel(int32_t adresse_signal, int k, int32_t adresse_table_cos);
int32_t valeur;
extern int32_t TabCos;
extern int32_t TabSin;
extern int32_t TabSig;
int N=64;
int main(void)
{
calcul_reel(TabSig,3,TabCos);
//for (int i=0; i<64 ; ++i) {
//	valeur = calcul(i);
//	if (valeur > max) max = valeur; //Min = 0x3FFF0001 (notation 2.30) soit 0.9999389657750726
//	if (valeur < min) min = valeur; //Max = 0x40006114 (notation 2.30) soit 1.0000231452286243
//}
while	(1)
	{
	}
}
