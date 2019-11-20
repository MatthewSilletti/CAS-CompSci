//
//  ViewController.swift
//  NotesApp
//
//  Created by Matthew Silletti on 11/14/19.
//  Copyright © 2019 Matthew Silletti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note?.text

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.text = textView.text
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
