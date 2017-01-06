//
//  SettingViewController.swift
//  Tip-Me
//
//  Created by Seung A Jang on 1/5/17.
//  Copyright © 2017 Seung A Jang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTipControl.selectedSegmentIndex = UISegmentedControlNoSegment
        
        let defaults = UserDefaults.standard
        let themeSwitch = defaults.bool(forKey: "changeTheme")
        if(themeSwitch) {
            self.themeSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
   
    @IBAction func changeTheme(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(themeSwitch.isOn, forKey: "changeTheme")
        
        if(themeSwitch.isOn) {
            print("switch is on")
        } else {
            print("switch is off")
        }
        
        defaults.synchronize()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
