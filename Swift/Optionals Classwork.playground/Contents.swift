// Made by matthew and elena

// This is a function that returns a String? (or Optional<String>). You'll use it below.
func getFirstVowel(in name: String) -> String? {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "y"]
    for char in name {
        if vowels.contains(char) {
            return String(char)
        }
    }
    return nil
}

// TODO: Change yourName to your name.
let yourName = "Matthew Silletti"

let firstVowel = getFirstVowel(in: yourName)

// TODO: Assign the underlying value of firstVowel to unwrappedVowelOne, unwrappedVowelTwo, and unwrappedVowelThree. Use a different method of unwrapping firstVowel each time.
// v-- Insert code below here --v
var unwrappedVowelOne: String? = firstVowel

var unwrappedVowelTwo: String



if firstVowel != nil {
    print("The first vowel in '\(yourName)' is '\(unwrappedVowelOne!)'.")
}

if let unwrapped = getFirstVowel(in: yourName) {
    unwrappedVowelTwo = unwrapped
    print("The First vowel in '\(yourName)' is '\(unwrapped)")

} else {
    unwrappedVowelTwo = ":("
}

let unwrappedVowelThree: String = (getFirstVowel(in: yourName) ?? "No Vowel :(" )

print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)'.")



// ^-- Insert code above here --^



