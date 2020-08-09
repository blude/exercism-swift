extension StringProtocol {
    subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start ..< end])
    }
}

enum ProteinTranslationError: Error {
    case invalidCondon
}

struct ProteinTranslation {
    static func translationOfCodon(_ condon: String) throws -> String {
        switch condon {
        case "AUG":
            return "Methionine"
        case "UUU", "UUC":
            return "Phenylalanine"
        case "UUA", "UUG":
            return "Leucine"
        case "UCU", "UCC", "UCA", "UCG":
            return "Serine"
        case "UAU", "UAC":
            return "Tyrosine"
        case "UGU", "UGC":
            return "Cysteine"
        case "UGG":
            return "Tryptophan"
        case "UAA", "UAG", "UGA":
            return "STOP"
        default:
            throw ProteinTranslationError.invalidCondon
        }
    }
    
    static func translationOfRNA(_ rna: String) throws -> [String] {
        var proteinsFound = [String]()
        let condonLength = 3
        for index in stride(from: 0, to: rna.count, by: condonLength) {
            if let protein = try? translationOfCodon(String(rna[index ..< index + condonLength])) {
                if protein == "STOP" {
                    break
                }
                proteinsFound.append(protein)
            } else {
                throw ProteinTranslationError.invalidCondon
            }
        }
        return proteinsFound
    }
}
