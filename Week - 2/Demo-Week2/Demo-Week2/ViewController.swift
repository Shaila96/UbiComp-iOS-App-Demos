//
//  ViewController.swift
//  Demo-Week2
//
//  Created by Shaila Zaman on 9/3/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showName(_ sender: Any) {
        guard nameField.text!.count > 0 else {
            let alert = UIAlertController(title: "No Name!", message: "Please provide your name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in self.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        nameLabel.text = nameField.text!
    }
    
            
    @IBAction func selectOptions(_ sender: Any) {
        let actionAlert = UIAlertController(title: "Options", message: "Select and Options", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Option1", style: .default, handler: {_ in
            self.nameLabel.text = "Name from Option 1"
        }))
        actionAlert.addAction(UIAlertAction(title: "Option2", style: .default, handler: {_ in
            self.nameLabel.text = "Name from Option 2"
        }))
        actionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in self.dismiss(animated: true, completion: nil)
        }))
        self.present(actionAlert, animated: true, completion: nil)
    }

}

