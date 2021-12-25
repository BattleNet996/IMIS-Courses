#include <iostream>
using namespace std;

double f(double x);
int main() {
	double x;
	cout << "Please enter a number" << endl;
	cin >> x;
	cout << "The C degree is of " << x << " is" << f(x)<<endl;
	return 0;
}

double f(double x) {
	double result;
	result = 5  * (x - 32) / 9 ;  /*×¢ÒâCÓïÑÔµÄ¶àÌ¬*/
	//or result = 5 / 9.0 *(x-32)
	return result;
}