enum Plant: Character {
    case radishes = "R"
    case clover = "C"
    case violets = "V"
    case grass = "G"
}

private let defaultChildren = [
    "Alice", "Bob", "Charlie", "David",
    "Eve", "Fred", "Ginny", "Harriet",
    "Ileana", "Joseph", "Kincaid", "Larry"
]

struct Garden {
    private let diagram: [Character]
    private let children: [String]
    private let offset: Int
    
    init(_ diagram: String, children: [String] = defaultChildren) {
        self.diagram = diagram.map { $0 }
        self.offset = diagram.count / 2 + 1
        self.children = children.sorted()
    }
    
    func plantsForChild(_ name: String) -> [Plant?] {
        let childPosition = children.firstIndex(of: name)!
        
        let plants = [
            childPosition * 2,
            childPosition * 2 + 1,
            childPosition * 2 + offset,
            childPosition * 2 + offset + 1
        ].map { position in
            Plant(rawValue: diagram[position])
        }
        
        return plants
    }
}
