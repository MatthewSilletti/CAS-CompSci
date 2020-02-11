//
//  ViewController2.swift
//  DynamicButtons
//
//  Created by Matthew Silletti on 2/10/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var stackView1: UIStackView!
    
    var buttonCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button1.addTarget(self, action: #selector(addNewButton), for: .touchUpInside)
    }
    
    @objc func addNewButton() {
        let buttons = (1...buttonCount).map({(x) -> UIButton in
        let newButton = UIButton()
            newButton.backgroundImage(for: .normal)
            newButton.imageView?.image = UIImage(contentsOfFile: "image.jpg")
            newButton.addTarget(self, action: #selector(addNewButton), for: .touchUpInside)
            return newButton
            
        })
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
