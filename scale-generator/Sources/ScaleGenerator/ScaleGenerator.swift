import Foundation

class ScaleGenerator {
    let name: String
    private let tonic: String
    private let pattern: String
    
    private let usesSharps: Bool
    private let chromaticSharps = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    private let chromaticFlats =  ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
    
    private let steps: [Character: Int] = [
        "m": 1,
        "M": 2,
        "A": 3
    ]
    
    init(tonic: String, scaleName: String, pattern: String = "mmmmmmmmmmmm") {
        self.tonic = tonic.capitalized
        self.name = "\(self.tonic) \(scaleName.lowercased())"
        self.pattern = pattern
        
        switch (tonic, scaleName) {
        case ("F", _), ("Bb", _), ("Eb", _), ("Ab", _),
             ("Db", _), ("Gb", "major"), ("d", _), ("g", _),
             ("c", _), ("f", _), ("bb", _), ("eb", "minor"):
            usesSharps = false
        default:
            usesSharps = true
        }
    }
    
    func pitches() -> [String] {
        let scale = usesSharps ? chromaticSharps : chromaticFlats

        guard var index = scale.firstIndex(of: tonic) else {
            fatalError("Invalid index")
        }

        var pitches = [tonic]

        for step in pattern.dropLast() {
            index = (index + steps[step]!) % 12
            pitches.append(scale[index])
        }
        return pitches
    }
}
