class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var ans = Set<Int>()
        var result: [Int] = []
        for i in 0..<A.count {
            ans.insert(A[i])
            ans.insert(B[i])
            result.append( (i+1)*2 - ans.count)
        }
        return result
    }
}