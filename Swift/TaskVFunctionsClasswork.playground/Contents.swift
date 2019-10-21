import UIKit

func numberName (givenNum: Int) -> String{
    if 0 <= givenNum && givenNum <= 10{
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        let numString = formatter.string(from: NSNumber(value: givenNum))
        print("The Number Name For \(givenNum) Is \(numString)")
    } else {
        print("Number Given,\(givenNum), Exceeds 10")
    }
    return ""
}

print(numberName(givenNum: 5))







//(ORIGIONAL CODE FROM CLASSWORK)

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




