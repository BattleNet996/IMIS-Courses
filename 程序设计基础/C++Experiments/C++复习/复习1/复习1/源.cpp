#include<iostream>
#include<ctime>
#include<string>
#include "�ṹ��.h"
#include "��װ.h"
using namespace std;

int test1()
{
	//�������֡���Ϸ
	//��Ҫѵ��ѭ���ṹ��ѡ��ṹ
	//1��switch���
	//2����Ŀ�����
	//3�����������
	srand((unsigned int) time(NULL));
	int num;
	num = rand() % 100 + 1;
	

	int tmp,flag = 0;
	cout << "��������ʼ��������Ϸ��" << endl;
	
	while (!flag) 
	{
		cout << "��������һ������: " << endl;
		cin >> tmp;
	

		flag = (tmp == num ? 1 : 0);
		switch (flag)
		{
		case 1:
			cout << "��ϲ��¶�����" << endl;
			break;
		case 0:
			if (tmp > num)
			{
				cout << "�������̫������ϸ�ĵ㣡" << endl;
			}
			else
			{
				cout << "�������̫С��������㣡" << endl;
			}
		}
	}
	return 0;
}

int test2()
{
	//��99�˷��ھ���
	//���죺Ƕ��ѭ��
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
	//���������á�
	int arr[] = { 1,2,3,4,5,6,7,8,9,10 };
	int arr_length;
	arr_length = sizeof(arr) / sizeof(arr[0]); //���������ڴ�ռ��ͳ�Ƽ�������Ԫ�ظ���

	//��ӡ����ǰ������
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

	//��ӡ���ú������
	cout << "***ת����***" << endl;
	for (int i = 0; i < arr_length; i++)
	{
		cout << arr[i] << endl;
	}

	return 0;
}



int test4()
{
	//��ð������
	int arr[] = { 1,2,3,4,5,6,7,8,9,10 };
	int arr_length;
	arr_length = sizeof(arr) / sizeof(arr[0]); //���������ڴ�ռ��ͳ�Ƽ�������Ԫ�ظ���

	//��ӡ����ǰ������
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

	//��ӡ����������
	cout << "***ת����***" << endl;
	for (int i = 0; i < arr_length; i++)
	{
		cout << arr[i] << endl;
	}

	return 0;
}


//TEST6 �ࣨ����Բλ�ù�ϵ�жϣ�
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
		cout << "����Բ��" << endl;
	}
	else {
		cout << "����Բ��" << endl;
	}

}

	
	//TEST7 ѡ������
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
			//��ֹ����Ҫ�Ļ�����
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

	//TEST8 ��װ

void test8()
{
	int age = 10;
	Person p1(20, &age, "����");
	p1.Print();
	Person p2(p1);
	p2.Print();
}

int main()
{ 
	//test1();         //����ѭ���ṹ

	//test2();		  //99�˷���

	//test3();		 //�����û�

	//test4();		//ð������

	/*			   //�ṹ��Ƕ��
	struct Teacher tea_list[3] ;
	cout << "hello!" << endl;
	struct Teacher* p = &(tea_list[0]);
	test5(p);
	*/

	//test6();	//�ࣺ����Բ�Ĺ�ϵ�ж�
	
	//Test7 ѡ������
	/*int a[10] = { 1,2,3,5,34,4,1,354,3,4 };
	SelectSort(a, 10);
	*/

	//TEST8 ��װ
	//test8();
	return 0;
}