import Foundation

struct Raindrops {
    var number: Int
    
    init(_ number: Int) {
        self.number = number
    }
    
    var sounds: String {
        get {
            var sound = ""

            let divisibleBy3 = number % 3 == 0
            let divisibleBy5 = number % 5 == 0
            let divisibleBy7 = number % 7 == 0

            if divisibleBy3 {
                sound += "Pling"
            }
            if divisibleBy5 {
                sound += "Plang"
            }
            if divisibleBy7 {
                sound += "Plong"
            }
            
            if !divisibleBy3 && !divisibleBy5 && !divisibleBy7 {
                sound = String(number)
            }
            
            return sound
        }
    }
}
