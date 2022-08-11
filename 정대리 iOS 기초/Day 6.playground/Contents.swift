import UIKit


//모듈 - struct, class
//모듈에 여러가지 데이터를 덩어리로 모아둠.


print("====struct====")
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

print("====class====")
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


//!struct는 값복사 class는 참조복사!


