class Hamming {
    static func compute(_ strandA: String, against strandB: String) -> Int? {
        guard strandA.count == strandB.count else { return nil }

        var hammingDistance = 0

        for (a, b) in zip(strandA, strandB) {
            if a != b {
                hammingDistance += 1
            }
        }

        return hammingDistance
    }
}
