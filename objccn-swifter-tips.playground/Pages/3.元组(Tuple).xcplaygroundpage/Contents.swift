//: [Previous](@previous)

import Foundation

// 交换输入，普通程序员亘古以来可能都是这么写的
func swapMe1<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}
var a = 3
var b = 5
print("a = \(a), b = \(b)")
swapMe1(a: &a, b: &b)
print("a = \(a), b = \(b)")

// 如果使用了元组的话, 我们可以不使用额外的空间就完成交换, 一下就达到了文艺程序员的写法
func swapMe2<T>(a: inout T, b: inout T) {
    (a, b) = (b, a)
}
swapMe2(a: &a, b: &b)
print("a = \(a), b = \(b)")
