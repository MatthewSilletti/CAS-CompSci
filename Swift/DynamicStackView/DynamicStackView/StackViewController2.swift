//
//  StackViewController2.swift
//  DynamicStackView
//
//  Created by Matthew Silletti on 2/6/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class StackViewController2: UIViewController {

    var buttonCount = 5
    @IBOutlet weak var stackView2: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let buttons = (1...buttonCount).map({(x) -> UIButton in
        let newButton = UIButton()
            //newButton.imageView!.image = UIImage(contentsOfFile: "image.jpg")
            newButton.setImage(UIImage(contentsOfFile: "image.jpg"), for: .normal)
            newButton.setTitle("Hello", for: .normal)
            newButton.setTitleColor(UIColor.black, for: .normal)
            return newButton
        })
        
        for (x, button) in buttons.enumerated() {
            stackView2.addArrangedSubview(button)
            let constrait = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 0)
            if button != buttons[0] {
                stackView2.addConstraint(constrait)
            }
        }
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
