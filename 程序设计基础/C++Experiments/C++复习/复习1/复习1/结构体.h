#pragma once
#include<iostream>
using namespace std;

struct Student {
	string sname;
	double score;
};

struct Teacher {
	string tname;
	struct Student stu_list[3];
};

void test5(struct Teacher *);
