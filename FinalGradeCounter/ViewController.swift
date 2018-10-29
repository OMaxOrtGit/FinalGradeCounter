//
//  ViewController.swift
//  FinalGradeCounter
//
//  Created by max ortman on 10/25/18.
//  Copyright © 2018 john hersey high school. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var Current: UITextField!
    @IBOutlet weak var Final: UITextField!
    @IBOutlet weak var SC: UISegmentedControl!
    @IBOutlet weak var PV: UIPickerView!
    @IBOutlet weak var Percent: UITextField!
    
    @IBOutlet weak var Grade: UILabel!
    @IBOutlet weak var Egrade: UILabel!
    func updatedSC() {
        if SC.selectedSegmentIndex == 0 {
            Final.text = "90"
        } else {
            if SC.selectedSegmentIndex == 1 {
                Final.text = "80"
            } else {
                if SC.selectedSegmentIndex == 2 {
                    Final.text = "70"
                } else {
                    Final.text = "60"
                }
            }
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PVData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PVData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SC.selectedSegmentIndex = row
        updatedSC()
    }
    var PVData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PV.delegate = self
        PV.dataSource = self
        
        PVData = ["A","B","C","D"]
    }
    
    @IBAction func SCC(_ sender: Any) {
        PV.selectRow(SC.selectedSegmentIndex, inComponent: 0, animated: true)
        updatedSC()
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
            Egrade.text = ""
        } else {
            view.backgroundColor = UIColor.red
            Egrade.text = "You should ask your teacher for extra credit"
        }
    }
    
    
    
    
}

