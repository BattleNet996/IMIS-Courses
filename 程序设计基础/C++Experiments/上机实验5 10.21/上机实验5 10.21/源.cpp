
#include <iostream>
using namespace std;

void f(int num);

int main()
{	
	int num;
	cout << "Please input a number" << endl;
	cin >> num;
	cout << num << "=" ;
	f(num);
	return 0;
}

void f(int num)
{
	if((num-int(num)==0) & (num >0))
	{
		if (num < 8)
		{
			cout << num % 8;
		}
		else
		{
			f(num/8);
			cout << num % 8;
		}
	}
	else{
		cout << "data error"<<endl;
	}

	return;
}



/*
TEST 2 ���õ¶���ʽ

#include <iostream>
using namespace std;

double P(double x, int n);

int main()
{
	double x;
	int n;
	cout << "Please input x & n" << endl;
	cin >> x >> n;
	cout <<  "The result is" << " "<<P(x,n)<<endl ;
	return 0;
}

double P(double x, int n)
{
	double result;
	if (n = 0)
	{
		result = 1;
		return result;
	}
	else if (n = 1)
	{
		result = x;
	}
	else if (n > 1)
	{
		result = ((2 * n - 1) * x - P(x, n - 1) - (n - 1) * P(x, n - 2)) / n;
		return result;
	}
}
*/

/*
#include <iostream>
using namespace std;

void Get_Method(int x, int y);

int main()
{
	int x, y;
	cout << "Please input3�ֺ�5�ֵ���Ʊ���� x & y" << endl;
	cin >> x >> y;
	Get_Method(x, y);
	return 0;
}

void Get_Method(int x, int y)
{
	int i,j,result;
	for (i = 0; i <= x; i++)
	{
		for (j = 0;j <= y;j++)
		{
			if (i + j != 0) {
				result = 3 * i + 5 * j;
				cout << i << "��3��" <<"+"<< j << "��5�ֿɵ�����  " << result << "��" << endl;
			}
			
		}
	}
	return;
}
*/