class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var dict = [Int:Int]()
        for num in nums {
            dict[num, default:0]+=1
        }
        for(key, value) in dict {
            if value % 2 != 0 {
                return false
            }
        }
        return true
    }
}