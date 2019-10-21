import UIKit


//Task 1
func square(number: Float) -> Float{
    let doubledNumber = number * number
    return doubledNumber
}
    print(square(number: 0.467))

//Task 2
func five() -> Int{
    return 5
}

print(five())

//Task 3
func fullName(firstname: String, lastname: String) -> String{
    
    return "\(firstname) \(lastname)"//the nice way to do it
    //let bigName = firstname + lastname
    //return bigName
}

print(fullName(firstname: "Matthew", lastname: "Silletti"))


//Task 4
func shout (hello: String){
    print("\(hello)! ")
}

shout(hello: "sup buddy")

//Task 5 NOTWORKING
//func numberName (givenNum: Int, realNum: Int) -> Int{
    //if givenNum == (realNum){
        //let statement = print("The Number Name For \(realNum) Is Two")
        //return statement()
    //} else{
        //return 7
    //}
    //return numberName(givenNum: 2, realNum: 2)
//}

//print(numberName(givenNum: 2, realNum: 2))
//having trouble turning into a nil bc its a let constant

