extension Array {
    func accumulate<T>(_ closure: (Element) -> T) -> [T] {
        var result = [T]()
        for element in self {
            result.append(closure(element))
        }
        return result
    }
}
