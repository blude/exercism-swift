import Foundation

func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
  return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: String...) -> Int {
  return layers.count * 2
} 

func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
  var noodles = 0
  var sauce: Double = 0

  for layer in layers {
    switch layer {
      case "noodles":
        noodles += 3
        break
      case "sauce":
        sauce += 0.2
        break
      default:
        break
    }
  }

    return (noodles: noodles, sauce: round(sauce * 10) / 10.0)
}

func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
  amount.sauce *= 33.814
}

func redWine(layers: String...) -> Bool {
  var whiteWine = 0
  var redWine = 0
  
  for layer in layers {
    switch layer {
      case "mozzarella", "ricotta", "béchamel":
        whiteWine += 1
        break
      case "meat", "sauce":
        redWine += 1
        break
      default:
        break
    }
  }

  return redWine >= whiteWine
}
