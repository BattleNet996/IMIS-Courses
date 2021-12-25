#include<iostream>
#include "封装.h"
using namespace std;

Person::Person() { age = 0; height = NULL; name = NULL; };

Person::Person(int a, int* p1 = 0, const char* p2 = "\0")
{
	age = a;
	height = new int(*p1);

	int len = strlen(p2);
	name = new char[len + 1];
	strcpy(name, p2);
}
Person::Person(Person& p2)
{
	age = p2.age;
	height = new int(*p2.height);
	name = new char[strlen(p2.name) + 1];
	strcpy(name, p2.name);
}
Person::~Person()
{
	cout << "正在运行析构函数" << endl;
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

void Person::Print()
{
	cout << "姓名：" << name << endl;
	cout << "年龄：" << age << endl;
	cout << "身高：" << *height << endl;
}