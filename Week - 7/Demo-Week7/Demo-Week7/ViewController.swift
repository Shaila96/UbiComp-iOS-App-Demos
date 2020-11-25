//
//  ViewController.swift
//  Demo-Week7
//
//  Created by Shaila Zaman on 10/7/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passedData = DemoInfo()
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label1.text = passedData.name + ": \(passedData.age)"
    }


}

