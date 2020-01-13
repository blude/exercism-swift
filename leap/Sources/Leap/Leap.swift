//Solution goes in Sources

class Year {
    let isLeapYear: Bool
    
    init(calendarYear: Int) {
        if calendarYear % 100 == 0 && calendarYear % 400 == 0 {
            isLeapYear = true
        } else if calendarYear % 4 == 0 && calendarYear % 100 != 0 {
            isLeapYear = true
        } else {
            isLeapYear = false
        }
    }

}
