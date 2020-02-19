//
//  ViewController1.swift
//  ButtonGuessingGame
//
//  Created by Matthew Silletti on 2/12/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    var buttonNumberF: Int?
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 1...125 {
            let newButton = UIButton()
            newButton.setTitle("Button No.\(i)", for: .normal)
            newButton.setTitleColor(.black, for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            stackView.addArrangedSubview(newButton)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 125*30)
        scrollView.contentSize = CGSize(width: 200, height: 125*30)
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
