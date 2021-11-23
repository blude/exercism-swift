import Foundation

let hoursInDay = 8
let billabeDays = 22

func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hoursInDay * hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let rateWithDiscount = dailyRateFrom(hourlyRate: hourlyRate) * (1 - discount / 100)
  return round(rateWithDiscount * Double(billabeDays))
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let rateWithDiscount = dailyRateFrom(hourlyRate: hourlyRate) * (1 - discount / 100)
  return floor(budget / rateWithDiscount)
}
