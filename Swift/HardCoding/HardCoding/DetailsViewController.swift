//
//  DetailsViewController.swift
//  HardCoding
//
//  Created by Matthew Silletti on 2/3/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    var characterClicked = [
        "name": "Link",
        "description": "A Sword Guy",
        "tier": "High Tier"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailsTextView.text = "\(characterClicked["name"] ?? "Somebody") is \(characterClicked["description"] ?? "Cool Guy") and is \(characterClicked["tier"] ?? "Alpha")."
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
