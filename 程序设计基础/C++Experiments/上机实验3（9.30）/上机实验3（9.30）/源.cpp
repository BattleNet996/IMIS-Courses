/*   TEST1 计算累进奖金
#include<iostream>
using namespace std;

double bonus_sale(double sale);

int main() {
	double sale;
	double bonus;

	cout << "please input your sale:" << endll;
	cin >> sale;

	bonus = bonus_sale(sale);
	cout >> "your bonus is" >> bouns >> endl;
	return 0;
}

double bonus_sale(double sale) {
	int sub;
	double bonus;
	//使用sub作为sale的替代，用于表示sale的int类型替代
	sub = sale / 100000;
	//使用整除不需要使用强制类型转换，因为sub是int类型，所以除的结果会自动转化为int类型
	//整除的结果向下取整
	if (sub > 10)
	{
		sub = 10;
	}
	else {
		switch (sub) {
		case 0:
			bonus = sale * 0.1;
			//0-100000的部分
		case 1:
			bonus = 10000 + (sale - 100000) * 0.075;
			//比率我记不太清了，大致应该是这个数
			//下面也是
		//100000-200000的部分
		case 2:
		case 3:
			bonus = 17500 + (sale - 200000) * 0.05;

		}
	}

*/


/* TEST2 计算月份的天数(switch)
#include <iostream>
using namespace std;

int is_double(int year);

void return_days(int month, int year);

int main()
{
	int year, month;

	cout << "请分别输入年份和月份" << endl;
	cin >> year >> month;
	return_days(year, month);

	return 0;
}

void return_days(int year, int month)
{
	switch (month)
	{
		case 1:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;
		case 2:
			if (is_double(year))
			{
				cout << year << "年" << month << "月" << "有29天" << endl;
			}
			else
			{
				cout << year << "年" << month << "月" << "有28天" << endl;
			}
			break;
		case 3:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;
		case 4:
			cout << year << "年" << month << "月" << "有30天" << endl;
			break;
		case 5:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;
		case 6:
			cout << year << "年" << month << "月" << "有30天" << endl;
			break;
		case 7:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;
		case 8:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;
		case 9:
			cout << year << "年" << month << "月" << "有30天" << endl;
			break;
		case 10:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;
		case 11:
			cout << year << "年" << month << "月" << "有30天" << endl;
			break;
		case 12:
			cout << year << "年" << month << "月" << "有31天" << endl;
			break;

	}
}

int is_double(int year)
{
	if ((year % 100  && year % 4 == 0) || (year % 400 ==0))
	{
		return 1;
	}
	else 
	{
		return 0;
	}
}
*/


/* TEST2 计算月份的天数(if else)
#include <iostream>
using namespace std;

int return_days(int year, int month);

int main()
{
	int year, month;
	cout << "input year & month";
	cin >> year >> month;
	return_days(year, month);
	return 0;
}

int return_days(int year, int month)
{
	if (month < 1 || month >12)
	{
		cout << "worng number" << endl;
		return -1;
	}
	else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
	{
		cout << "31" << endl;
		return 0;
	}
	else if (month == 4 || month == 6 || month == 9 || month == 11)
	{
		cout << "30" << endl;
		return 0;
	}
	else {
		if ((year % 4 == 0 && year % 100) || year % 400 == 0)
		{
			cout << "29" << endl;
		}
		else {
			cout << "28" << endl;
		}
		return 0;
	}
}
*/


/*
#include <stdlib.h>
#include <iostream>
using namespace std;

int main() 
{
	if (judge_num() == 1)		//关系运算的省略（技巧）
	{
		cout << "success!";
	}
	else
	{
		cout << "failure!" << endl;
	}
	return 0;
}

int judge_num(void)
{
	int magic;
	int num;
	int result = 0;
	int times;

	magic = rand() % 100;		//随机数在 0 ~ MAX-RAND间
	cout << "please input your guess" << endl;
	cin >> num;

	for (times = 0; !result && times <= 5; times++)	   //循环头：循环计数变量（循环之初状态的设置） + 循环结束的状态 + 循环状态的改变 
													  //变量可以缺省，但是分号不行
		{											 //循环体
													// Initialization → condition → block → increment → 出循环
												   //逗号运算符就是将多个表达式隔开，从左到右以此计算 a=(b=0, c=3)
		if (num == magic)
		{
			cout << "True" << endl;
			result = 1;
		}
		else if (num > magic)
		{
			cout << "highter" << endl;
		}
		else
		{
			cout << "lower" << endl;
		}
		return result;
	}
}
*/

/*
// TEST 1
#include <iostream>
using namespace std;

double sum(double min,double max);

int main()
{
	double min, max;
	cout << "输入所要求和式子的下限和上限" << endl;
	cin >> min >> max;
	cout << min << "~" << max << "求和为" << sum(min, max) << endl;

	return 0;
}

double sum(double min,double max)
{
	double i ;
	double result;
	result = 0;
	
	if (max >= min)
	{
		for (i = min; i <= max; i++)
			result += i;
	
		//do
		//{
		//	result += i;
		//	i++;
		//}while (i<=max)
		//
		//
		//
		//	while (i<=max)
		//	{
		//		result += i;
		//		i ++;
		//	}
		
	}
	
	else
	{
		cout << "data error!" << endl;
		result = -1;
	}
	return result;
}
*/


/*
// TEST 1 衣服打折出售
#include <iostream>
using namespace std;

double cal_price(int num);

int main()
{
	int num;
	cout << "input the number of clothes" << endl;
	cin >> num;
	cout << "The Price is" << cal_price(num) << endl;
	return 0;
}


double cal_price(int num)
{
	double result;
	if (num < 0)
	{
		cout << "number error" << endl;
	}
	else
	{
		//switch (num % 10)
		//{
		//case 0:
		//	result = 30 * num * 0.9;
		//case 1:
		//	result = 30 * num * 0.8;
		//case 2:
		//	result = 30 * num * 0.7;
		//case 3:
		//	result = 30 * num * 0.7;
		//case 4:
		//	result = 30 * num * 0.6;
		//case 5:
		//	result = 30 * num * 0.6;
		//default:
		//	result = 30 * num * 0.5;
		//}
		if (num < 10)
		{
			result = 30 * num * 0.9;
		}
		else if (10 < num && num <= 19)
		{
			result = 30 * num * 0.8;
		}
		else if (19 < num && num <= 39)
		{
			result = 30 * num * 0.7;
		}
		else if (40 <= num && num <= 59)
		{
			result = 30 * num * 0.6;
		}
		else if (60 <= num)
		{
			result = 30 * num * 0.5;
		}
	}
	return result;
}
*/


/*
// TEST 2 键盘输入10个整数求平均值
#include <iostream>
using namespace std;

double cal_mean(void);

int main()
{
	double result;
	result = cal_mean();
	cout << "The mean of numbers you input is" << ' '<<result << endl;
	return 0;
}

double cal_mean(void)
{
	int i;
	int num;
	double sum;
	double result;
	sum = 0;
	//for (i = 0; i <= 10; i++)
	//{
	//	if (i == 1)
	//	{
	//		cout << "请输入一个数" << endl;
	//		cin >> num;
	//		sum += num;
	//	}
	//	else
	//	{
	//		cout << "请再输入一个数" << endl;
	//		cin >> num;
	//		sum += num;
	//	}
	//}
	
	//i = 0;
	//while (i < 10)
	//{
	//	if (i == 1)
	//	{
	//		cout << "请输入一个数" << endl;
	//		cin >> num;
	//		sum += num;
	//	}
	//	else
	//	{
	//		cout << "请再输入一个数" << endl;
	//		cin >> num;
	//		sum += num;
	//	}
	//	i += 1;
	//}

	//	i = 0;
	//
	//do{
	//	if (i == 1)
	//	{
	//		cout << "请输入一个数" << endl;
	//		cin >> num;
	//		sum += num;
	//	}
	//	else
	//	{
	//		cout << "请再输入一个数" << endl;
	//		cin >> num;
	//		sum += num;
	//	}
	//	i += 1;
	//} while (i < 10);

	result = sum / 10.0;
		return result;
}
*/

// TEST 3 输出1`100平方和在300~400的数
#include <iostream>
using namespace std;

void get_num(void);

int main()
{
	get_num();
	return 0;
}

void get_num(void)
{
	int i;
	//for (i = 1; i <= 100; i++)
	//{
	//	if (300 <= i * i && i * i <= 400)
	//	{
	//		cout << i << endl;
	//	}
	//}

	//i = 1;
	//while (i <= 100)
	//{
	//		if (300 <= i * i && i * i <= 400)
	//{
	//	cout << i << endl;
	//}
	//		i++;
	//}

	i = 1;
	do {
		if (300 <= i * i && i * i <= 400)
		{
			cout << i << endl;
		}
		i++;
	} while (i <= 100);
	return ;
}

