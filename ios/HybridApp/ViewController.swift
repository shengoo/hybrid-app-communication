//
//  ViewController.swift
//  HybridApp
//
//  Created by sheng qing on 15/3/2.
//  Copyright (c) 2015年 sheng qing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClick() {
        if textField.text != ""{
            println(textField.text)
        }
    }

}

