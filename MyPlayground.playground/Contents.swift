import UIKit

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

