//
//  ViewController.swift
//  HardCoding
//
//  Created by Matthew Silletti on 2/3/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        let button = sender as! UIButton
        if button.titleLabel!.text! == "Link" {
            dvc.characterClicked = [
                "name": "Link",
                "description": "a sword guy",
                "tier": "Mid-Tier"
            ]
        } else if button.titleLabel!.text! == "Pikachu" {
            dvc.characterClicked = [
                "name": "Pikachu",
                "description": "a electric rat pokemon",
                "tier": "High-Tier"
            ]
        } else if button.titleLabel!.text! == "Captain Falcon" {
            dvc.characterClicked = [
                "name": "Captain Falcon",
                "description": "a super awesome punching guy",
                "tier": "SS Tier"
            ]
        }
    }


}

