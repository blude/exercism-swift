struct Diamond {
    static func makeDiamond(letter: String) -> [String] {
        var diamond: [String] = []
                
        let firstLetter = "A".asciiValue
        let lastLetter = "Z".asciiValue
        let myLetter = letter.asciiValue

        let difference = myLetter - firstLetter + 1
        let diamondSize = difference + 1
        
        for _ in stride(from: 1, to: diamondSize, by: 1) {
            diamond.append("+")
        }
        
        for _ in stride(from: diamondSize - 1, to: 1, by: -1) {
            diamond.append("-")
        }
        
        diamond.append("A")
        
        return diamond
    }
}

extension String {
    var asciiValue: Int {
        guard self.count == 1 else { fatalError() }
        return Int(String(describing: self.first?.asciiValue ?? 0)) ?? 0
    }
}
