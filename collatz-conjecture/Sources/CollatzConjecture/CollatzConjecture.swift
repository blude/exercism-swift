enum CollatzConjectureError: Error {
    case negativeNumber
}

class CollatzConjecture {

    static func steps(_ number: Int) throws -> Int {
        guard number > 0 else {
            throw CollatzConjectureError.negativeNumber
        }

        var number = number
        var steps = 0

        while number > 1 {
            if number % 2 == 0 {
                number = number / 2
            } else {
                number = 3 * number + 1
            }
            steps += 1
        }

        return steps
    }
}
