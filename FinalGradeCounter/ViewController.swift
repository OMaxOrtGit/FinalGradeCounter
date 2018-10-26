//
//  ViewController.swift
//  FinalGradeCounter
//
//  Created by max ortman on 10/25/18.
//  Copyright © 2018 john hersey high school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Current: UITextField!
    @IBOutlet weak var Final: UITextField!
    @IBOutlet weak var Percent: UITextField!
    
    @IBOutlet weak var Grade: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func Calculate(_ sender: Any) {
        
        Grade.text = "\((Double(Current.text!)! - (1.0 - Double(Percent.text!)!) * (Double(Final.text!)!)) / Double(Percent.text!)!)"
        
    }
    
}

