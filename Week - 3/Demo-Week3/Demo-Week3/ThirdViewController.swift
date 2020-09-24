//
//  ThirdViewController.swift
//  Demo-Week3
//
//  Created by Shaila Zaman on 9/9/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit

protocol ShowDelegation {
    func showDelegation(str:String)
}

class ThirdViewController: UIViewController {
    
    var delegateVar: ShowDelegation?
    @IBOutlet weak var inputTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showDelegation(_ sender: Any) {
        delegateVar?.showDelegation(str: inputTxt.text!)
        self.dismiss(animated: true, completion: nil)
        
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
