import Foundation

let x = 1

switch x {
    case 0:
        print("x is zero")
    case 1:
        print("x is one")
    case 2:
        print("x is two")
    default:
        print("x is something")
    
}

 
enum SchoolDay {
    case aDay
    case bDay
    case cDay
}

var today: SchoolDay = .bDay

switch today {
    case .aDay:
        print("Comp Sci second period")
    case .bDay:
        print("Comp Sci first period")
    case .cDay:
        print("Comp Sci does not meet")
    default:
        print("This doesnt exist")
    
}
