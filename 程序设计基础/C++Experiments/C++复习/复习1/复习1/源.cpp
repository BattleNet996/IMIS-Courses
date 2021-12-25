#include<iostream>
#include<ctime>
#include<string>
#include "结构体.h"
#include "封装.h"
using namespace std;

int test1()
{
	//【猜数字】游戏
	//主要训练循环结构和选择结构
	//1、switch语句
	//2、三目运算符
	//3、随机数生成
	srand((unsigned int) time(NULL));
	int num;
	num = rand() % 100 + 1;
	

	int tmp,flag = 0;
	cout << "我们来开始猜数字游戏吧" << endl;
	
	while (!flag) 
	{
		cout << "请你输入一个数字: " << endl;
		cin >> tmp;
	

		flag = (tmp == num ? 1 : 0);
		switch (flag)
		{
		case 1:
			cout << "恭喜你猜对啦！" << endl;
			break;
		case 0:
			if (tmp > num)
			{
				cout << "你的数字太大啦，细心点！" << endl;
			}
			else
			{
				cout << "你的数字太小啦，胆大点！" << endl;
			}
		}
	}
	return 0;
}

int test2()
{
	//【99乘法口诀表】
	//考察：嵌套循环
	for (int i = 1; i <= 9; i++)
	{
		for (int j = 1; j <= i; j++)
		{
			cout << i << "x" << j << "=" << i * j <<'\t';
		}
		cout << endl;
	}

	return 0;
}

int test3()
{
	//【数组逆置】
	int arr[] = { 1,2,3,4,5,6,7,8,9,10 };
	int arr_length;
	arr_length = sizeof(arr) / sizeof(arr[0]); //利用数组内存空间的统计计算数组元素个数

	//打印逆置前的数组
	for (int i = 0; i < arr_length; i++)
	{
		cout << arr[i] << endl;
	}


	for (int i = 0; i <= arr_length/2; i++)
	{
		int tmp;
		tmp = arr[i];
		arr[i] = arr[arr_length - i-1];
		arr[arr_length - i-1] = tmp;
	}

	//打印逆置后的数组
	cout << "***转换后***" << endl;
	for (int i = 0; i < arr_length; i++)
	{
		cout << arr[i] << endl;
	}

	return 0;
}



int test4()
{
	//【冒泡排序】
	int arr[] = { 1,2,3,4,5,6,7,8,9,10 };
	int arr_length;
	arr_length = sizeof(arr) / sizeof(arr[0]); //利用数组内存空间的统计计算数组元素个数

	//打印排序前的数组
	for (int i = 0; i < arr_length; i++)
	{
		cout << arr[i] << endl;
	}


	for (int i = 0; i < arr_length; i++)
	{
		for (int j = i; j < arr_length ; j++)
		{
			if (arr[i] < arr[j])
			{
				int tmp;
				tmp = arr[i];
				arr[i] = arr[j];
				arr[j] = tmp;
			}
		}
	}

	//打印排序后的数组
	cout << "***转换后***" << endl;
	for (int i = 0; i < arr_length; i++)
	{
		cout << arr[i] << endl;
	}

	return 0;
}


//TEST6 类（点与圆位置关系判断）
class point
{
	public:
		point(){x = y = 0;}
		point(double a, double b)
		{
			x = a;
			y = b;
		}
		double get_x() { return x; }
		double get_y() { return y; }
		void set_x(int a) { x = a; }
		void set_y(int b) { y = b; }

	private:
		double x;
		double y;

	
};

class circle:point
{
public:
	circle(double a, double b, double c)
	{
		this->point::point(a, b);
		R = c;
	}
	circle()
	{
		this->point::point(0, 0);
		R = 0;
	}

	double get_center()
	{
		return R;
	}
	bool isin(point &p)
	{
		if (((p.get_x() - get_x()) * (p.get_x() - get_x()) + (p.get_y() - get_y()) * (p.get_y() - get_y())) >= R * R)
		{
			return 0;
		}
		else {
			return 1;
		}
	}


private:
	double R;
};


void test6()
{
	point p1 = point(1, 1);
	circle c1 = circle(1, 1, 1);
	if (c1.isin(p1)) {
		cout << "点在圆内" << endl;
	}
	else {
		cout << "点在圆外" << endl;
	}

}

	
	//TEST7 选择排序法
void SelectSort(int a[10], int len)
{
	int flag = 0;
	for (int i = 0; i < len && !flag; i++)
	{
		int loc = i;
		for (int j = i+1; j < len; j++)
		{
			if (a[j] < a[loc])
			{
				loc = j;
			}
		}
		if (loc != i)
			//防止不必要的互换！
		{
			int temp = a[loc];
			a[loc] = a[i];
			a[i] = temp;
			flag = 0;
		}
	}
	for (int i = 0; i < len; i++)
	{
		cout << a[i] << "\t";
	}
}

	//TEST8 封装

void test8()
{
	int age = 10;
	Person p1(20, &age, "张三");
	p1.Print();
	Person p2(p1);
	p2.Print();
}

int main()
{ 
	//test1();         //条件循环结构

	//test2();		  //99乘法表

	//test3();		 //数组置换

	//test4();		//冒泡排序

	/*			   //结构体嵌套
	struct Teacher tea_list[3] ;
	cout << "hello!" << endl;
	struct Teacher* p = &(tea_list[0]);
	test5(p);
	*/

	//test6();	//类：点与圆的关系判断
	
	//Test7 选择排序
	/*int a[10] = { 1,2,3,5,34,4,1,354,3,4 };
	SelectSort(a, 10);
	*/

	//TEST8 封装
	//test8();
	return 0;
}