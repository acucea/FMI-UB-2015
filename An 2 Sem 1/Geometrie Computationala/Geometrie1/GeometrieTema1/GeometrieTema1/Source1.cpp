#include <iostream>
#include <cmath>
//Problema 1
using namespace std;

class Point
{
private:
	double x, y, z;
public:
	Point() { x = y = z = 0; };
	Point(double a, double b, double c) { x = a; y = b; z = c; }
	~Point() {};

	//Egalitate intre puncte
	bool operator==(Point& pct) {
		if (x == pct.x&&y == pct.y&&z == pct.z) {
			return true;
		}
		return false;
	}
	// Inmultire doua puncte
	Point operator*(Point& pct) {
		Point temp(pct.x - x, pct.y - y, pct.z - z);
		return temp;
	}

	double get_x() {
		return x;
	}
	double get_y() {
		return y;
	}
	double get_z() {
		return z;
	}

	// daca o cordonata e 0
	bool isZero(double coord) {
		if (coord == 0) {
			return true;
		}
		return false;
	}

	/*bool isZero() {
		if (x == 0 || y == 0 || z == 0) {
			return true;
		}
		return false;
	}*/
};


int main() {

	Point A(0, 0, 0), B(0, 2, 4), C(0, 2, 4);
	//Point A(1, 2, 3), B(4.5, 5.5, 6.5), C(4.5, 5.5, 6.5);
	//Point A(0, 0, 0), B(0, 4, 6), C(0, 2, 3);
	//Point A(5, 2, 0), B(3, 7, 1), C(0, 0, 2);
	

	//Doar citirea
	/*double x, y, z;
	cout << "A\n";
	cout << "x = "; cin >> x; cout << "y = "; cin >> y; cout << "z = "; cin >> z;
	Point A(x, y, z);
	cout << "B\n";
	cout << "x = "; cin >> x; cout << "y = "; cin >> y; cout << "z = "; cin >> z;
	Point B(x, y, z);
	cout << "C\n";
	cout << "x = "; cin >> x; cout << "y = "; cin >> y; cout << "z = "; cin >> z;
	Point C(x, y, z);*/

	//Rezolvare efectiva
	double labda;

	if (!(A == B) && !(B == C) && !(A == C))
	{
		Point AB = A*B;
		Point BC = B*C;

		bool ok;

		if ((AB.get_x())*(BC.get_y()) == (AB.get_y())*(BC.get_x()) 
			&& (AB.get_y())*(BC.get_z()) == (AB.get_z())*(BC.get_y()))
			ok = true;
		else ok = false;

		if (ok)
		{
			if (!BC.isZero(BC.get_x()))
			{
				labda = AB.get_x() / BC.get_x();
			}
			else if (!BC.isZero(BC.get_y())) {
				labda = AB.get_y() / BC.get_y();
			}
			else if (!BC.isZero(BC.get_z())) {
				labda = AB.get_z() / BC.get_z();
			}
			else {
				labda = 0;
			}
			if (labda) {
				cout << "Punctele sunt coliniare!\n";
				cout << "A = " << (1 + labda) << "B + (";
				cout << (-labda);
				cout << ")C" << endl;
				/*if (labda*(-1) > 0) 
					cout << -labda;
				else cout << labda;
				cout << ")C" << endl;*/
			}
			else {
				cout << "Punctele sunt necoliniare";
			}
		}

		else {
			cout << "Punctele sunt necoliniare" << endl;
		}
	}
	else
	{
		if (A == B){
			cout << "A = " << 1 << "B + " << 0 << "C" << endl;
		}
			if (B == C) {
				cout << "B = " << 1 << "C + " << 0 << "A" << endl;
			}
		if (A == C) {
			cout << "A = " << 1 << "C + " << 0 << "B" << endl;
		}
	}

	int zz;
	cin >> zz;
	return 0;
}