class Solution {
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        var numToPos = [Int: (i: Int, j: Int)]()
        for i in 0 ..< mat.count {
            for j in 0 ..< mat[i].count {
                numToPos[mat[i][j]] = (i, j)
            }
        }

        var unpaintedCountsI = Array(repeating: mat[0].count, count: mat.count)
        var unpaintedCountsJ = Array(repeating: mat.count, count: mat[0].count)

        for ind in 0 ..< arr.count {
            let (i, j) = numToPos[arr[ind]]!
            unpaintedCountsI[i] -= 1
            unpaintedCountsJ[j] -= 1

            if unpaintedCountsI[i] == .zero || unpaintedCountsJ[j] == .zero {
                return ind
            }
        }

        fatalError()
    }
}