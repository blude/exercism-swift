struct Sieve {
    let number: Int

    init(_ number: Int) {
        self.number = number
    }
    
    var primes: [Int] {
        var integers = Array(repeating: true, count: number)
        
        for p in sequence(first: 2, next: { $0 * $0 <= number ? $0.advanced(by: 1) : nil }) {
            if integers[p] == true {
                for i in sequence(first: p * 2, next: { $0 <= number ? $0.advanced(by: p) : nil }) {
                    integers[i] = false
                }
            }
        }
        
        var result: [Int] = []
        
        for x in sequence(first: 2, next: { $0 <= number ? $0.advanced(by: 1) : nil }) {
            if integers[x] {
                result.append(x)
            }
        }
        
        return result
    }
}
