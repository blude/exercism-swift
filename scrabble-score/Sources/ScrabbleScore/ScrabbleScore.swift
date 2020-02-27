class Scrabble {
    var score: Int

    init(_ word: String?) {
        self.score = Scrabble.score(word ?? "")
    }
    
    static func score(_ word: String) -> Int {
        var total = 0
        for letter in word.uppercased() {
            switch letter {
            case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
                total += 1
            case "D", "G":
                total += 2
            case "B", "C", "M", "P":
                total += 3
            case "F", "H", "V", "W", "Y":
                total += 4
            case "K":
                total += 5
            case "J", "X":
                total += 8
            case "Q", "Z":
                total += 10
            default: break
            }
        }
        return total
    }

}
