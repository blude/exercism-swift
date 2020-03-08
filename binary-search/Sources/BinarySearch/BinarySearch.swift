import Foundation

enum BinarySearchError: Error {
    case unsorted
}

class BinarySearch {
    let list: [Int]
    
    init(_ list: [Int]) throws {
        guard list.sorted() == list else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }
    
    var middle: Int {
        (list.count - 1) / 2
    }
    
    func searchFor(_ number: Int) -> Int? {
        var start = 0
        var listSize = list.count - 1
        
        while start <= listSize {
            let middle = start + (listSize - start) / 2
            
            // Check if number is present at middle
            if list[middle] == number {
                return middle
            
            // if number is greater, ignore left half
            } else if list[middle] < number {
                start = middle + 1
            
            // if number is smaller, ignore right half
            } else {
                listSize = middle - 1
            }
        }
        
        // element not present
        return nil
    }
    
    
}
