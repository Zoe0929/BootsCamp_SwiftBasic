import UIKit

// 사람 클래스
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}
// 사람이 사는 집 클래스
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name:"yagom")
let apart: Apartment? = Apartment(dong:"101", ho:"202")
let superman: Person? = Person(name:"superman")


// 옵셔널 체이닝을 사용 코드 간결화
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: yagom)
// 우리집 경비원은 직업이 없어요


yagom?.home?.guard?.job // nil

yagom?.home = apart

yagom?.home // Optional(Apartment)
yagom?.home?.guard // nil

// 경비원 할당
yagom?.home?.guard = superman

yagom?.home?.guard // Optional(Person)

yagom?.home?.guard?.name // superman
yagom?.home?.guard?.job // nil

yagom?.home?.guard?.job = "경비원"

                    
// nil 병합 연산자
//옵셔널의 값이 nil인 경우 ?? 뒤의 값을 대입
var guardJob: String

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)
                                
yagom?.home?.guard?.job = nil
                                
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)
