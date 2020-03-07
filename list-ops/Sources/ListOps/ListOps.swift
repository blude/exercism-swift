class ListOps {
    static func append<T>(_ aList: [T], _ anotherList: [T]) -> [T] {
        aList + anotherList
    }
    
    static func concat<T>(_ list: [T]...) -> [T] {
        var new = [T]()
        
        for element in list {
            new += element
        }
        
        return new
    }
    
    static func filter<T>(_ list: [T], _ clousure: (T) -> Bool) -> [T] {
        var new = [T]()
        
        for element in list {
            if clousure(element) {
                new += [element]
            }
        }
        
        return new
    }
    
    static func length<T>(_ list: [T]) -> Int {
        var count = 0
        
        for _ in list {
            count += 1
        }
        
        return count
    }
    
    static func map<T>(_ list: [T], clousure: (T) -> T) -> [T] {
        var new = [T]()
        
        for element in list {
            new += [clousure(element)]
        }
        
        return new
    }
    
    static func foldLeft<T>(_ list: [T], accumulated initial: T, combine: (T, T) -> T) -> T {
        var new = initial
        
        for element in list {
            new = combine(new, element)
        }
        
        return new
    }
    
    static func foldRight<T>(_ list: [T], accumulated initial: T, combine: (T, T) -> T) -> T {
        var new = initial
        
        for element in reverse(list) {
            new = combine(element, new)
        }
        
        return new
    }
    
    static func reverse<T>(_ list: [T]) -> [T] {
        var new = [T]()
        
        var count = list.count - 1
        
        while count >= 0 {
            new += [list[count]]
            count -= 1
        }
        
        return new
    }
}
