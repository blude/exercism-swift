extension String {
    func capitalizing() -> String {
        prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

class ScaleGenerator {
    let scaleName: String
    let tonic: String
    let pattern: String
    
    let chromaticSharps = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    let chromaticFlats =  ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
    
    let noAccidentals = ["A minor", "C major"]
    let useSharps = [
        "G major", "D major", "A major", "E major", "B major", "F# major",
        "e minor", "b minor", "f# minor", "c# minor", "g# minor", "d# minor"
    ]
    let useFlats = [
        "F major", "Bb major", "Eb major", "Ab major", "Db major", "Gb major",
        "d minor", "g minor", "c minor", "f minor", "bb minor", "eb minor"
    ]
    
    var steps: [Character: Int] = [
        "m": 1,
        "M": 2,
        "A": 3
    ]
    
    var name: String {
        "\(tonic.uppercased()) \(scaleName)"
    }
    
    init(tonic: String, scaleName: String, pattern: String = "") {
        self.scaleName = scaleName
        self.tonic = tonic
        self.pattern = pattern
    }
    
    func pitches() -> [String] {
        var pitches: [String] = []
        guard let startIndex = chromaticSharps.index(of: tonic.capitalizing()) else { return pitches }

        switch scaleName {
        case "chromatic":
            var noteIndex = startIndex
            for _ in 0 ..< 12 {
                pitches.append(chromaticSharps[noteIndex])
                if noteIndex >= chromaticSharps.count - 1 {
                    noteIndex = 0
                } else {
                    noteIndex += 1
                }
            }
        case "major":
            var noteIndex = startIndex
            for letter in pattern {
                pitches.append(chromaticSharps[noteIndex])
                if noteIndex >= chromaticSharps.count - steps[letter]! {
                    noteIndex = 0
                } else {
                    noteIndex += steps[letter]!
                }
            }
        case "minor":
            var noteIndex = startIndex
            for letter in pattern {
                pitches.append(chromaticFlats[noteIndex])
                if noteIndex >= chromaticFlats.count - steps[letter]! {
                    noteIndex = 0
                } else {
                    noteIndex += steps[letter]!
                }
            }
        default:
            var noteIndex = startIndex
            for letter in pattern {
                pitches.append(chromaticSharps[noteIndex])
                if noteIndex >= chromaticSharps.count - steps[letter]! {
                    noteIndex = 0
                } else {
                    noteIndex += steps[letter]!
                }
            }
        }
        return pitches
    }
}
