//
//  ViewController.swift
//  Demo-Week3
//
//  Created by Shaila Zaman on 9/9/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ShowDelegation {

    @IBOutlet weak var delegateOutputTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showDelegation(str: String) {
        delegateOutputTxt.text = str
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "second_seg" {
            let segueSecond = segue.destination as! SecondViewController
            segueSecond.str = delegateOutputTxt.text! + " From 1st view"
        }
        if segue.identifier == "third_seg" {
            let segThird = segue.destination as! ThirdViewController
            segThird.delegateVar = self
        }
    }
    
    @IBAction func secondView(_ sender: Any) {
        performSegue(withIdentifier: "second_seg", sender: self)
    }
    
    @IBAction func thirdView(_ sender: Any) {
        performSegue(withIdentifier: "third_seg", sender: self)
        
    }
}

