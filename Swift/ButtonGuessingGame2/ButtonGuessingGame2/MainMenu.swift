//
//  MainMenu.swift
//  ButtonGuessingGame2
//
//  Created by Matthew Silletti on 2/18/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {
    
    var ButtonNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Level1Button(_ sender: Any) {
        return ButtonNum = 10
    }
    
    @IBAction func Level2Button(_ sender: Any) {
        return ButtonNum = 20
    }
    
    @IBAction func Level3Button(_ sender: Any) {
        return ButtonNum = 30
    }
    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? GameScreen
        vc?.ButtonNum1 = ButtonNum
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
