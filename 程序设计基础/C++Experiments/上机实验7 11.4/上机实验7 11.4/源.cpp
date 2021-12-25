/*
//课堂实例1：逆序存放数组
#include<iostream>
using namespace std;
const int ARRY_SIZE = 10;

void input(double[], int size);
void re_input(double[], double[],int size);
void reverse(double[], int size);

int main() {
	double a[20] = { 0 };
	double b[20] = { 0 };
	
	input(a, ARRY_SIZE);
	re_input(a, b, ARRY_SIZE);
	return 0;
}

void input(double a[], int size)
{
	for (int i = 0; i < size; i++)
	{
		cout << "Please input a[" << i << "] = ";
		cin >> a[i];
	}
}

void re_input(double a[], double b[], int size)
{
	for (int i = size; i >= 0; i--)
	{
		b[i] = a[size - 1 - i];
	}
	for (int j = size; j < size; j++)
	{
		cout << b[j] << endl;
	}
}


//void reverse(int a[], int size)
//{
//	int i;
//	int temp;
//
//	for (i = 0; i < size / 2; i++)
//	{
//		temp = a[i];
//		a[i] = a[size - i - 1];
//		a[size - i - 1] = temp;
//	}
//}


//课堂实例2.1：冒泡算法
void bubble_sort(int a[], int size)
{
	int temp;
	int flag=0;
	
	for(int i=1;!flag&&i <size;i++)   //微观提高效率！！
		for (int j = 0,flag=1; j < size - i ; j++)
		{
			if (a[j] > a[j + 1])
			{
				temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
				flag = 0;
			}
		}
}

//课堂实例2.2：冒泡算法改进
void selection_sort(int a[], int size)
//优点：相较于冒泡算法减少了交换的次数，每一趟只需要交换一次（减少了每一趟比较里数据交换的躺数）
{
	int temp;
	int flag = 0;
	int loc;
	int i, j;

	for (int i = 1; !flag && i < size; i++)
	{ 
		for (int j = 1,loc=0,flag = 1; j < size - i; j++)
		{
			if (a[j] > a[loc])
			{
				loc = j;
			}
		}
		if (a[size - i] != a[loc])
		{
			temp = a[j];
			a[j] = a[loc];
			a[loc] = temp;
		}
	}
}

int sequence_search(int a[], int size, int key)
//不建议使用continue/break，半结构化成分的语言
{
	int i;
	int loc = -2;
	int flag;

	for (i = 0; flag && i < size; i++)
	{
		if (key == a[i])
		{
			loc = i;
			flag = 0;
		}
	}
	return loc+1 ;
}

//课堂实例3.1：检索算法改进——两分法 log2(n)
int dichotomy(int a[], int size, int key)
{
	int i;
	int loc = -2;
	int bott = 0, top = size - 1;
	int midd;
	int flag = 1;

	while (bott <= top)
	{
		midd = (bott + top) / 2;
		if (a[midd] == key)
		{
			loc = midd + 1;
			flag = 0;
		}
		else if (a[midd] > key)
		{
			top = midd - 1;
		}
		else
		{
			bott = midd + 1;
		}
	}
}
*/


/*
//TEST1 起泡法逆序排序
#include<iostream>
using namespace std;
const int ARRY_SIZE = 10;

void input(double[], int size);
void bubble(double[], int size);

int main() {
	double a[20] = { 0 };

	input(a, ARRY_SIZE);
	bubble(a, ARRY_SIZE);
	return 0;
}

void input(double a[], int size)
{
	for (int i = 0; i < size; i++)
	{
		cout << "Please input a[" << i << "] = ";
		cin >> a[i];
	}
}

void bubble(double a[], int size)
{
	int i, j;
	int flag = 0;
	int tmp;

	for (i = 1; flag!=1&&i <= size - 1; i++)
	{
		for (j = 0, flag = 1; j < size - i; j++)
		{
			if (a[j] < a[j + 1])
			{
				tmp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = tmp;
				flag = 0;
			}

		}
	}
	for (int k = 0; k <= size - 1; k++)
	{
		cout << a[k] << endl;
	}
}
*/


/*
//TEST2  5x5矩阵
#include<iostream>
#include<iomanip>
using namespace std;
const int COL = 5;
const int ROW = 5;

void input(double[][COL], int ROW);
void output(double[][COL], int ROW);
double cal(double a[][COL], int ROW);

int main() {
	double a[ROW][COL] = { 0 };

	input(a, ROW);
	output(a, ROW);
	cout<<"SUM = "<< cal(a, ROW);
	return 0;
}

void input(double a[][COL], int ROW)
{
	for (int i = 0; i < ROW; i++)
	{
		for (int j = 0; j < COL; j++)
		{
			cout << "please input a[" << i << "][" << j << "]" << endl;
			cin >> a[i][j];
		}
	}
}

void output(double a[][COL], int ROW)
{
	for (int j = 0; j < COL; j++)
	{
		cout << a[0][j] <<' ';
		cout << endl;
	}
	for (int i = 1; i < COL-1; i++)
	{
		cout <<  a[i][0] << "        "<<a[i][COL-1];
		cout << endl;
	}
	for (int j = 0; j < COL; j++)
	{
		cout << a[ROW-1][j] << ' ';
	}
}

double cal(double a[][COL], int ROW)
{
	int sum = 0;
	for (int j = 0; j < COL; j++)
	{
		sum += a[0][j] ;
	}
	for (int i = 1; i < COL - 1; i++)
	{
		sum += a[i][0];
		sum += a[i][COL - 1];
	}
	for (int j = 0; j < COL; j++)
	{
		sum += a[ROW - 1][j] ;
	}
	return sum;
}
*/

#include<iostream>
#include<iomanip>
using namespace std;
const int COL = 8;
const int ROW = 9;

void input(double[][COL], int ROW);
void AVG(double[][COL], int ROW);
void selection_buble(double[][COL], int ROW);


int main() {
	double a[ROW][COL] = { 0 };

	input(a, ROW);
	AVG(a, ROW);
	selection_buble(a, ROW);
	return 0;
}

void input(double a[][COL], int ROW)
{
	for (int i = 0; i < ROW; i++)
	{
		for (int j = 1; j < COL-1; j++)
		{
			cout << "please input a[" << i << "][" << j << "]" << endl;
			cin >> a[i][j];
		}
	}
	for (int i = 0;  i < ROW; i++)
	{
		a[i][0] = i + 1;
	}
}

void AVG(double a[][COL], int ROW)
{
	int sum;
	int avg;
	for (int i = 0; i < ROW; i++)
	{
		for (int j = 1; j < COL-1; j++)
		{
			sum += a[i][j];
		}
		a[i][COL - 1] = sum / (COL - 2);
		sum = 0;
	}
}

void selection_buble(double a[][COL], int ROW)
{
	int loc=0;
	double tmp;
	int i, j;
	int flag = 0;

	for (i = 1; flag!=1&&i < ROW; i++)
	{
		for (j = 0,flag=1; j < ROW - i; j++)
		{
			if (a[loc][COL-1] < a[j][COL - 1])
			{
				loc = j;
			}
			flag = 1;
		}

		if(a[i-1][COL-1]!=a[loc][COL-1])
		{
		tmp = a[i-1][COL - 1];
		a[i - 1][COL - 1] = a[loc][COL - 1];
		a[loc][COL - 1] = tmp;
		}

	}
	cout << "总分排名第七的同学的平均成绩是" << a[6][COL - 1] << endl;
}