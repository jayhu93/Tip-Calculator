//
//  SettingViewController.swift
//  Tip
//
//  Created by YupinHuPro on 7/29/17.
//  Copyright © 2017 Yupin Hu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var tipPercentages = [0.18, 0.2, 0.25]
    @IBOutlet weak var tipControl: UISegmentedControl!


    @IBAction func tipControlValueChanged(_ sender: Any) {
        // When value changed, i will update user default
        let tipControlIndex = tipControl.selectedSegmentIndex
        let tipPercentage = tipPercentages[tipControlIndex]
        let defaults = UserDefaults.standard
        defaults.set(tipPercentage, forKey: "defaultTipPercentage")
        defaults.synchronize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // On view did load, i will first look into user default, if not user 15%
        let defaults = UserDefaults.standard
        let value = defaults.double(forKey: "defaultTipPercentage")
        let index = tipPercentages.index(of: Double(value)) ?? 0
        tipControl.selectedSegmentIndex = index
    }


}
