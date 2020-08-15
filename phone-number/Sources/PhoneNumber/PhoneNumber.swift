import Foundation

struct PhoneNumber: CustomStringConvertible {
    let number: String
    
    init(_ phoneNumber: String) {
        var digitsOnly = phoneNumber.filter { $0.isNumber }
        
        if digitsOnly.first == "1" {
            digitsOnly = String(digitsOnly.dropFirst())
        }
        
        if digitsOnly.count != 10 {
            digitsOnly = String(repeating: "0", count: 10)
        }

        self.number = digitsOnly
    }
    
    var areaCode: String {
        return String(number.prefix(3))
    }
    
    var description: String {
        var prettyNumber = number

        prettyNumber.insert("(", at: prettyNumber.startIndex)
        prettyNumber.insert(")", at: prettyNumber.index(prettyNumber.startIndex, offsetBy: 4))
        prettyNumber.insert(" ", at: prettyNumber.index(prettyNumber.startIndex, offsetBy: 5))
        prettyNumber.insert("-", at: prettyNumber.index(prettyNumber.startIndex, offsetBy: 9))

        return prettyNumber
    }
}

