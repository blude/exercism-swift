class Grains {
    
    enum GrainsError: Error {
        case inputTooLow(message: String)
        case inputTooHigh(message: String)
    }
    
    static let numOfSquares = 64
    
    static let total: UInt64 = {
        var sum: UInt64 = 0
        
        for n in 1...numOfSquares {
            let grains = try! square(n)
            sum += grains
        }
        
        return sum
    }()
        
    static func square(_ n: Int) throws -> UInt64 {
        let message = "Input[\(n)] invalid. Input should be between 1 and \(numOfSquares) (inclusive)"

        if n > numOfSquares {
            throw GrainsError.inputTooHigh(message: message)
        } else if n < 1 {
            throw GrainsError.inputTooLow(message: message)
        } else if n == 1 {
            return 1
        } else {
            return try square(n - 1) * 2
        }
    }
}
    

