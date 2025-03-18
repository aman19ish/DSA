class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        if (n > 1 && n <= 3) || n <= 0 {
            return false
        } else if n == 1 {
            return true
        } else if n % 4 == 0{
            return isPowerOfFour(n/4)
        }
        return false
    }
}