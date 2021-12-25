//课堂示例1: 返回字符串长度
/*
#include<iostream>
using namespace std;

int strlen(char str[]);

int main()
{
	//法一：赋值初始化
	//char str[100] = "abbb0bbbb";
	//法二：流插入运算符——遇到空格会终止并输入→只能读一个单词
	//char str[100];
	//cout << "please input a string" << endl;
	//cin >> str;
	//法三：cin.getline()
	char str[100];
	cout << "please input a string" << endl;
	cin.getline(str,100);

	cout << "length=" << strlen(str) << endl;
}
int strlen(char str[])
{
	int length=0;
	
	while (str[length++]);
	
	return --length;
}
*/


//课堂示例2: 二维字符数组

#include <iostream>
#include<string>
using namespace std;

void name_in(char[][7], int size);
void name_out(char[][7], int size);
void name_join(char[][7], int size, char[]);
void count(char[], int[]);
void buble(char[][7], char[][7], int size);

int main()
{
	int line = 5;
	char name[100][7];    //100行，每行分配7个字节，	其中6个字节存储字符，最大容纳3个汉字
	char name2[200][7];
	char bind[601];

	name_in(name, line);
	//name_out(name, line);
	//name_join(name, line, bind);
	//cout << bind << endl;
	buble(name, name2, 100);

	return 0;
}

void name_in(char name[][7], int size)
{
	int i;

	for (i = 0; i < size; i++)
	{
		cin >> name[i]; //二维数组的读取，只需要考虑每一行就行!
	}
}

void name_out(char name[][7], int size)
{
	int i;

	for (i = 0; i < size; i++)
	{
		cout << name[i] << endl; //二维数组的读取，只需要考虑每一行就行!

	}
}

void name_join(char name[][7], int size, char bind[])
{
	int i, j;
	int count = 0;

	for (i = 0; i < size; i++)
	{
		for (j = 0; name[i][j]; j++)
		{
			bind[count] = name[i][j];
			count++;
		}
	}
	bind[count] = '\0';
}

void count(char str[], int num[], int size)
{
	int i;

	for (i = 0; i < size; i++)
	{
		num[i] = 0;
	}

	for (i = 0; str[i]; i++)       //注意字符串数组遍历的终止条件
	{
		if (str[i] == ' ')
		{
			num[0]++;
		}
		else if (str[i] >= '0' && str[i] <= '9')   //'0'与 '\0'完全不同，前者为字符0，后者为编码为0的字符==0！
		{
			num[1]++;
		}
		else if (str[i] >= 'A' && str[i] <= 'Z' || str[i] >= 'a' && str[i] <= 'z')
		{
			num[2]++;
		}
		else
		{
			num[3]++;
		}
	}
}

void buble(char name[][7], char name2[][7], int size)
{
	int i;

	for (i = 0; i < 5; i++)
	{
		if (strcmp(name[i], name[i + 1]) > 0) {
			strcpy_s(name2[i], name[i]);
			strcpy_s(name[i], name[i + 1]);
			strcpy_s(name[i + 1], name2[i]);

		}	
	}
}


/*
//TEST 12.8 数组排序
#include <iostream>
using namespace std;
const int SIZE = 8;

void bubble_sort(int[], int size);

int main()
{
	int num[SIZE] = {7,3,2,5,1,4,8,6};

	bubble_sort(num, SIZE);

	return 0;
	
}

void bubble_sort(int num[], int size)
{
	int tmp;
	int flag = 0;

	for(int i=0;!flag && i<size/2;i++)
	{
		if (num[i] < num[i + 1])
		{
			tmp = num[i];
			num[i] = num[i + 1];
			num[i + 1] = num[i];
		}
		flag = 0;
	}
}
*/


/*
#include <iostream>
#include<string.h>
using namespace std;
const int SIZE = 20;

void str_in(char[]);
void str_out(char[]);
int str_join(char [],char [],int pos, int size);

int main()
{
	char str[SIZE];
	char str2[SIZE];

	str_in(str);
	str_in(str2);
	str_out(str);
	cout << endl;
	str_out(str2);
	cout << endl;

	str_join(str, str2, 3, SIZE);
	str_out(str);

	return 0;
		
}

void str_in(char str[])
{
	
	//cout << "请输入字符串" << endl;
	//for (int i = 0; i < size; i++)
	//{
	//	cin >> str[i];
	//}
	cin >> str;
}

void str_out(char str[])
{
	//int i;

	//for (i = 0; i < size; i++)
	//{
	//	cout << str[i] << endl; //二维数组的读取，只需要考虑每一行就行!
	//}
	cout << str;
}


int str_join(char str[], char str1[], int pos, int size)
{
	if (strlen(str) + strlen(str1) > size)
	{
		cout << "Memory Error!" << endl;

		return -1;
	}
	else if(pos<-1 || pos>strlen(str)){
		cout << "Wrong Postion!" << endl;

		return -1;
	}
	else {
		cout << strlen(str1) << endl;
		for (int i = pos + 1; i < strlen(str1) + pos+ 1; i++)
		{
			str[i + strlen(str1)] = str[i];
			str[i] = str1[i-pos-1];
		}
		return 0;
	}
}
*/


/*
// 13.4 指针逆序输出打印

#include <iostream>
using namespace std;
const int SIZE = 20;

void print(int [],int size);

int main()
{
	int a[SIZE] = { 1,3,7,2,9,6,5,8,2,0,4,8,2,0,4 };

	print(a,15);

	return 0;
}

void print(int a[],int size)
{
	int* p = a; //指针创建指向数组a[0]完成初始化

	for (int i = 0; i < size; i++)
	{
		cout << *(p + size - i - 1) << endl;
	}
}

*/

/*
#include <iostream>
#include<string.h>
using namespace std;

int find(char[],char C);

int main()
{
	char S[100];
	cin >> S;
	char C ;
	cout << "输入想要查找的字符： ";
	cin >> C;
	find(S,C);

	return 0;
}

int find(char S[], char C)
{
	for(int i=0;i < strlen(S);i++)
	{ 
		if (S[i] == C)
		{
			cout << i;
			return 0;
		}
	}
	cout << "Not Found" << endl;
	return -1;
}
*/