//
//  GameScreen.swift
//  ButtonGuessingGame2
//
//  Created by Matthew Silletti on 2/18/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit

class GameScreen: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    var ButtonNum1: Int?
    
    //PLACEHOLDER
    //let realNum = Int.random(in: 0...ButtonNum1!)
    let realNum = Int.random(in: 0...10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...ButtonNum1! {
            let newButton = UIButton()
            newButton.setTitle("Button No.\(i)", for: .normal)
            newButton.setTitleColor(.black, for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
            newButton.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.6, alpha: 0.5)
            stackView.addArrangedSubview(newButton)
            newButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: ButtonNum1!*50)
        scrollView.contentSize = CGSize(width: 200, height: ButtonNum1!*50)
        
      //FUNC THAT DOEST WORK!!!
//        if newButton.num = realNum {
//            newButton.addTarget(self, action: #selector(CorrectGuess), for: .touchUpInside)
//        } else {
//            newButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
//        }
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Whoopies!", message: "You Guessed Wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Quit", style: .destructive, handler: {(_) in return}))

        
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func CorrectGuess() {
        let alert = UIAlertController(title: "Congratulations!", message: "You Guessed Correctly", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Quit", style: .destructive, handler: {(_) in return}))
        
        self.present(alert, animated: true, completion: {})
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
