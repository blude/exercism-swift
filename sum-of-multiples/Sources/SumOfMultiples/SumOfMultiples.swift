class SumOfMultiples {
    static func toLimit(_ number: Int, inMultiples multiples: [Int]) -> Int {
        var sum = 0
        
        for i in 0 ..< number {
            multiples: for multiple in multiples {
                // Skip division by zero
                if multiple == 0 { continue }

                if i % multiple == 0 {
                    sum += i
                    // Break out of the multiples loop after the first match
                    break multiples
                }
            }
        }

        return sum
    }
}
