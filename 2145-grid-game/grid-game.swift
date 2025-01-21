class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        var prefSum0 = Array(repeating: 0, count: n + 1)
        var prefSum1 = Array(repeating: 0, count: n + 1)

        for i in 0..<n {
            prefSum0[i + 1] = prefSum0[i] + grid[0][i]
            prefSum1[i + 1] = prefSum1[i] + grid[1][i]
        }
        
        var firstRobotBestIndex = -1, secondRobotMaxPoints = Int.max
        for i in 0..<n {
            let firstRowPoints = prefSum0[n] - prefSum0[i + 1]
            let secondRowPoints = prefSum1[i] - prefSum1[0]
            if max(firstRowPoints, secondRowPoints) < secondRobotMaxPoints {
                firstRobotBestIndex = i
                secondRobotMaxPoints = max(firstRowPoints, secondRowPoints)
            }
        }

        return secondRobotMaxPoints
    }
}