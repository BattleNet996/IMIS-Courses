#include "test5.h"
#include<iostream>
#include<string>

using namespace std;



void test5(struct Teacher* list)
{
	struct Teacher* p;
	p = list;

	for (int i = 0; i < 2; i++)

	{
		cout << "������ʦ������:" << endl;
		string tmp;
		cin >> tmp;
		p->tname = tmp;


		for (int j = 0; j < 3; j++)
		{
			cout << "�����" << j + 1 << "��ѧ��������" << endl;
			string tmp2;
			cin >> tmp2;
			p->stu_list[j].sname = tmp2;

			cout << "�����" << j + 1 << "��ѧ���ķ���" << endl;
			double tmp3;
			cin >> tmp3;
			p->stu_list[j].score = tmp3;
		}
		p++;
	}

	p = list;
	for (int i = 0; i < 2; i++)
	{
		cout << p->tname << "��ʦ: " << endl;
		for (int j = 0; j < 3; j++)
		{
			cout << p->stu_list[j].sname << "\t";
			cout << p->stu_list[j].score << "\t" << endl;
		}
		p++;
	}
}