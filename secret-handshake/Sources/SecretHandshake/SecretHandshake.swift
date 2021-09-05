extension String {
    static func binaryRepresentation<F: FixedWidthInteger>(of value: F) -> String {
        let binaryString = String(value, radix: 2)
        
        if value.leadingZeroBitCount > 0 {
            return String(repeating: "0", count: value.leadingZeroBitCount) + binaryString
        }
        
        return binaryString
    }
}

class SecretHandshake {
    private let code: Int8
    private let moves = [
        "1": "wink",
        "10": "double wink",
        "100": "close your eyes",
        "1000": "jump"
    ]
    
    init(_ code: Int) {
        self.code = Int8(code)
    }
    
    var commands: [String] {
        let codeBinary: String = .binaryRepresentation(of: code)
        
        return []
    }
}
