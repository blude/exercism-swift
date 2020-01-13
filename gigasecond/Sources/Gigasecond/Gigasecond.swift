import Foundation

struct Gigasecond {
    let description: String?
    let gigasecond: TimeInterval = pow(10, 9)

    init?(from dateString: String) {
        let formarter = DateFormatter()
        formarter.timeZone = TimeZone.init(identifier: "GMT")
        formarter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = formarter.date(from: dateString) {
            let calculatedDate = date + gigasecond
            self.description = formarter.string(from: calculatedDate)
        } else {
            self.description = nil
        }
    }
}
