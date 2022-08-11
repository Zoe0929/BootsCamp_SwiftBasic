import UIKit
//String을 반환하는 클로저(메서드..?)
let myName:String={
    return "정대리"
}()

print(myName)

//클로저 정의 (매게 변수가 있는 경우!)
let myRealName:(String)->String={(name : String)->String in return "개발하는 \(name)"
}
print(myRealName("쩡대리"))

//반환 값이 없을 때 ->void 처리
let myRealNameLogic: (String)->Void={(name:String) in
    print("개발하는 \(name)")
}

myRealNameLogic("Zoe")
