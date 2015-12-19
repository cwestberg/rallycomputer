//
//  ViewController.swift
//  RallyComputer
//
//  Created by Clarence Westberg on 12/15/15.
//  Copyright © 2015 Clarence Westberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!

    var speed = "36"
    var timer = NSTimer()
    var timeUnit = "seconds"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Connect data:
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
            selector: "updateTimeLabel", userInfo: nil, repeats: true)

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimeLabel(){
        let currentDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: currentDate)
        
//        print("second = \(dateComponents.second)")
        
        
        let unit = Double(dateComponents.second)
        let second = Int(unit)
        let secondString = String(format: "%02d", second)
        
        let cent = Int((unit * (1.6667)))
        let centString = String(format: "%02d", cent)
        let minuteString = String(format: "%02d", dateComponents.minute)
        switch timeUnit {
        case "seconds":
            timeLbl.text = "\(dateComponents.hour):\(minuteString):\(secondString)"
        case "cents":
            timeLbl.text = "\(dateComponents.hour):\(minuteString).\(centString)"
        default:
            break;
        }
        

    }

    @IBAction func startBtn(sender: AnyObject) {
        let currentDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: currentDate)
        
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Alert", message: "Start At", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
            
        }
        actionSheetController.addAction(cancelAction)
        
        //Create and an start action
        let startAction: UIAlertAction = UIAlertAction(title: "Start", style: .Default) { action -> Void in
            //Do some other stuff

            
            let hours = actionSheetController.textFields![0]
            let minutes = actionSheetController.textFields![1]
            let units = actionSheetController.textFields![2]
//            print("hour = \(dateComponents.hour)")
//            print("minute = \(dateComponents.minute)")
//            
//            var hh = ""
//            if hours.text! == "HH " {
//                hh = "\(dateComponents.hour)"
//            }
//            else {
//                hh = "\(hours.text!)"
//            }
            print("HH: \(hours.text!) MM: \(minutes.text!) UU: \(units.text!)")

        }
        actionSheetController.addAction(startAction)
        
        
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.text = "HH \(dateComponents.hour)"
            textField.textColor = UIColor.blueColor()
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.text = "MM \(dateComponents.minute + 1)"
            textField.textColor = UIColor.blueColor()
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.text = "UU 00"
            textField.textColor = UIColor.blueColor()
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.text = "Speed \(self.speed)"
            textField.textColor = UIColor.blueColor()
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    

}

