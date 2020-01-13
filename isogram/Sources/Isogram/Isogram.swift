//Solution goes in Sources

struct Isogram {
    
    static func isIsogram(_ text: String) -> Bool {
        var lettersFound = ""
        
        for character in text.lowercased() {
            if character == "-" || character == " " {
                continue
            }
            if lettersFound.contains(character) {
                return false
            }
            lettersFound.append(character)
        }

        return true
    }
}
