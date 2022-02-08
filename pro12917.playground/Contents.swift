import UIKit

func solution(_ s:String) -> String {
    var answer=String(s.sorted(by : >))
    return answer
}

solution("Zbcdefg")
