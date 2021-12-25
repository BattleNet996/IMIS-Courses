#include <iostream>
using namespace std;
double f(double x);// 函数原型
int main()
{
	//程序是函数的集合，通过函数调用形成程序本身内在的逻辑语义
	double x1;//定义+声明
	cout << "please input x1" << endl;
	cin >> x1;
	cout << "f(" << x1 << ")=" << f(x1) << endl;
	return 0;
}

double f(double x)
{
	double result;
	result = (x * x + 8 * x - 12) / (x * x + 5);
	return result;
}

//不返回值：void
//函数头部与返回值类型的隐式转换
//显示类型转换
//int f(double x)
//{
//	double result;
//	result = (x * x + 8 * x - 12) / (x * x + 5);
//	return (int)result;
//}
//int f(double x)
//{
//	double result;
//	result = (x * x + 8 * x - 12) / (x * x + 5);
//	return int(result);
}