//
//  ViewController.swift
//  Demo-Week12
//
//  Created by Shaila Zaman on 11/10/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = UIImage(named: "computer")
        classifyImage()
    }
    
    func classifyImage() {
        guard let ciImage = CIImage(image: imgView.image!) else {
            print("Failed to convert UIImage to CIImage")
            return
        }
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {
          print("Failed to load ML model!")
            return
        }
        
        result.text = "Classifying Image..."
        
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
          let results = request.results as? [VNClassificationObservation]

          var classificationResultText = ""
          
          for result in results! {
            classificationResultText += "\(Int(result.confidence * 100))% of \(result.identifier)\n"
          }
            
          print(classificationResultText)
            
          DispatchQueue.main.async {
            self?.result.text! = classificationResultText
          }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global(qos: .userInteractive).async {
          do {
            try handler.perform([request])
          } catch {
            print(error)
          }
        }
        
    }

    @IBAction func showResult(_ sender: Any) {
        
    }
    
}

