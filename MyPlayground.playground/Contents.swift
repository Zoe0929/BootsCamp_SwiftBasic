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
print("yourMiddleSchoolName:\(SchoolDetail.getName())")

