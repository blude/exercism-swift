func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter = diameter, diameter >= 0,
          let slices = slices, slices > 1 else {
        return nil
    }
    
    let radius: Double = diameter / 2
    let areaOfSlice: Double = Double.pi * (radius * radius) / Double(slices)
    
    return areaOfSlice
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    let sizeOfSliceA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA))
    let sizeOfSliceB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB))
    
    switch (sizeOfSliceA, sizeOfSliceB) {
    case (.none, .some(_)):
        return "Slice B is bigger"
    case (.some(_), .none):
        return "Slice A is bigger"
    case (.none, .none):
        return "Neither slice is bigger"
    case (.some(let areaA), .some(let areaB)):
        if areaA == areaB {
            return "Neither slice is bigger"
        }
        if areaA > areaB {
            return "Slice A is bigger"
        } else {
            return "Slice B is bigger"
        }
    }
}
