import UIKit

func classifyProduct(int1: Float, int2: Float) -> String {
    var newInt = int1 * int2
    if newInt < 0 {
        return ("Negative")
    } else if newInt == 0 {
        return ("Zero")
    } else if newInt < 30 {
        return ("Small")
    } else if newInt > 30 {
        return ("Big")
    } else if newInt == 30 {
        return ("Exactly 30")
    }
    else {
        return ("Stinky Poopy")
    }
}

print(classifyProduct(int1: 15, int2: 2))

// if 0 < newInt && newInt < 30{
//return blahblahblah
//Compound conditionals allows for a double check
