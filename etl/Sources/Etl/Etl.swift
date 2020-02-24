class ETL {
    static func transform(_ source: [Int: [String]]) -> [String: Int] {
        var transformed = [String: Int]()
        
        for (key, values) in source {
            for value in values {
                transformed[value.lowercased()] = key
            }
        }

        return transformed
    }
}
