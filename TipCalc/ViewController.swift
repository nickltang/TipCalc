//
//  ViewController.swift
//  TipCalc
//
//  Created by Nick Tang on 8/20/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    let tipPercentages = [0.15, 0.18, 0.2]
    let defaults = UserDefaults.standard
    var tipPercentIndex = 0
    var darkModeIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // Load tip and dark mode indices from UserDefaults
        tipPercentIndex = defaults.integer(forKey: "tipPercentIndex")
        darkModeIndex = defaults.integer(forKey: "darkModeIndex")
        
        // Get initial bill amount and calculate tips
        let bill = Double(billTextField.text!) ?? 0
        
        // Recalculate tip and total
        let tip = bill * tipPercentages[tipPercentIndex]
        let total = bill + tip
        
        // Update tip percent, tip amount, and total labels
        tipPercentLabel.text = String(format: "Tip (%.0f%%)", tipPercentages[tipPercentIndex] * 100)
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        
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

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billTextField.text!) ?? 0
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipPercentIndex]
        let total = bill + tip
        
        // Update tip and total labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
}

