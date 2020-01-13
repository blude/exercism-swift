//Solution goes in Sources
import Foundation

enum Reaction: String {
    case normal = "Whatever."
    case question = "Sure."
    case shout = "Whoa, chill out!"
    case silence = "Fine. Be that way!"
}

class Bob {
    static func hey(_ input: String) -> String {
        if input.trimmingCharacters(in: .whitespaces) == "" {
            return respond(with: .silence)
        }
        
        if input.trimmingCharacters(in: .decimalDigits).trimmingCharacters(in: .punctuationCharacters).trimmingCharacters(in: .whitespaces) == "" {
            if input.last == "?" {
                return respond(with: .question)
            }
            return respond(with: .normal)
        }
        
        if input.uppercased() == input {
            if input.last != "." {
                return respond(with: .shout)
            }
        }

        if input.last == "?" {
            return respond(with: .question)
        }
        
        return respond(with: .normal)
    }
    
    private static func respond(with reaction: Reaction) -> String {
        return reaction.rawValue
    }
}
