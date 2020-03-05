//
//  ViewController.swift
//  FilterChooserApp
//
//  Created by Matthew Silletti on 3/4/20.
//  Copyright © 2020 Matthew Silletti. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!

    var ChosenFilter = ""
    
    let Filter1 = "CIBoxBlur"
    
    let Filter2 = "CIColorCube"
    
    let Filter3 = "CIVignette"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //imageView.image = image
        
        let inputImage = image
        let context = CIContext(options: nil)
        
        if let filter = CIFilter(name: "\(ChosenFilter)") {
            let beginImage = CIImage(image: inputImage)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            
            if let output = filter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    imageView.image = processedImage
                }
            }
        }
        
    }
    
    

    @IBAction func launchPhotoPicker(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func didPressButton1(_ sender: Any) {
        ChosenFilter = Filter1
    }
    
    @IBAction func didPressButton2(_ sender: Any) {
        ChosenFilter = Filter2
    }
    @IBAction func didPressButton3(_ sender: Any) {
        ChosenFilter = Filter3
    }
}

