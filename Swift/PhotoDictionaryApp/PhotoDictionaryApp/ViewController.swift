//
//  ViewController.swift
//  PhotoDictionaryApp
//
//  Created by Matthew Silletti on 2/28/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var totalButtons = 0
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var takerController: UIImagePickerController!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_) in return})
            default:
                return
        }
    }
    @IBAction func takePhoto(_ sender: Any) {
        takeIt()
        totalButtons += 1
    }
    
    
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        //imageView.image = info[.originalImage] as? UIImage
        let newImageView = UIImageView(image: info[.originalImage] as! UIImage)
        stackView.addArrangedSubview(newImageView)
        //stackView.newLabel
        
    }
}

