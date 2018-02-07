//: Playground - noun: a place where people can play

import UIKit

/*
 维基百科:
 在计算机科学中，柯里化（英语：Currying），又译为卡瑞化或加里化，是把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，并且返回接受余下的参数而且返回结果的新函数的技术。
 */

// 批量类似函数,柯里化前
func addOne(num: Int) -> Int {
    return num + 1
}

func addTwo(num: Int) -> Int {
    return num + 2
}

print(addOne(num: 1))
print(addTwo(num: 1))
print("==========")

// 柯里化之后,创建批量类似函数
func addTo(_ adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let addThree = addTo(3)
let addFovr = addTo(4)
let addFive = addTo(5)

print(addThree(1))
print(addFovr(1))
print(addFive(1))

// 文中例子是比较数字大小
func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    return {$0 > comparer}
}

let greaterThan10 = greaterThan(10)

greaterThan10(15)
greaterThan10(5)
