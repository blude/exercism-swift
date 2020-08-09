extension String {
    func chunks(size: Int) -> [String] {
        return stride(from: 0, to: self.count, by: size).map {
            let start = index(startIndex, offsetBy: $0)
            let end = index(start, offsetBy: size, limitedBy: endIndex) ?? endIndex
            return String(self[start ..< end])
        }
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
        let proteins = try rna.chunks(size: 3).map { condon in
            try translationOfCodon(condon)
        }

        return proteins.prefix { $0 != "STOP" }
    }
}
