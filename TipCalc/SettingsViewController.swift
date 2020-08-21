//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Nick Tang on 8/20/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    @IBOutlet weak var darkModeControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // Load UserDefault settings
        let tipPercentIndex = defaults.integer(forKey: "tipPercentIndex")
        let darkModeIndex = defaults.integer(forKey: "darkModeIndex")
        
        // Make sure selected segment control indices are same as UserDefault
        tipPercentControl.selectedSegmentIndex = tipPercentIndex
        darkModeControl.selectedSegmentIndex = darkModeIndex
        
        // Update dark mode appearance
        switch darkModeIndex {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        case 2:
            overrideUserInterfaceStyle = .unspecified
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func changeTipPercentage(_ sender: Any) {
        defaults.set(tipPercentControl.selectedSegmentIndex, forKey: "tipPercentIndex")
    }
    
    @IBAction func changeDarkMode(_ sender: Any) {
        defaults.set(darkModeControl.selectedSegmentIndex, forKey: "darkModeIndex")
        
        switch darkModeControl.selectedSegmentIndex {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        case 2:
            overrideUserInterfaceStyle = .unspecified
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }
}
