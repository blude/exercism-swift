import Foundation

class IsbnVerifier {
    static func isValid(_ isbn: String) -> Bool {
        let isbnDigits = isbn.replacingOccurrences(of: "-", with: "")
        
        guard isbnDigits.count == 10 else { return false }
        
        var sum = 0

        for (index, digit) in isbnDigits.enumerated() {
            if digit == "X" {
                if index != 9 {
                    return false
                }
                sum += 10
            } else if digit.isLetter {
                return false
            } else {
                sum += Int(String(digit))! * (10 - index)
            }
        }
        
        return sum % 11 == 0
    }
}
