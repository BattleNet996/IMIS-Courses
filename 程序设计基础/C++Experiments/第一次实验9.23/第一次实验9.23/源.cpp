/*   TEST 3
#include <iostream>
#include <math.h>
using namespace std;
double f(double a, double b);
int main() {
	double a, b;
	cout << "please enter a & b" << endl;
	cin >>a>>b;
	cout << "直角边分别为" << a << "和" << b << "的三角形的斜边为" << f(a,b) << endl;
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
	cout << "头数为" << head(x,y) << endl;
	cout << "脚数为" << foot(x, y) << endl;
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
	cout << "输入你答对的题目数" << endl;
	cin >> x1;
	cout << "你的得分为" << f(x1);
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
	cout << "请分别输入平行四边形的两边和夹角" << endl;
	cin >> a >> b >> d;
	cout << "平行四边形的面积为" << f(a, b, d) << endl;
}
double f(double a, double b, double d) {
	double s,pi,m;
	pi = 3.141596535;
	m = d * pi / 180.0;
	s = a * b * sin(m);
	return s;
}
*/

