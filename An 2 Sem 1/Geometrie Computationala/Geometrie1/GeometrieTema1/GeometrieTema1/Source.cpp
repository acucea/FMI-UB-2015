#include <iostream>
#include <string>
#include <cmath>


using namespace std;

class MyPoint
{
public:
	int  x, y, z;
public:
	MyPoint()
	{
		cout << "A point";
	}
	MyPoint(float x, float  y, float z)
	{
		this->x = x;
		this->y = y;
		this->z = z;
	}
};

int distance(MyPoint point1, MyPoint point2)
{
	return  sqrt(((point2.x - point1.x) ^ 2) + ((point2.y - point1.y) ^ 2) + ((point2.z - point1.z) ^ 2));
}

bool collinear(int dist12, int dist13, int dist23)
{
	if (dist23 = dist12 + dist13)
		return true;
	if (dist12 = dist13 + dist23)
		return true;
	if (dist13 = dist12 + dist23)
		return true;
	return false;
}

void afineCombination(MyPoint point1, MyPoint point2, MyPoint point3)
{
	int x, y;
	x = (point2.x + point3.x) / (point2.x + point1.x);
	y = x - 1;
	cout << "C = " << x << "A+" << y << "B";
}


int pain()
{
	int dist12, dist13, dist23;
	MyPoint point1(-2, 3, 5);
	MyPoint point2(1, 2, 3);
	MyPoint point3(7, 0, -1);
	dist12 = distance(point1, point2);
	dist13 = distance(point1, point3);
	dist23 = distance(point2, point3);

	if (collinear(dist12, dist13, dist23) == true)
		cout << "True";
	else
		cout << "False";
	afineCombination(point1, point2, point3);

	int x;
	cin >> x;
	return 0;
}
