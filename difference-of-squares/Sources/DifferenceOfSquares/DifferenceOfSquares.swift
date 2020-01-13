//Solution goes in Sources
struct Squares {
    let numbers: [Int]
    
    init(_ number: Int) {
        numbers = Array(1...number)
    }
    
    func square(of number: Int) -> Int {
        return number * number
    }
    
    var squareOfSum: Int {
        get { return square(of: numbers.reduce(0, +)) }
    }
    
    var sumOfSquares: Int {
        get { return numbers.map(square).reduce(0, +) }
    }
    
    var differenceOfSquares: Int {
        get { return squareOfSum - sumOfSquares }
    }
}
