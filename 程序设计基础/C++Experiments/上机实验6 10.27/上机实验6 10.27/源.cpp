//#include <iostream>
//#include<iomanip>
//using namespace std;
//
//void print1(int num);
//void print2(int num);
//void print3(int num);
//
//int main() {
//	int num;
//	
//	cout << "INPUT A NUM" << endl;
//	cin >> num;
//
//	//print1(num);
//	//print2(num);
//	print3(num);
//	
//	return 0;
//}
//
//void print1(int num) {
//	if (num < 10 ) {
//		cout << num <<endl;
//	}
//	else {
//		print1(num/10);
//		cout << num % 10 << endl;
//	}
//	return;
//}
//
//void print2(int num) {
//	while (num > 0) {
//		cout << num % 10 << endl;
//		num /= 10;
//	}
//	return;
//}
//
//void print3(int num) {
//	int a[310] = { 0 };
//	int i;
//	int count = 0;
//
//	i = 0;
//	while (num > 0) {
//		a[i++] = num % 10;
//		count++;
//		num /= 10;
//	}
//	for (i = 0; i < count; i++)
//	{
//		cout << setw(4) << a[i]<<endl;
//	}
//	cout << endl;
//
//	for (i = count-1; i >=0 ; i--)
//	{
//		cout << setw(4) << a[i] << endl;
//	}
//	cout << endl;
//	return;
//}


//#include <iostream>
//using namespace std;
//const int ARRAY_SIZE = 10;
//
//void input(double[], int);
//double average(double[], int);
//void print(double[], int);
//int main()
//{
//	double a[ARRAY_SIZE] = { 0 };
//
//	input(a, ARRAY_SIZE);
//	cout << "average=" << average(a, ARRAY_SIZE) << endl;
//}
//
//
//void input(double a[], int size)
//{
//	//cout << "please input " << size << "element" << endl;
//	for (int i = 0; i < size; i++)
//	{
//		cout << "please input a[" << i << "]element" << endl;
//		cin >> a[i];
//	}
//}
//
//double average(double a[], int size)
//{
//	int i;
//	double sum;
//
//	for (i = 0, sum = 0; i < size; i++)
//	{
//		sum += a[i];
//	}
//	return sum / size;
//}
//
//void print(double a[], int size)
//{
//	for (int index = 0; index < size; index++)
//		cout << a[index] << " ";
//	cout << endl;
//}


//#include <iostream>
//#include <iomanip>
//using namespace std;
//const int ROW = 3;
//const int COLUMN = 10;
//
//void input(double[][COLUMN], int);  //第二维不能缺省，第一维省掉通过另外的参数携带
//double average(double[][COLUMN], int);
//void print(double[][COLUMN], int);
//
//int main()
//{
//	double a[ROW][COLUMN] = { 0 };    //二维数组的参数传递方式类似于一维数组
//	double avg[ROW] = { 0 };
//
//	input(a, ROW);
//	print(a, ROW);
//	cout << average(a, ROW) << endl;
//}
//
//void input(double a[][COLUMN], int size)
//{
//	for (int i = 0; i < size; i++)
//	{
//		for (int j = 0; j < COLUMN;j++)
//		{
//			cout << "please input a[" << i << "][" << j << "]" << endl;
//			cin >> a[i][j];
//		}
//	}
//}
//double average(double a[][COLUMN], int size)
//{
//	int i;
//	double sum;
//	
//	for (i = 0, sum = 0; i < size * COLUMN; i++)
//	{
//		//sum += (*a)[i];
//		for (int j = 0; j < COLUMN; j++)
//		{
//			sum += a[i][j];
//		}
//	}
//	return sum / (size * COLUMN);
//}
//
//void print(double a[][COLUMN], int size)
//{
//	for (int i = 0; i < size; i++)
//		for (int j = 0; j < COLUMN; j++)
//			cout << setw(6) << a[i][j] << endl;
//	return;
//}


/* TEST1 找出一维数组的最大最小值域，并返回位置
#include <iostream>
using namespace std;

const const int ARRAY_SIZE = 10;

void input(double[], int size);
void print_pole(double[], int size);

int main() {
	double a[ARRAY_SIZE] = { 0 };
	input(a, ARRAY_SIZE);
	print_pole(a, ARRAY_SIZE);

	return 0;
}

void input(double a[], int size){
	for (int i = 0; i < size; i++) 
	{
		cout << "INPUT a[" << i << "] ELEMENT" << endl;
		cin >> a[i];
	}
}

void print_pole(double a[], int size) {
	double max, min;
	max = a[0];
	min = a[0];
	for (int i = 0; i < size; i++)
	{
		if (a[i] > max) {
			max = a[i];
		}
		if (a[i] < min) {
			min = a[i];
		}
	}
	cout << "MAX NUM IS " << max << endl;
	cout << "MIN NUM IS " << min << endl;
	for (int i = 0; i < size; i++)
	{
		if (a[i] == max) {
			cout << "MAX NUM IN " << i << ' ';
		}
	}
	cout << endl;
	for (int i = 0; i < size; i++)
	{
		if (a[i] == min) {
			cout << "min NUM IN " << i << " ";
		}
	}
	cout << endl;
}
*/


/* TEST 2 用数组求特殊数列
#include <iostream>
using namespace std;

const int ARRAY_SIZE = 100;

void gen_array(double[], int size);

int main() {
	double a[ARRAY_SIZE] = { 0 };
	gen_array(a, ARRAY_SIZE);
	cout << "数列的第36项是 " << a[35]<<endl;
	return 0;
}

void gen_array(double a[], int size)
{
	a[0] = 0;
	a[1] = 0;
	a[2] = 1;
	for (int i = 3; i < size; i++)
	{
		a[i] = a[i - 1] + a[i - 2];
	}
}
*/


/*二维数组：求每一行的平均值
#include <iostream>
#include <iomanip>
using namespace std;
const int ROW=3;
const int COLUMN=4 ;

void input(double[][COLUMN], int);  //第二维不能缺省，第一维省掉通过另外的参数携带
void average(double[][COLUMN],double [], int);
void print(double[][COLUMN], int);

int main()
{
	//cout << "PLEASE INPUT THE ROW AND COLUMN OF THE ARRAY" << endl;
	//cin >> ROW;
	//cin >> COLUMN;
	double a[ROW][COLUMN] = { 0.0 };    //二维数组的参数传递方式类似于一维数组
	double avg[ROW] = { 0.0 };
	input(a, ROW);
	average(a, avg, ROW);
	print(a, ROW);
}

void input(double a[][COLUMN], int size)
{
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < COLUMN;j++)
		{
			cout << "please input a[" << i << "][" << j << "]" << endl;
			cin >> a[i][j];
		}
	}
}
void average(double a[][COLUMN],double avg[], int size)
{
	int i;
	double sum=0;
	
	for (i = 0;i < size; i++)
	{
		//sum += (*a)[i];
		for (int j = 0; j < COLUMN; j++)
		{
			sum += a[i][j];
		}
		avg[i] = sum;
		cout << "sum is " << avg[i] << endl;
		cout << "THE AVG OF ROW  " << i << "is  " << avg[i]/double(COLUMN)<<endl;
		sum = 0;
	}
	return;
}

void print(double a[][COLUMN], int size)
{
	for (int i = 0; i < size; i++)
		for (int j = 0; j < COLUMN; j++)
			cout << setw(6) << a[i][j] << endl;
	return;
}
*/