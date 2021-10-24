func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let result = monthlyBudget * 12 * 5
    let frugalAmount: Double = 10 * 12 * 5
    if result > price {
        return "Yes! I'm getting a \(vehicle)"
    } else if result > price - frugalAmount {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else {
        return "Darn! No \(vehicle) for me"
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
    let licenseType = [
        2: "a motorcycle",
        6: "an automobile",
        18: "a commercial trucking"
    ]
    
    if (wheels == 0) {
        return "We do not issue licenses for those types of vehicles"
    }

    return "You will need \(licenseType[wheels, default: ""]) license for your vehicle"
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    let baseCost = Double(msrp > 25_000 ? msrp : 25_000)
    var price = baseCost
    if (yearsOld >= 10) {
        return 25
    } else {
        for _ in 0..<yearsOld {
            price -= baseCost * 0.1
        }
        return Int(price / 100.0)
    }
}


