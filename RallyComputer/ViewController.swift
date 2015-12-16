//
//  ViewController.swift
//  RallyComputer
//
//  Created by Clarence Westberg on 12/15/15.
//  Copyright © 2015 Clarence Westberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var speedLbl: UILabel!

    @IBOutlet weak var speedPicker: UIPickerView!
    let pickerData = []
    let tenths = ["0","1", "2", "3", "4", "5", "6","7","8","9"]
    let ones = ["0","1", "2", "3", "4", "5", "6","7","8","9"]
    let decimals = ["0","1", "2", "3", "4", "5", "6","7","8","9"]
    var speed = "36"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Connect data:
        speedPicker.delegate = self
        speedPicker.dataSource = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return tenths[row]
        case 1:
            return ones[row]
        case 2:
            return decimals[row]
        default:
            return "?"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            speed = tenths[row]
        case 1:
            speed = ones[row]
        case 2:
            speed = decimals[row]
        default:
            speed = "?"
        }
        speedLbl.text = tenths[component]
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    

}

