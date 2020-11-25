//
//  ViewController.swift
//  Demo_Week11
//
//  Created by Shaila Zaman on 11/3/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let picker = UIImagePickerController()
    var context = CIContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        picker.delegate = self
    }

    @IBAction func selectFilter(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("do nothing")
        } else if sender.selectedSegmentIndex == 1 {
            if let filteredImg = self.filterImage(inputImg: imageView.image!, context:context) {
                self.imageView.image = filteredImg
            }
        }
    }
    
    @IBAction func selectFromCam(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing=false
            picker.sourceType = .camera
            picker.cameraCaptureMode = .photo
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func selectFromLib(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.allowsEditing=false
            picker.sourceType = .photoLibrary
            present(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectImage = info[.originalImage] as? UIImage else {
            return print("Error")
        }
        
        imageView.image = selectImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func filterImage(inputImg: UIImage, context:CIContext) -> UIImage? {
        let inputCIImage = CIImage(image: inputImg)
        let filter = CIFilter(name: "CIPhotoEffectNoir", parameters: ["inputImage": inputCIImage!])!
        let output_img = filter.outputImage
        let cgImage=context.createCGImage(output_img!, from: output_img!.extent)
        
        return UIImage(cgImage: cgImage!, scale: inputImg.scale, orientation: inputImg.imageOrientation)
    }
    
    
}

