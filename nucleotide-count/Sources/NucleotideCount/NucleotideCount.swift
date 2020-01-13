import Foundation

struct DNA {
    private var strand: String?
    private let validNucleotides: Set<Character> = ["T", "A", "C", "G"]

    init?(strand: String) {
        for nucleotide in strand {
            if !validNucleotides.contains(nucleotide) {
                self.strand = nil
                return nil
            }
        }
        self.strand = strand
    }
    
    func count(_ base: Character) -> Int {
        var count = 0
        if let strand = strand {
            for nucleotide in strand {
                if base == nucleotide {
                    count += 1
                }
            }
        }
        return count
    }
    
    func counts() -> [Character:Int] {
        var dnaSummary = [Character:Int]()
        for nucleotide in validNucleotides {
            dnaSummary[nucleotide] = count(nucleotide)
        }
        return dnaSummary
    }

}
