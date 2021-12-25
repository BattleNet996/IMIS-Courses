#include<iostream>
#include<string>

using namespace std;

struct Student {
	string sname;
	double score;
};

struct Teacher {
	string tname;
	struct Student stu_list[3];
};

void test5(struct Teacher* list)
{
	struct Teacher* p;
	p = list;

	for (int i = 0; i < 2; i++)

	{
		cout << "输入老师的姓名:" << endl;
		string tmp;
		cin >> tmp;
		p->tname = tmp;


		for (int j = 0; j < 3; j++)
		{
			cout << "输入第" << j + 1 << "个学生的姓名" << endl;
			string tmp2;
			cin >> tmp2;
			p->stu_list[j].sname = tmp2;

			cout << "输入第" << j + 1 << "个学生的分数" << endl;
			double tmp3;
			cin >> tmp3;
			p->stu_list[j].score = tmp3;
		}
		p++;
	}

	p = list;
	for(int i=0;i<2;i++)
	{
		cout << p->tname << "老师: " << endl;
		for (int j = 0; j < 3; j++)
		{
			cout << p->stu_list[j].sname << "\t";
			cout << p->stu_list[j].score << "\t" << endl;
		}
		p++;
	}
}

int main()
{
	struct Teacher tea_list[3];
	struct Teacher* list = &(tea_list[1]);
	test5(list);
	return 0;
}