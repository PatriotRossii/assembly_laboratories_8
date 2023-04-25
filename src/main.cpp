#include <iostream>
#include <span>

using namespace std;

extern "C" void RowsSum_(
	int *array, int *outputArray,
	int rows, int columns
);
extern "C" void ColumnsSum_(
	int *array, int *outputArray,
	int rows, int columns
);

static void PrintResult(
	const char* msg,
	std::span<int> rowsSum, std::span<int> columnsSum
) {
	cout << msg << '\n';

	cout << "Сумма значений в строках: ";
	for (int element: rowsSum) {
		cout << element << ' ';
	}
	cout << '\n';

	cout << "Сумма значений в столбцах: ";
	for (int element: columnsSum) {
		cout << element << ' ';
	}
	cout << '\n';

	cout << std::endl;
}

int main() {
	{
		constexpr int ROWS = 4, COLUMNS = 3;

		int array[ROWS][COLUMNS] = {
			{42, 38, 61}, {50, 82, 50},
            {13, 30, 77}, {71, 48, 6}
		};
		int rowsSum[ROWS] = { 0 };
		int columnsSum[COLUMNS] = { 0 };

		RowsSum_(array[0], rowsSum, ROWS, COLUMNS);
		ColumnsSum_(array[0], columnsSum, ROWS, COLUMNS);
		PrintResult("Пример 1", rowsSum, columnsSum);
	}
	{
		constexpr int ROWS = 2, COLUMNS = 5;

		int array[ROWS][COLUMNS] = {
			{36, 2, 95, 71, 75},
			{70, 40, 44, 72, 36}
		};
		int rowsSum[ROWS] = {};
		int columnsSum[COLUMNS] = {};

		RowsSum_(array[0], rowsSum, ROWS, COLUMNS);
		ColumnsSum_(array[0], columnsSum, ROWS, COLUMNS);
		PrintResult("Пример 2", rowsSum, columnsSum);
	}
}