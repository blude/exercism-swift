import Foundation

struct PhoneNumber: CustomStringConvertible {
    let number: String
    
    init(_ phoneNumber: String) {
        var cleanedNumber = phoneNumber
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: " ", with: "")
        
        if cleanedNumber.first == "1" {
            cleanedNumber = String(cleanedNumber.dropFirst())
        }
        
        if cleanedNumber.count != 10 {
            cleanedNumber = String(repeating: "0", count: 10)
        }

        self.number = cleanedNumber
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

