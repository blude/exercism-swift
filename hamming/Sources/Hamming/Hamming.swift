class Hamming {
    static func compute(_ strandA: String, against strandB: String) -> Int? {
        guard strandA.count == strandB.count else {
            return nil
        }

        var hammingDistance = 0
        let strandB = Array(strandB)

        for (index, letter) in strandA.enumerated() {
            if letter != strandB[index] {
                hammingDistance += 1
            }
        }

        return hammingDistance
    }
}
