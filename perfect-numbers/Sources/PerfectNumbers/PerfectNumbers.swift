enum NumberClassification {
    case perfect, abundant, deficient
}

struct NumberClassifier {
    let number: Int
    
    typealias AliquotSum = Int
    typealias Divisors = [Int]
    
    var classification: NumberClassification {
        let sum = aliquotSum(of: self.number)
        
        switch sum {
        case _ where sum > number:
            return .abundant
        case _ where sum < number:
            return .deficient
        default:
            return .perfect
        }
    }
    
    func aliquotSum(of number: Int) -> AliquotSum {
        return divisors(of: number).reduce(0, +)
    }
    
    func divisors(of number: Int) -> Divisors {
        var divisors = [Int]()
        var n = 1
        
        while n <= number / 2 {
            if number % n == 0 {
                divisors.append(n)
            }
            n += 1
        }
        
        return divisors
    }
    
}
