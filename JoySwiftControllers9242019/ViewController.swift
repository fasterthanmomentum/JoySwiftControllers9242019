//
//  ViewController.swift
//  JoySwiftControllers9242019
//
//  Created by JOY BEST on 9/24/19.
//  Copyright © 2019 JOY BEST. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var shareButtonTapped: UIButton!
    
    @IBOutlet weak var safariButtonTapped: UIButton!
    
    @IBOutlet weak var photoButtonTapped: UIButton!
    
    @IBOutlet weak var emailButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
        guard let image = imageView.image else { return }
        
        let activityController =
            UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true,
                completion: nil)
        
        
    }
  
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        
        if let url = URL(string: "http://www.apple.com") {
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true,
                completion: nil)
    }
    }
  
    
    @IBAction func photoButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in print("User selected Camera action")})
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("User selected Photo Library action")})
        
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
    
    let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
        
            let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
            let cancelAction = UIAlertAction(title: "Cancel",
            style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let cameraAction = UIAlertAction(title: "Camera", style:.default, handler: { action in
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true,
                    completion: nil)
                })
                alertController.addAction(cameraAction)
        }
           if
         UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "photo library", style: .default, handler: { action in
                   imagePicker.sourceType = .photoLibrary
                   self.present(imagePicker, animated: true,
                   completion: nil)
               })
               alertController.addAction(photoLibraryAction)
           }
       
           present(alertController, animated: true, completion: nil)
       }
}
        
        
    
    
    
    
    
    
    
    



