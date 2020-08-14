func flattenArray<Flatten, Nested>(_ array: [Nested]) -> [Flatten] {
    var flatten: [Flatten] = []
    
    for item in array {
        if let item = item as? Flatten {
            flatten.append(item)
        }
        
        if let items = item as? [Nested] {
            let result: [Flatten] = flattenArray(items)
            for i in result {
                flatten.append(i)
            }
        }
    }
    
    return flatten
}

