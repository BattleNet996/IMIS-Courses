/*   TEST 3
#include <iostream>
#include <math.h>
using namespace std;
double f(double a, double b);
int main() {
	double a, b;
	cout << "please enter a & b" << endl;
	cin >>a>>b;
	cout << "ֱ�Ǳ߷ֱ�Ϊ" << a << "��" << b << "�������ε�б��Ϊ" << f(a,b) << endl;
	return 0;
}
double f(double a, double b) {
	double c;
	c = sqrt(a * a + b * b);
	return c;
}
*/

/* TEST4
#include <iostream>
using namespace std;
int  head(int x, int y);
int foot(int x, int y);
int main() {
	int x;
	int y;
	x = 16;
	y = 40;
	cout << "ͷ��Ϊ" << head(x,y) << endl;
	cout << "����Ϊ" << foot(x, y) << endl;
	return 0;
}
int head(int x, int y) {
	int a;
	a = x + y;
	return a;
}
int foot(int x, int y) {
	int b;
	b = 2 * x + 4 * y;
	return b;
}
*/

/* TEST 5
#include <iostream>
using namespace std;
int f(int x);
int main() {
	int x1;
	cout << "�������Ե���Ŀ��" << endl;
	cin >> x1;
	cout << "��ĵ÷�Ϊ" << f(x1);
	return 0;
}
int f(int x) {
	int result;
	result = 8 * x - 5 * (26-x);
	return result;
}
*/

/* TEST 7
#include <iostream>
using namespace std;
int a(int x);
int b(int x);
int c(int x);
int main() {
	int x1;
	cout << "enter a number" << endl;
	cin >> x1;
	cout << "The number contains"<< a(x1)<<','<<b(x1) << ',' <<c(x1) <<endl;
	return 0;
}
int a(int x) {
	int result;
	result = x / 100;
	return result;
}int b(int x) {
	int result;
	result = (x /10)% 10;
	return result;
}
int c(int x) {
	int result;
	result = x % 10;
	return result;
}
*/

/* TEST 8
#include <iostream>
using namespace std;
double f(double a, double b,double d);
int main() {
	double a;
	double b;
	double d;
	cout << "��ֱ�����ƽ���ı��ε����ߺͼн�" << endl;
	cin >> a >> b >> d;
	cout << "ƽ���ı��ε����Ϊ" << f(a, b, d) << endl;
}
double f(double a, double b, double d) {
	double s,pi,m;
	pi = 3.141596535;
	m = d * pi / 180.0;
	s = a * b * sin(m);
	return s;
}
*/

