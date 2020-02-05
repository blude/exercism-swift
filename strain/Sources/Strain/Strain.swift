extension Sequence {
    func keep(predicate: (Element) -> Bool) -> [Element] {
        var elements = [Element]()
        for element in self {
            if predicate(element) {
                elements.append(element)
            }
        }
        return elements
    }
    
    func discard(predicate: (Element) -> Bool) -> [Element] {
        return keep { !predicate($0) }
    }
}
