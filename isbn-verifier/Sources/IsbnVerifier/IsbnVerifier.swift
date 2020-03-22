import Foundation

class IsbnVerifier {
    static func isValid(_ isbn: String) -> Bool {
        let isbnDigits = isbn.replacingOccurrences(of: "-", with: "")
        
        guard isbnDigits.count == 10 else { return false }
        
        var digits = [Int]()
        var sum = 0

        for (index, digit) in isbnDigits.enumerated() {
            if digit.isLetter && digit != "X" {
                return false
            } else if digit == "X" && index != 9 {
                return false
            } else if digit == "X" {
                digits.append(10)
            } else {
                digits.append(Int(String(digit))!)
            }
        }

        sum += digits[0] * 10
        sum += digits[1] * 9
        sum += digits[2] * 8
        sum += digits[3] * 7
        sum += digits[4] * 6
        sum += digits[5] * 5
        sum += digits[6] * 4
        sum += digits[7] * 3
        sum += digits[8] * 2
        sum += digits[9] * 1

        guard sum % 11 == 0 else { return false }
        
        return true
    }
}
