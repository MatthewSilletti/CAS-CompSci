import UIKit

let xrds: [String: Any] = [
    "name": ["Crossroads School"],
    "foundingYear": 1971,
    "campuses": [
        "Norton",
        "21st Street"
    ]
]

let name0 = xrds["name"]
//let name1 = xrds["name"] as! String
//Above wont run because its saying it will return a String when there is no string there
let name2 = xrds["name"] as? String


if name2 != nil {
    let unwrappedOptional = name2!
    print("Hello \(unwrappedOptional)")
    //safely unwrapped the optional value using an if not nil
} else {
    print("No woek")
}

let moreWaysToUnwrap = name2 ?? "Stinky"
print ("Hello again, \(moreWaysToUnwrap)")

if let unwrapped = name2 {
    print("Hi \(moreWaysToUnwrap)")
} else {
    print("Yeep")
}

let bruteForce = name2!
print("Yee \(bruteForce)")


//print(" \(name0),       \(name1),       \(name2)")
