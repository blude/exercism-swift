import Foundation

class Clock: Equatable {
    var time: Date
    var components = DateComponents()

    init(hours: Int = 0, minutes: Int = 0) {
        components.hour = hours
        components.minute = minutes
        
        guard let timeSet = Calendar.current.date(from: components) else { fatalError() }
        time = timeSet
    }
    
    func add(minutes: Int) -> Clock {
        components.hour = 0
        components.minute = minutes
        
        guard let timeSet = Calendar.current.date(byAdding: components, to: time) else { fatalError() }
        time = timeSet
        return self
    }
    
    func subtract(minutes: Int) -> Clock {
        components.hour = 0
        components.minute = minutes * -1

        guard let timeSet = Calendar.current.date(byAdding: components, to: time) else { fatalError() }
        time = timeSet
        return self
    }

    static func == (lhs: Clock, rhs: Clock) -> Bool {
        lhs.description == rhs.description
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: time)
    }
}
