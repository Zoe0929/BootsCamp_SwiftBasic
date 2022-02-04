import UIKit
import Foundation

//swift 의 enum : 케이스 , 경우를 나누는 키워드
//ex) 학교 - 초, 중, 고
enum School{
    case elementary, middle, high
}
//let: 상수, var: 변수
let yourSchool=School.high
print("yourSchool:\(yourSchool)")
//print("yourSchool:",yourSchool)

enum Grade : Int{
    case first=1
    case second=2
}

let yourGrade=Grade.second.rawValue //case의 값에 접근
print("yourGrade:\(yourGrade)")

enum SchoolDetail{
    case elementary(name:String)
    case middle(name:String)
    case high(name:String)
    func getName()->String{
        switch self{
        case .elementary(let name): return name
        case .middle(let name):return name
        case.high(let name):return name
        }
    } //문자열을 반환하는 함수(메소드),
}

let yourMiddleSchoolName=SchoolDetail.middle(name: "목암중학교")
//print("yourMiddleSchoolName:\(SchoolDetail.getName())")

for u in 0...5 {
    print(u)
}//(0~5까지 반복하는 반복문, in range)
for i in 0...5 where i % 2 == 0 {
    print(i)
}//(where은 조건문.)

//0...5 -> 0이상 5이하, 0...<5 0이상 5미만(5 포함 X)


//day2 foreach 반복문

var myArray: [Int]=[0,1,2,3,4,5,6,7,8,9,10]
//콜렉션- 데이터를 모아둔 것.
//종류 : 배열,셋,딕셔너리

for item in myArray{
    print("item: \(item)")
}

for item in myArray where item%2==0{
    print("짝수:\(item)")
}


var someVariable : Int? = nil
//값이 비어있는 상태. 옵셔널 변수 unwrapping
//옵셔널이란 ? 값의 유무를 알 수 없다.

if someVariable == nil {
    someVariable=40 //옵셔널 상태이기 때문에 값을 넣어도 옵셔널이라고 포기됨 Optional(40)
} //nil==null

//언래핑이란? 감싸져있는 것을 벗기는 것-> 옵셔널 상태 해제.

if let otherVariable = someVariable {
    print("언래핑되었다. 값이 있다.")
}
else{
    print("값이 없다.")
}

someVariable=nil
//someVariable이 비어있으면, 기본값 설정 가능
let myValue=someVariable ?? 10
print("myValue:\(myValue)")


var firstValue : Int? = 30
var secondValue : Int? = 50
//firstValue, secondValue 모두 언랩핑 상태

print("firstValue:\(firstValue)")
print("secondValue:\(secondValue)")

unwrap(firstValue)
unwrap(secondValue)

func unwrap(_ parameter: Int?){
    print("unwrap() called")
    guard let unWrappedParam = parameter else{
        return
    }
}
