import UIKit

let foo = {
    (x: String, y: String, z: Int) in
    return ("\(x) " + "\(z) " + "\(y)")
}

print(foo("Beep","Bap",6))
