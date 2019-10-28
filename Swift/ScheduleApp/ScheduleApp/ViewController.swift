//
//  ViewController.swift
//  ScheduleApp
//
//  Created by Matthew Silletti on 10/23/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var curDayType = "A"
    var curWeekday = "Monday"
    var curSchedule = "Regular"
    var afternoonClass = ""
    
    let dayTypes = ["A","B","C"]
    let weekDays = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    let scheduleType = ["Regular","Double Block","Advisory"]
    
    let mySchedule:[String:String] = [
        "A":"Chemistry",
        "B":"CAS Comp Sci",
        "C":"Trig Pre-Calc",
        "D":"US History",
        "E":"Free Period",
        "F":"English Honors"
    ]
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var findSchedule: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dayTypes[row]
        }
        else if component == 1 {
            return weekDays [row]
        } else {
            return scheduleType[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 3
       }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dayTypes.count
    }
        else if component == 1 {
            return weekDays.count
        } else {
            return scheduleType.count
        }
    }
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayRowType = pickerView.selectedRow(inComponent: 0)
        let ACBDay = dayTypes[dayRowType]
        
        let morningRotation:[String:[String]] = [
            "A":["A","B","D","E"],
            "B":["B","C","E","F"],
            "C":["C","A","F","D"]
        ]
        
       
            let afternoonRowTypes = pickerView.selectedRow(inComponent: 1)
            let MTWTFDay = weekDays[afternoonRowTypes]
            
            if MTWTFDay == "Monday" {
                afternoonClass = "Life Skills"
            }
            else if MTWTFDay == "Tuesday" {
                afternoonClass = "Film 3"
            }
            else if MTWTFDay == "Friday" {
                afternoonClass = "Film 3"
            } else {
                afternoonClass = "Free Period"
            }
        
        
        
        let myRegSchedule = getMorningScheduleForDay(periods: morningRotation[ACBDay]!, mySchedule:mySchedule)
        Label.text = "\(myRegSchedule) + \(afternoonClass)"
        
    }
   
    func getMorningScheduleForDay(periods:[String], mySchedule:[String: String]) -> String {
            var output = ""
            for period in periods{
                output += "\(period) - "
                output += mySchedule[period] ?? "Free Period"
                output += "\n"
            }
        return output
        }
        
    
}
    
    
    
    
    
    

    

    





