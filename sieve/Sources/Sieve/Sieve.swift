struct Sieve {
    let number: Int

    init(_ number: Int) {
        self.number = number
    }
    
    var primes: [Int] {
        let consecutives = 2..<number
        let result = [2]
        let arr = Array(repeating: true, count: number)
        
        for n in consecutives {
            let ns = stride(from: n, to: number, by: n)
        }
        
        return result
    }
}
precedencegroup Functional {
    associativity: left
    higherThan: DefaultPrecedence
}

infix operator |>: Functional
func |> <T,U>(x: T, f: (T) -> U) -> U {
    return f(x)
}

infix operator <*>: Functional
func <*> <T, U>(f:)
