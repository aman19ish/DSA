class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        var lockedBrackets = [Int]()
        var freeBrackets = [Int]()
        let sChars = Array(s)
        let lockedChars = Array(locked)
        for i in 0..<sChars.count {
            if lockedChars[i] == "1" {
                if sChars[i] == "(" {
                    lockedBrackets.append(i)
                } else {
                    if lockedBrackets.count > 0 {
                        lockedBrackets.removeLast()
                    } else if freeBrackets.count > 0 {
                        freeBrackets.removeLast()
                    } else {
                        return false
                    }
                }
            } else {
                freeBrackets.append(i)
            }
        }
        while !lockedBrackets.isEmpty {
            if !freeBrackets.isEmpty {
                if lockedBrackets.last! < freeBrackets.last! {
                    lockedBrackets.removeLast()
                    freeBrackets.removeLast()
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return freeBrackets.count % 2 == 0
    }
}