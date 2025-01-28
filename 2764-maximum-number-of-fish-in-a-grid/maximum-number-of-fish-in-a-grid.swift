class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        var m = grid.count
        var n = grid[0].count
        var rowArray = [-1, 0, 1, 0]
        var colArray = [0, 1, 0, -1]
        var queue: [[Int]] = []
        var fishSum = 0
        var sum = 0
        var vistied: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] > 0 && vistied[i][j] == false {
                    queue.append([i, j])
                    vistied[i][j] = true

                    while !queue.isEmpty {
                        var curr = queue.removeFirst()
                        var row = curr[0]
                        var col = curr[1]

                        sum += grid[row][col]

                        for i in 0..<rowArray.count {
                            var nrow = row + rowArray[i]
                            var ncol = col + colArray[i]

                            if nrow >= 0 && nrow < m && ncol >= 0 && ncol < n && grid[nrow][ncol] > 0 && vistied[nrow][ncol] == false {
                                vistied[nrow][ncol] = true
                                queue.append([nrow,ncol])
                            }
                        }
                    }

                    fishSum = max(fishSum, sum)
                    sum = 0
                }
            }
        }
        return fishSum
    }
}