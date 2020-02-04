class Robot {
    var name: String = ""
    
    private func robotName() -> String {
        let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let digits = "0123456789"
        let randomChars = (0..<2).map {_ in chars.randomElement()! }
        let randomDigits = (0..<3).map {_ in digits.randomElement()! }
        return String(randomChars) + String(randomDigits)
    }
    
    init() {
        let name = robotName()
        self.name = name
    }
    
    func resetName() {
        let name = robotName()
        self.name = name
    }
}
