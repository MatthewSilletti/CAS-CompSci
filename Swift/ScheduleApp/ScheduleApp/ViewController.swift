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
    
    let dayTypes = ["A","B","C"]
    let weekDays = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    let scheduleType = ["Regular","Double Block","Advisory"]
    
    let mySchedule:[String:String] = [
        "A":"Chemistry",
        "B":"CAS Comp Sci",
        "C":"Trig Pre-Calc",
        "D":"US History",
        "E":"Free Period",
        "F":"English Honors",
        "M 5/6":"Life Skills",
        "T/F 5/6":"Film 3",
        "W/TH":"Free Period",
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
        
        let normalRotation:[String:[String]] = [
            "A":["A","B","D","E","G","H"],
            "B":["B","C","E","F","H","I"],
            "C":["C","A","F","D","I","G"]
        ]
        
        let myRegSchedule = getScheduleForDay(periods: normalRotation[ACBDay]!, mySchedule:mySchedule)
        Label.text = myRegSchedule
        
    }
   
    func getScheduleForDay(periods:[String], mySchedule:[String: String]) -> String {
            var output = ""
            for period in periods{
                output += "\(period) - "
                output += mySchedule[period] ?? "Free Period"
                output += "\n"
            }
        return output
        }
        
    
}
    
    
    
    
    
    

    

    





