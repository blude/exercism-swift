class GradeSchool {
    var roster: [Int: [String]] = [:]

    var sortedRoster: [Int: [String]] {
        roster.mapValues { $0.sorted() }
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        roster[grade, default: []]
    }
    
    func addStudent(_ name: String, grade: Int) {
        roster[grade, default: []].append(name)
    }
}
