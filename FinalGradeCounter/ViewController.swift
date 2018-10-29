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
        let gradeC = Double(Current.text!)!
        let gradeW = Double(Final.text!)!
        let weight = Double(Percent.text!)!
        let decimalPercent = weight / 100.0
        let percentLeft = 1 - decimalPercent
        let finalGrade = (gradeW - (percentLeft * gradeC)) / decimalPercent
        Grade.text = "\(finalGrade)"
        if finalGrade <= 100 {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    
    
    
}

