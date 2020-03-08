enum BinarySearchError: Error {
    case unsorted
}

class BinarySearch {
    let list: [Int]
    init(_ list: [Int]) throws {
        guard list.sorted() == list else { throw BinarySearchError.unsorted }
        self.list = list
    }
    
    var middle: Int {
        (list.count - 1) / 2
    }
    
    func searchFor(_ number: Int) -> Int? {
        list.firstIndex(of: number)
    }
    
    
}
