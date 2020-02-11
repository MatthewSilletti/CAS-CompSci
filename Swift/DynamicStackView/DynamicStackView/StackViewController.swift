//
//  StackViewController.swift
//  DynamicStackView
//
//  Created by Matthew Silletti on 2/6/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var labelCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({(x) -> UILabel in
            let newLabel = UILabel()
            newLabel.text = "Kobie \(x)"
            return newLabel
        })
        for (x, label) in labels.enumerated() {
            stackView.addArrangedSubview(label)
            label.textAlignment = NSTextAlignment.center
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 0)
            if label != labels[0] {
                stackView.addConstraint(constraint)
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
