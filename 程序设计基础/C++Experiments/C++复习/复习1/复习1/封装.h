#pragma once
#include<iostream>

using namespace std;

class Person
{
public:
	Person() { age = 0; height = NULL; name = NULL; }
	Person(int a, int* p1 = 0, const char* p2 = "\0")
	{
		age = a;
		height = new int(*p1);

		int len = strlen(p2);
		name = new char[len + 1];
		strcpy(name, p2);
	}
	Person(Person& p2)
	{
		age = p2.age;
		height = new int(*p2.height);
		name = new char[strlen(p2.name) + 1];
		strcpy(name, p2.name);
	}
	~Person()
	{
		cout << "����������������" << endl;
		if (height != NULL)
		{
			delete height;
			height = NULL;
		}
		if (name != NULL)
		{
			delete[]name;
			name = NULL;
		}
	}

	void Print()
	{
		cout << "������" << name << endl;
		cout << "���䣺" << age << endl;
		cout << "��ߣ�" << *height << endl;
	}
private:
	int age;
	int* height;
	char* name;

};


