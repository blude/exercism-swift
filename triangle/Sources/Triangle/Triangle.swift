import Foundation

struct Triangle {
    let a: Float
    let b: Float
    let c: Float
    
    enum TriangleType: String {
        case equilateral = "Equilateral"
        case isosceles = "Isosceles"
        case scalene = "Scalene"
        case degenerate = "Degenerate"
        case errorKind = "ErrorKind"
    }
    
    init(_ a: Float, _ b: Float, _ c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    var kind: String {
        guard a > 0 && b > 0 && c > 0 else {
            return TriangleType.errorKind.rawValue
        }
        if a + b <= c || a + c <= b || b + c <= a {
            return TriangleType.errorKind.rawValue
        }
        if a + b == c || a + c == b || b + c == a {
            return TriangleType.degenerate.rawValue
        }
        if a == b && b == c {
            return TriangleType.equilateral.rawValue
        } else if a == b || a == c || b == c {
            return TriangleType.isosceles.rawValue
        } else {
            return TriangleType.scalene.rawValue
        }
    }
}
