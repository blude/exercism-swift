extension Int {
    enum ComparisonResult {
        case equal, greater, smaller
    }
    
    func compare(to other: Int) -> ComparisonResult {
        if self < other {
            return .smaller
        }
        
        if self > other {
            return .greater
        }
        
        return .equal
    }
}

enum NumberClassification {
    case perfect, abundant, deficient
}

struct NumberClassifier {
    let number: Int
    
    typealias AliquotSum = Int
    typealias Divisors = [Int]
    
    var classification: NumberClassification {
        let sum = aliquotSum(of: self.number)
        
        switch sum.compare(to: self.number) {
        case .equal:
            return .perfect
        case .greater:
            return .abundant
        case .smaller:
            return .deficient
        }
    }
    
    func aliquotSum(of number: Int) -> AliquotSum {
        return divisors(of: number).reduce(0, +)
    }
    
    func divisors(of number: Int) -> Divisors {
        var divisors = [Int]()
        var n = 1
        
        while n < number {
            if number % n == 0 {
                divisors.append(n)
            }
            n += 1
        }
        
        return divisors
    }
    
}
