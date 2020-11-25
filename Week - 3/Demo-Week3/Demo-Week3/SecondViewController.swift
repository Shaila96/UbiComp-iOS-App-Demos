//
//  SecondViewController.swift
//  Demo-Week3
//
//  Created by Shaila Zaman on 9/9/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var str: String?
    @IBOutlet weak var secondLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        secondLbl.text = str!
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
