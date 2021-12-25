/*
//TEST1 求圆的周长与面积
#include <iostream>
using namespace std;
//include <math.h>
const double  PI = 3.1415926535;
double cal_Area(double radius);
double cal_zc(double radius);
int main() {
	double radius;
	cout << "请输入圆的半径" << endl;
	cin >> radius;
	cout << "圆的周长为" << cal_zc(radius) << endl;
	cout << "圆的面积为" << cal_Area(radius) << endl;
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

//TEST 2 一元二次方程求解
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
//TEST 3 猜数字游戏
#include <iostream>
#include <cmath>
using namespace std;

void func(int x1,int x2);
int main()
{
	int x1,x2;
	cout << "程序员请预设一个常数" << endl;
	cin >> x1;
	cout << "用户输入一个数" << endl;
	cin >> x2;
	func(x1, x2);
	return 0;
}
void func(int x1,int x2)
{
	if (x2 == x1)
	{
		cout << "你猜对啦";
	}
	else{
		cout << "你猜错啦";
	}
}
*/

/*
//TEST 5 求函数的值
#include <iostream>
#include <cmath>
using namespace std;

double f(double x);

int main()
{
	double x1;
	cout << "请输入x进行函数计算" << endl;
	cin >> x1;
	cout << "计算的结果为" << f(x1);
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
//TEST7 判断水仙花数
#include <iostream>
#include <cmath>
using namespace std;

void is_flower(int x);

int main()
{
	int x1;
	cout << "请输入一个三位数" << endl;
	cin >> x1;
	is_flower(x1);
	return 0;
}

void is_flower(int x)
{
	int a, b, c;	//分别计算百位、十位、个位
	a = x / 100;
	b = x % 100 / 10;
	c = x % 10;
	if (x == a * a * a + b * b * b + c * c * c)
	{
		cout <<x<< "是一个水仙数" << endl;
	}
	else
	{
		cout << x << "不是一个水仙数" << endl;
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