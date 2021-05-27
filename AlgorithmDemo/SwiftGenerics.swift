//
//  SwiftGenerics.swift
//  AlgorithmDemo
//
//  Created by Liang Wang (QXW7463) on 2021/5/27.
//

import Foundation




/// 泛型函数
/// - Returns: 泛型函数返回类型
func swapObjects<T>(_ object1: inout T, _ object2: inout T) -> Void {
    let temp = object1
    object1 = object2
    object2 = temp
}

func testSwapObjects() {
    var a = "hello"
    var b = "world"
    print("swap before is \(a) \(b)")
    swapObjects(&a, &b)
    print("swap after is \(a) \(b)")
}


/// 泛型类型
/// 在swift中， struct 和 enum 是值类型，默认情况下，实例方法是不可以修改值类型的属性，使用mutating修饰后可修改属性的值
/// class 是引用类型，默认情况下就可以修改属性值，不需要使用mutating修饰
/// Int值型的栈
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T {
        return items.removeLast()
    }
}

/// 扩展一个泛型类型
/// 添加了一个名为top的只读计算属性，它将会返回当前栈顶端的元素而不会将其从栈中移除。
extension Stack {
    var top: T? {
        return items.last
    }
}

func testStackT() {
    var stringStack = Stack<String>()
    print("栈顶元素是: \(String(describing: stringStack.top))")
    stringStack.push("ObjectC")
    stringStack.push("Swift")
    stringStack.push("Java")
    stringStack.push("Python")
    print(stringStack.items)
    _ = stringStack.pop()
    print(stringStack.items)
    print("栈顶元素是: \(String(describing: stringStack.top))")
}


/// 泛型约束
class Person {
    func work() {
        print("Person work")
    }
}

class Teacher: Person {
    override func work() {
        print("Teacher work")
    }
}

class Doctor: Person {
    override func work() {
        print("Doctor work")
    }
}

func testWhoWork<T: Person>(p: T) {
    p.work()
}


/// 泛型协议
/// 定义泛型函数,为泛型添加协议约束,泛型类型必须遵循Equatable协议
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    var index = 0
    for value in array {
        if value == valueToFind {
            return index
        } else {
            index += 1
        }
    }
    return nil
}

func testFindIndex() {
    let stringIndex = findIndex(array: ["Mike", "John", "Kevin"], valueToFind: "Kevin")
    if let index = stringIndex {
        print("Kevin 的索引值是：\(index)")
    } else {
        print("Kevin 不存在")
    }
}


/// 定义一个泛型协议,和其他泛型使用方式不同,这里泛型是以关联类型形式使用的
protocol Stackable {
    // 协议中声明一个关联类型,使用associatedtype关键字
    associatedtype ItemType
    mutating func push(_ item: ItemType)
    mutating func pop() -> ItemType
}

//定义一个结构体类型,实现Stackable协议
struct MyStack<T>: Stackable {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

// 定义另外一个结构体类型,同样实现Stackable协议,实际上里面的实现和Stack一样
struct OtherStack<T>: Stackable {
    var items = [T]()
    mutating func push(_ item:T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

func pushItemOneToTwo<C1: Stackable, C2: Stackable>( stackOne: inout C1, stackTwo: inout C2) where C1.ItemType == C2.ItemType {
    // 因为C1和C2都遵循了Stackable协议,才有ItemType属性可以调用
    let item = stackOne.pop()
    stackTwo.push(item)
}


func testMyStack() {
    var stackOne = MyStack<String>()
    stackOne.push("hello")
    stackOne.push("swift")
    stackOne.push("world")
    let t = stackOne.pop()
    print("t = \(t)")
    
    var stackTwo = OtherStack<String>()
    stackTwo.push("where")
    
    pushItemOneToTwo(stackOne: &stackOne, stackTwo: &stackTwo)
    print("stackOne = \(stackOne.items), stackTwo = \(stackTwo.items)")
}




