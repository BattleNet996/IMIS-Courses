#include <iostream>
using namespace std;
double f(double x);// ����ԭ��
int main()
{
	//�����Ǻ����ļ��ϣ�ͨ�����������γɳ��������ڵ��߼�����
	double x1;//����+����
	cout << "please input x1" << endl;
	cin >> x1;
	cout << "f(" << x1 << ")=" << f(x1) << endl;
	return 0;
}

double f(double x)
{
	double result;
	result = (x * x + 8 * x - 12) / (x * x + 5);
	return result;
}

//������ֵ��void
//����ͷ���뷵��ֵ���͵���ʽת��
//��ʾ����ת��
//int f(double x)
//{
//	double result;
//	result = (x * x + 8 * x - 12) / (x * x + 5);
//	return (int)result;
//}
//int f(double x)
//{
//	double result;
//	result = (x * x + 8 * x - 12) / (x * x + 5);
//	return int(result);
}