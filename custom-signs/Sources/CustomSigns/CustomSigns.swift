let birthday = "Birthday"
let valentine = "Valentine's Day"
let anniversary = "Anniversary"
let space: Character = " "
let exclamation: Character = "!"

func buildSign(for occasion: String, name: String) -> String {
    return ["Happy", occasion, name].joined(separator: String(space)) + String(exclamation)
}

func graduationFor(name: String, year: Int) -> String {
    let line1 = ["Congratulations", name].joined(separator: String(space)) + String(exclamation) + "\n"
    let line2 = ["Class", "of", String(year)].joined(separator: String(space))
    return line1 + line2
}

func costOf(sign: String) -> Int {
    let basePrice = 20
    let pricePerLetter = 2
    return sign.count * pricePerLetter + basePrice
}
