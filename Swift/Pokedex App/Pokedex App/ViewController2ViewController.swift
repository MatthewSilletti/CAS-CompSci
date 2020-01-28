//
//  ViewController2ViewController.swift
//  Pokedex App
//
//  Created by Matthew Silletti on 1/28/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController2ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var weaknessLabel: UILabel!
    
    var PName:String = ""
       var PType:String = ""
       var PWeakness:String = ""
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = PName
        typeLabel.text = PType
        weaknessLabel.text = PWeakness
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
