class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        func dfs(node: Int) -> Bool {
            if visited[node] > 0 { return visited[node] == 2 }
            
            visited[node] = 1
            
            for next in graph[node]{
                if !dfs(node: next) { return false}
            }
            
            visited[node] = 2
            return true
        }
        
        
        var visited = Array(repeating: 0, count: graph.count)
        var ans = [Int]()
        
        for i in 0..<graph.count {
            if visited[i] == 0 {
                dfs(node:i)
            }
        }
        
        for i in 0..<visited.count {
            if visited[i] == 2 {
                ans.append(i)
            }
        }
        
        return ans
    }
}