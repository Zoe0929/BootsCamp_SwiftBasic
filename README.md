# Swift 기초 문법

### 1. 상수와 변수
- let : 상수 선언시 사용 -> 값 변경 불가
- var : 변수 선언시 사용 -> 값 변경 가능 

### 2. 보간법
- 보간법 : 문자열에서 자동 치환됨, 문자열 중간에서 변수나 상수를 사용하고 싶을 때 사용함.
- 사용 : \\(값)
```
var num1 : Int = 4
print("num1은 \(num1) 입니다.") //num1은 4입니다. 출력
```

### 3. enum
- case에 접근
- 상수를 열거형으로 사용하여 간편하게 

```   
enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second.rawValue
print("yourGrade : \(yourGrade)")


enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    func getName() -> String {
        switch self {
        case .elementary(let name):
            return name
        case let .middle(name):
            return name
        case .high(let name):
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name: "정대리중학교")

print("yourMiddleSchoolName: \(yourMiddleSchoolName.getName())")

```

### 4. Unwrapping 옵셔널 변수
- 값이 있는지 없는지 모르는 경우
```
// 옵셔널이란?
// 값이 있는지 없는지 모른다.
var someVariable : Int? = nil

if someVariable == nil {
    someVariable = 90
}

print("someVariable: ", someVariable) //optional(90)으로 출력
```
- unwrapping (언래핑) : (옵셔널으로) 감싸져 있는 걸 벗기는 것
- if let을 이용한 언래핑
```
if let otherVariable = someVariable {
    print("언래핑 되었다. 즉 값이 있다. otherVariable : \(otherVariable)")
} else {
    print("값이 없다.")
}
```
- 기본값 할당하기 : ?? 사용
```
let myValue = someVariable ?? 10
print("myValue: \(myValue)")
```
- gauard let을 이용한 언래핑
```
func unwrap(_ parameter: Int?) {
    print("unwrap() called")
    // 값이 없으면 리턴 해버린다.
    // 즉 지나간다.
    guard let unWrappedParam = parameter else {
        return
    }
    print("unWrappedParam: \(unWrappedParam)")
}
```

### 5. 클래스와 스트럭쳐(구조체)
- 모듈: 여러가지 데이터를 덩어리로 모아놈 (class, struct)
- 구조체(struct)
```
//struct 구조체
struct YoutuberStruct{
    var name : String
    var subscribersCount : Int
}

var devJeong = YoutuberStruct(name: "정대리", subscribersCount: 99999)

var devJeongClone = devJeong

//값 변경 전
print("값 변경 전: devJeongClone.name: \(devJeongClone.name)")

devJeongClone.name = "이대리"

//값 변경 후
print("값 변경 후: devJeong.name: \(devJeong.name)")
print("값 변경 후: devJeongClone.name: \(devJeongClone.name)")

//값 복사이기 때문에 원본 데이터 (devJeong)은 변경되지 않음, devJeong과 devJeongClone은 서로 다른 데이터.
```
- 클래스
```
//class
class YoutuberClass{
    var name: String
    var subscribersCount : Int
    //클래스의 차이점 : 생성자가 있다
    //생성자 : 즉, 메모리에 올린다. init으로 매게변수를 가진 생성자 메소드를 만들어야 매개변수를 넣어서 그 값을 가진 객체(object)를 가질 수 있다.
    init (name: String, subscribersCount: Int){
        self.name=name
        self.subscribersCount=subscribersCount
    }
    
}


var JeongDaeRi = YoutuberClass(name: "정대리", subscribersCount: 99999)

var JeongDaeRiClone = JeongDaeRi

//값 변경 전
print("값 변경 전: JeongDaeRiClone.name: \(JeongDaeRiClone.name)")

JeongDaeRiClone.name = "이대리"

//값 변경 후
print("값 변경 후: JeongDaeRi.name: \(JeongDaeRi.name)")
print("값 변경 후: JeongDaeRiClone.name: \(JeongDaeRiClone.name)")

//class는 참조복사이기 때문에 서로 연결되어 있어서 하나의 값이 변경되면 같이 변경됨.
```

<b> 구조체는 값복사(다른 종이) 클래스는 참조복사(같은 주소를 가르킴) </b>
  
### 6. property observer(프로퍼티 옵저버)
 - property observer(프로퍼티 옵저버): 값이 변경되는 과정을 볼 수 있음. 
```
  import UIKit

var myAge=0{
    willSet{
        print("값이 설정될 예정이다. / myAge=\(myAge)")
    }
    didSet{
        print("값이 설정되었다. / myAge=\(myAge)")
    }
}

print(myAge)

myAge=20
```

### 7. 함수 매개변수 
- 기본적인 함수, 매개변수 사용
```
func myFunction(name:String) -> String{
    return "Hello, my name is \(name)"
}
//함수, 메소드 호출
myFunction(name: "Zoe")
```
- 로직 처리는 name으로 하나, 호출시는 with 사용
```
func myFunctionsecond(with name:String) -> String{
    return "Hello, my name is \(name)"
}

myFunctionsecond(with: "John")

```
- 매개변수를 따로 작성하지 않아도 될 때
```
func myFunctionThird(_ name:String) -> String{
    return "Hello, my name is \(name)"
}

myFunctionThird("May")
```
