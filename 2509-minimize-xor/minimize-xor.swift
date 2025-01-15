class Solution {
    func minimizeXor(_ num1: Int, _ num2: Int) -> Int {
        var countBitsNum2 = 0
        var temp2 = num2
        while temp2 > 0 {
            if temp2 % 2 != 0 {
                countBitsNum2 += 1
            }
            temp2 >>= 1
        }

        var result = 0
        for i in stride(from: 31, through: 0, by: -1) {
            if (num1 & (1 << i)) != 0 && countBitsNum2 > 0 {
                result |= (1 << i)
                countBitsNum2 -= 1
            }
        }

        for i in 0..<32 {
            if countBitsNum2 > 0 && (result & (1 << i)) == 0 {
                result |= (1 << i)
                countBitsNum2 -= 1
            }
        }
        
        return result
    }
}