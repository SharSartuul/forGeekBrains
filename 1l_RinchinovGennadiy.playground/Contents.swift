import UIKit

// 1. Решить квадратное уравнение
let a:Float = 1
let b:Float = 2
let c:Float = 3
var x1:Float
var x2:Float
var d:Float
var discriminant:Float
d = b * b - (4 * a * c)
if(d >= 0){
    discriminant = sqrt(d)
    x1 = (-b + discriminant) / (2 * a)
    x2 = (-b - (discriminant)) / (2 * a)
    print(x1, x2)
}else if(d < 0){
    d = ((4 * a * c) - pow(b,2)) / (2 * a)
    print(d)
}


// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
var e:Double = 6
var f:Double = 8
var g:Double = 10
var h:Double
var s:Double
s = (e * f)/2
h = e + f + g
g = sqrt(pow(h,2) + pow(f,2))
print("Площадь прямоугольника равна \(s)")
print("Периметр треугольника равен \(h)")
print("Гипотенуза треугольника равна \(g)")


// 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var deposit:Float = 1000000
var percent:Float = 10
percent = percent / 100
var result1 = deposit + (deposit * percent)
var result2 = result1 + (result1 * percent)
var result3 = result2 + (result2 * percent)
var result4 = result3 + (result3 * percent)
var result5 = result4 + (result4 * percent)
var counter = 1
var time = [result1, result2,result3, result4, result5]
for i in time{
    print("Через \(counter) год/лет сумма вклада будет равна: \(i)")
    counter += 1
}
