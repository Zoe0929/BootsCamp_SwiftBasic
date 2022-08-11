import UIKit

//함수, 메소드 정의
//func 함수이름 (매개변수 이름:매개변수 타입)-> 반환 타입
func myFunction(name:String) -> String{
    return "Hello, my name is \(name)"
}
//함수, 메소드 호출
myFunction(name: "Zoe")

//로직 처리는 name으로 하나, 호출시는 with 사용
func myFunctionsecond(with name:String) -> String{
    return "Hello, my name is \(name)"
}

myFunctionsecond(with: "John")

//매개변수를 따로 쓰고 싶지 않을 때는 _ 사용

func myFunctionThird(_ name:String) -> String{
    return "Hello, my name is \(name)"
}

myFunctionThird("May")

