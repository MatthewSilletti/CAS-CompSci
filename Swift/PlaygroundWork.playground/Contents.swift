import UIKit

protocol Athlete{
    func practice()
    func playGame()->Bool
}

class Student: Athlete {
    func practice() {
        print("Grind Time!")
    }
    
    func playGame() -> Bool {
        //print("Game Time Sir!")
        return true
    }
    
    var name:String = ""
    var grade:Int = 0
    var studentID:Int = 0
}

class OlympicSkater:Athlete{
    func practice() {
        print("Grinding On Those Rails With My Board!")
    }
    
    func playGame() -> Bool {
        return true
    }
    
    
}

