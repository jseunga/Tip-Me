//
//  ViewController.swift
//  Tip-Me
//
//  Created by Seung A Jang on 1/5/17.
//  Copyright © 2017 Seung A Jang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = defaultTip
        
        let changeTheme = defaults.bool(forKey: "changeTheme")
        if(changeTheme) {
            self.view.backgroundColor = UIColor.darkGray
            billField.backgroundColor = UIColor.darkGray
            billField.keyboardAppearance = UIKeyboardAppearance.dark
            splitField.backgroundColor = UIColor.darkGray
            splitStepper.tintColor = UIColor.darkText
            tipControl.tintColor = UIColor.darkText
        } else {
            self.view.backgroundColor = UIColor.white
            billField.backgroundColor = UIColor.white
            billField.keyboardAppearance = UIKeyboardAppearance.light
            splitField.backgroundColor = UIColor.white
            splitStepper.tintColor = UIColor.init(colorLiteralRed: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
            tipControl.tintColor = UIColor.init(colorLiteralRed: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
        }
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("view did appear")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("view will disappear")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("view did disappear")
//    }


    
//    @IBAction func onTap(_ sender: Any) {
//        view.endEditing(true)
//    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let numSplit = splitStepper.value
        splitField.text = "\(Int(numSplit))"
        
        let splitTotal = total / numSplit
        splitTotalLabel.text = String(format: "$%.2f", splitTotal)
        
    }

}


