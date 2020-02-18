import UIKit


/*Дан массив целый чисел, необходимо реализовать метод, вручную его разворачивающий, не используя системные методы наподобие reverse,  вспомогательные массивы и структуры данных.

Т.е. необходимо реализовать собственное решение, без использования готовых системных методов.

Например, на входе: [1, 2, 3, 4, 5], на выходе: [5, 4, 3, 2, 1]*/

//: Solution 1
extension Array where Element == Int {
    mutating func reverseArray() {
        let length = self.count //Определяем количество элементов в массиве
        for index in 0..<length/2 {
            //Меняем элементы местами с помощью дополнительной константы temp
            let temp = self[index]
            self[index] = self[length - 1 - index]
            self[length - 1 - index] = temp
        }
    }
}
var arr = [-1, 4, 8, 89]
print(arr)

arr.reverseArray()
print(arr)

//: Solution 2

func reversedArray(arr: [Int]) -> [Int] {
    var reversedArray = arr
    let length = reversedArray.count //Определяем количество элементов в массиве
    for index in 0..<length/2 {
        //Меняем элементы местами с помощью дополнительной константы temp
        let temp = reversedArray[index]
        reversedArray[index] = reversedArray[length - 1 - index]
        reversedArray[length - 1 - index] = temp
    }
    return reversedArray
}

var arr2 = [0, 6, 58, 9]
print(arr2)
arr2 = reversedArray(arr: arr2)
print(arr2)


/*Объявить переменную – матрицу целых чисел и проинициализировать ее рандомными (можно использовать системный генератор случайных чисел) значениями (т.е. не в ручную).

Матрица - это  массив массивов целых чисел размера NxM (строк x колонок), пусть N = 4, M = 5.

Желательно предусмотреть возможно задания N & M как константы и автоматически в цикле инициализировать матрицу.

Поменять значения строк в четных позициях на значения строк в нечетных позициях.

Как и в предыдущем задании необходимо использовать собственное ("ручное") решение.

Работу с матрицами необходимо осуществлять не как оперирование векторами, а как оперирование двойным/вложенным сабскриптом.

                Например, на выходе:

[0, 1, 2, 3]

[4, 5, 6, 7]

[8, 9, 0, 1]

[2, 3, 4, 5]

На выходе:

[4, 5, 6, 7]

[0, 1, 2, 3]

[2, 3, 4, 5]

[8, 9, 0, 1]
 */

func autoGenerateMatrix(rows: Int, columns: Int) -> [[Int]] {
    //Задаем матрицу в качестве computed property
    var matrix: [[Int]] {
        get {
            var newMatrix = [[Int]]()
            for _ in 0..<rows {
                var subArray = [Int]() //Определяем переменную в качестве строки массива
                for _ in 0..<columns {
                    subArray.append(Int.random(in: -9...9)) // Добавляем случайные значения в строку
                }
                newMatrix.append(subArray) //Добавлем строку в матрицу
            }
            for row in newMatrix {
                print(row)
            }
            return newMatrix
        }
    }
    return matrix

}

func rearrangeMatrix(matrix: [[Int]]) -> [[Int]] {
    var rearrangedMatrix = matrix
    //Меняем значение элемента в четной строке на элемент в нечетной
    for i in 0..<rearrangedMatrix.count{
        if i % 2 != 0 { //Проверяем строку на четность дополнительно избегаем indexOutOfRange
            for j in 0..<rearrangedMatrix[i].count {
                //Меняем элементы местами с помощью дополнительной константы temp
                let temp = rearrangedMatrix[i][j]
                rearrangedMatrix[i][j] = rearrangedMatrix[i-1][j]
                rearrangedMatrix[i-1][j] = temp
            }
        }

    }
    print("Результат замены строк в четных позициях на значения строк в нечетных позициях")
    for row in rearrangedMatrix {
        print(row)
    }
    return rearrangedMatrix
}


rearrangeMatrix(matrix: autoGenerateMatrix(rows: 4, columns: 3))

let matrix = autoGenerateMatrix(rows: 5, columns: 3)
rearrangeMatrix(matrix: matrix)

