struct GradeSchool {
    var roster: [Int: [String]] = [:]
    lazy var sortedRoster: [Int:[String]] = {
        var sorted: [Int: [String]] = [:]
        for key in roster.keys {
            sorted.updateValue(roster[key]?.sorted() ?? [String](), forKey: key)
        }
        return sorted
    }()

    func studentsInGrade(_ grade: Int) -> [String] {
        guard let students = roster[grade] else { return [String]() }
        return students
    }
    
    mutating func addStudent(_ name: String, grade: Int) {
        if roster[grade] == nil {
            roster[grade] = [name]
        } else {
            roster[grade]?.append(name)
        }
    }
}
