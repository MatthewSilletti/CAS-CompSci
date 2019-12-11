import UIKit

let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")!

let jsonFileData = try! Data(contentsOf: fileUrl)


//func main() {
//    let json = try? JSONSerialization.jsonObject(with: fileContents, options: [])
//
//    let dictionary: [String: Any] = json as! [String: Any]
//    // first string:any is not necesarry, only there to show what second thing is doing
//
//    let name: String = dictionary["name"] as! String
//    let hobbies: [String] = dictionary["hobbies"] as! [String]
//    let age: Int = dictionary["age"] as! Int
//
//    print("Hello, my name is \(name). I am \(age) years old. My hobbies include: \(hobbies.joined(separator: ", ")).")
//}
//
//
//main()

func main() {
    // TODO: Parse the JSON data and display it in the app.
    let json = try? JSONSerialization.jsonObject(with: jsonFileData, options: [])
    
    let dictionary: [String: Any] = json as! [String: Any]
    
    let name: String = dictionary["name"] as! String
    let hobbies: [String] = dictionary["hobbies"] as! [String]
    let age: Int = dictionary["age"] as! Int
    
    print("Hello, my name is \(name). I am \(age) years old. My hobbies include: \(hobbies.joined(separator: ", ")).")
}

main()
