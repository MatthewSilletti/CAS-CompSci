//
//  ViewController.swift
//  ScrollViewExcersise
//
//  Created by Matthew Silletti on 2/12/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...125 {
            let newLabel = UILabel()
            newLabel.text = "Label \(i)"
            newLabel.textAlignment = .center
            newLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            stackView.addArrangedSubview(newLabel)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 125*30)
        scrollView.contentSize = CGSize(width: 200, height: 125*30)
    }


}

