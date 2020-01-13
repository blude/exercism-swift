struct ScaleGenerator {
    var tonic: String
    var scaleName: String
    var pattern: String

    var name: String {
        return "\(tonic.uppercased()) \(scaleName)"
    }
    
    func pitches() -> [String] {
        return [""]
    }
    
    init(tonic: String, scaleName: String, pattern: String = "") {
        self.tonic = tonic
        self.scaleName = scaleName
        self.pattern = pattern
    }
}
