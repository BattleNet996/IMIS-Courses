/*
//TEST1 ��Բ���ܳ������
#include <iostream>
using namespace std;
//include <math.h>
const double  PI = 3.1415926535;
double cal_Area(double radius);
double cal_zc(double radius);
int main() {
	double radius;
	cout << "������Բ�İ뾶" << endl;
	cin >> radius;
	cout << "Բ���ܳ�Ϊ" << cal_zc(radius) << endl;
	cout << "Բ�����Ϊ" << cal_Area(radius) << endl;
	return 0;
}
double cal_perimeter(double radius) 
{
	double perimeter;
	perimeter = 2 * PI * radius;
	return perimeter;
}
double cal_Area(double radius) 
{
	double area;
	area = PI * radius * radius;
	return area;
}

//TEST 2 һԪ���η������
#include <iostream>
#include <cmath>
using namespace std;
void f(double a, double b, double c); //Call by value | reference

int main() 
{

	return 0;
}
void f(double a, double b, double c) 
{
	double delta, x1, x2;
	if (a)
	{
		delta = sqrt(b * b - 4 * a * c);
		if (delta > 0)
		{
			x1 = (-b + delta) / 2 * a;
			x2 = (-b - delta) / 2 * a;
		}
		else if (delta == 0)
		{
			x1 = x2 = -b / (2 * a);
		}
		else
		{
			x1 = -b / (2 * a);
			x2 = sqrt(delta) / (2 * a);
		}
	}
	else if (b!=0)
	{
		x1 = x2 = -c / b;
	}
	else if (c != 0)
	{
		cout << "error" << endl;
	}
	else
	{
		cout << "too many result" << endl;
	}
	
}
*/

/*
//TEST 3 ��������Ϸ
#include <iostream>
#include <cmath>
using namespace std;

void func(int x1,int x2);
int main()
{
	int x1,x2;
	cout << "����Ա��Ԥ��һ������" << endl;
	cin >> x1;
	cout << "�û�����һ����" << endl;
	cin >> x2;
	func(x1, x2);
	return 0;
}
void func(int x1,int x2)
{
	if (x2 == x1)
	{
		cout << "��¶���";
	}
	else{
		cout << "��´���";
	}
}
*/

/*
//TEST 5 ������ֵ
#include <iostream>
#include <cmath>
using namespace std;

double f(double x);

int main()
{
	double x1;
	cout << "������x���к�������" << endl;
	cin >> x1;
	cout << "����Ľ��Ϊ" << f(x1);
	return 0;
}

double f(double x)
{
	double y;
	if (x < 0)
	{
		y = 2 * x + 5;
	}
	else if (x == 0)
	{
		y = x;
	}
	else if (x > 0)
	{
		y = 3 * x - 2;
	}
	return y;
}
*/

/*
//TEST7 �ж�ˮ�ɻ���
#include <iostream>
#include <cmath>
using namespace std;

void is_flower(int x);

int main()
{
	int x1;
	cout << "������һ����λ��" << endl;
	cin >> x1;
	is_flower(x1);
	return 0;
}

void is_flower(int x)
{
	int a, b, c;	//�ֱ�����λ��ʮλ����λ
	a = x / 100;
	b = x % 100 / 10;
	c = x % 10;
	if (x == a * a * a + b * b * b + c * c * c)
	{
		cout <<x<< "��һ��ˮ����" << endl;
	}
	else
	{
		cout << x << "����һ��ˮ����" << endl;
	}
}
*/


#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	char x1;
	//while (cin.get() != '\n')
	//	cin.get() >> x1;
	//	;
	//cout << x1;
	cin.get() >> x1;
	return 0;
}