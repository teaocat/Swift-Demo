//: [Previous](@previous)

import UIKit

/*
 因为 Swift 的 Protocol 不仅能被 Class类型实现, 还可以被 struct 和 enum 类型实现, 但是想要改变 struct 和 enum 的变量时, 不能直接修改变量而是需要使用 mutating 关键字修饰的函数进行修改, 所有在设计 Protocol 的时候需要考虑给其他人使用的时候是否会被 struct 和 enum 类型实现, 并且需要修改其变量
 另外, 在使用 class 来实现带有 mutating 的方法的协议(Protocol)时, 具体实现的前面不需要加 mutating 关键字进行修饰, 因为 class 可以自己随意修改变量, 所以 mutating 对 class 的实现是透明的
 */

protocol Vehicle {
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor() {
        color = .red
    }
}

