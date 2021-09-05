
struct Queens {
    let white, black: Coords
    
    typealias Coords = [Int]
    
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
    init(white: Coords = [0, 3], black: Coords = [7, 3]) throws {
        guard white.count == 2, black.count == 2 else {
            throw InitError.incorrectNumberOfCoordinates
        }
        
        guard white != black else {
            throw InitError.sameSpace
        }
        
        guard (white + black).allSatisfy({ 0..<8 ~= $0 }) else {
            throw InitError.invalidCoordinates
        }
        
        self.white = white
        self.black = black
    }
    
    var canAttack: Bool {
        let sameRow = white[0] - black[0] == 0
        let sameColumn = white[1] - black[1] == 0
        let sameDiagonal = abs(white[0] - black[0]) == abs(white[1] - black[1])
        
        return sameDiagonal || sameRow || sameColumn
    }
}

extension Queens: CustomStringConvertible {
    var description: String {
        return (0..<8).map { x in
            (0..<8).map { y in
                switch [x, y] {
                case white:
                    return "W"
                case black:
                    return "B"
                default:
                    return "_"
                }
            }.joined(separator: " ")
        }.joined(separator: "\n")
    }
}
