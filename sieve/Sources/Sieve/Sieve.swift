import Foundation

struct Sieve {
    let number: Int

    init(_ number: Int) {
        self.number = number
    }
    
    var primes: [Int] {
        var sieve = Array(repeating: true, count: number + 1)
        var primes = [Int]()
        
        for n in 2...number {
            guard sieve[n] else { continue }
            primes.append(n)
            for m in stride(from: n * n, through: number, by: n) {
                sieve[m] = false
            }
        }
        
        return primes
    }
}
