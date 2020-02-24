enum TranscriptionError: Error {
    case invalidNucleotide(message: String)
}

class Nucleotide {
    let strand: String

    let transcriptionRules: [Character: Character] = [
        "G": "C",
        "C": "G",
        "T": "A",
        "A": "U"
    ]
    
    init(_ strand: String) {
        self.strand = strand
    }
    
    func complementOfDNA() throws -> String {
        var complement = ""
        for letter in strand {
            if let value = transcriptionRules[letter] {
                complement += String(value)
            } else {
                throw TranscriptionError.invalidNucleotide(message: "\(letter) is not a valid Nucleotide")
            }
        }
        return complement
    }
}
