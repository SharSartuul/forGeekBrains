import UIKit

//1. Написать функцию, которая определяет, четное число или нет:
var numberArray = [7, 34, 48, 50, 11, 14, 89, 99, 64]
for sortingOne in numberArray{
    if sortingOne % 2 == 0 {
        print("\(sortingOne) - четное число")
    } else {
        print("\(sortingOne) - нечетное число")
    }
}

//2. Написать функцию, которая определит делится ли число без остатка на 3:
for sortingTwo in numberArray{
    if sortingTwo % 3 == 0 {
        print("\(sortingTwo) - делится на 3 без остатка")
    } else {
        print("\(sortingTwo) - делится на 3 с остатком")
    }
}

//3. Создать возрастающий массив из 100 чисел:
var oneSotnya: Array<Int> = []
for i in 1...100{
    oneSotnya.append(i)
}
print(oneSotnya)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3:
var Otstrel = oneSotnya.filter {$0 % 2 != 0 && $0 % 3 == 0}
   print(Otstrel)

//5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов:
func fibonacciArray(_ n: Int) -> [Double] {
    var fibonacci: [Double] = [1, 1]
    (2...n).forEach{ i in
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(fibonacciArray(100))

//6. Заполнить массив из 100 элементов различными простыми числами:
func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))
