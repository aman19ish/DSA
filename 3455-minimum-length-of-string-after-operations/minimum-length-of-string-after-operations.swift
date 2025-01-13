class Solution {
    func minimumLength(_ s: String) -> Int {
        let n = s.count
        var removableLen = 0
        var freq = Array(repeating: 0, count: 26)
        
        for char in s {
            freq[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        for frequency in freq {
            if frequency % 2 != 0 {
                removableLen += frequency - 1
            } else if frequency != 0 {
                removableLen += frequency - 2
            }
        }
        return n - removableLen
    }
}