import UIKit

//제너릭 함수
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
   let tempA = a
   a = b
   b = tempA
}

//제너릭 타입

struct Stack<T> {
    let items: [T] = []
 
  //  mutating func push(_ item: T) {  }
   //  mutating func pop() -> T {}
}



func isSameValues<T: Equatable>(_ a: T, _ b: T) -> Bool {
    return a == b
}
//Equatable 프로토콜, 제약을 주지 않으면 에러 발생, T가 Equatable을 준수하지 않을 수도 있기 때문!


// 제네릭 함수 오버로딩

func swapValues<T>(_ a: inout T, _ b: inout T) {
    print("generic func")
    let tempA = a
    a = b
    b = tempA
}
 
func swapValues(_ a: inout Int, _ b: inout Int) {
    print("specialized func")
    let tempA = a
    a = b
    b = tempA
}
 
var a = 1
var b = 2
swapValues(&a, &b)          //"specialized func"
 
 
var c = "Hi"
var d = "Sodeul!"
swapValues(&c, &d)          //"generic func"
