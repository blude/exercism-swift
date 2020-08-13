import Foundation

struct PhoneNumber {
    let startingNumber: String
    
    init(_ phoneNumber: String) {
        self.startingNumber = phoneNumber
    }
    
    var number: String {
        var cleanedNumber = startingNumber
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
            return "0000000000"
        }
        
        return cleanedNumber
    }
    
    var areaCode: String {
        return String(number.prefix(3))
    }
}

extension PhoneNumber: CustomStringConvertible {
    var description: String {
        var prettyNumber = number

        prettyNumber.insert("(", at: prettyNumber.startIndex)
        prettyNumber.insert(")", at: prettyNumber.index(prettyNumber.startIndex, offsetBy: 4))
        prettyNumber.insert(" ", at: prettyNumber.index(prettyNumber.startIndex, offsetBy: 5))
        prettyNumber.insert("-", at: prettyNumber.index(prettyNumber.startIndex, offsetBy: 9))

        return prettyNumber
    }
}
