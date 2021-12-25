/*6.4 求解各位数字立方和等于1099的三位数
#include <iostream>
using namespace std;

void Find_num();

int main() {
	Find_num();
	return 0;
}

void Find_num()
{
	int i, j, k;
	for(i=1;i<10;i++){
		for(j=0;j<10;j++){
			for(k=0;k<10;k++){
				if (i* i* i + j * j * j + k * k * k == 1099)
				{
					cout << i << j << k<<endl;
				}
			}
		}
	}
}
*/

/*6.5 查询满足条件的三角形个数
#include <iostream>
using namespace std;

int Count_tri();

int main() {
	cout << "The num of triangles which follow the rules is" << ' '<<  Count_tri();
	return 0;
}

int Count_tri() {
	int a, b, c, tmp;
	tmp = 0;
	for (c = 3; c < 80; c++)
	{
		for (a = 1;a<c;a++)
		{
			for (b = 1; b < a; b++)
			{
				if((a + b + c < 80) && (a*a+b*b==c*c)){
					tmp += 1;
				}
			}
		}
	}
	return tmp;
}
*/

/* Mersenne Number
#include <iostream>
using namespace std;
#include<cmath>

int Count_M(int n, int m);

int Is_Prime(int n);
	

int main() {
	int n, m;
	cout << "Please enter the  limit" << endl;
	cin >> n >> m;
	cout << "The num of Mersenne Number is" <<" "<< Count_M(n, m) << endl;
	return 0;
}


int Is_Prime(int n)
{
	int i;
	for (i = 2; i <= n / 2; i++)
		if (n % i == 0)
		{
			return 0;
		}
	return 1;
}

int Count_M(int n, int m)
{
	int i, tmp;
	tmp = 0;
	i = n;
	if (n >= m)
	{
		cout << "data error" << endl;
	}
	else {
		for (i; i <= m; i++)
		{
			if (Is_Prime(i)) {
				if ( abs(log2(i+1)-round(log2(i+1))) < 1e-10 &&Is_Prime(log2(i+1))) {
					tmp += 1;
					cout << i << endl;
				}
			}
		}
	}
	return tmp;
}
*/


#include <iostream>
using namespace std;

void Print(int n);

int main() {
	int n;
	cout << "Input the NUm" << endl;
	cin >> n;
	Print(n);
	return 0;
}

void Print(int n)
{
	int i,k;
	for (i = 1; i <= n; i++)
	{
		if (i == (n + 1) / 2) {
			k = 1;
			while (k < (n + 1) / 2) {
				cout << " ";
				k += 1;
			}
			cout << "*";
			cout << endl;
			
		}
		else if (abs(i-((n+1)/2)) % 2 != 0) {
			for (k = 1; k <= n;k++)	
			{
				if (k % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
			cout << endl;
		}
		else if (abs(i - ((n + 1) / 2)) % 2 == 0) {
			for (k = 1; k <= n; k++)
			{
				if (k % 2 != 0 && k!=(n+1)/2) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
			cout << endl;
		}
	}

}
