//
//  FirstViewController.swift
//  calculate
//
//  Created by Nabil Rahman on 9/16/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
    }

    @IBAction func calculateButton(_ sender: Any) {
    
        resultLabel.isHidden = false
        
        let firstValue = Double(firstTextField.text!)
        let secondValue = Double(secondTextField.text!)
        
        if firstValue != nil && secondValue != nil {
            let outputValue = Double(firstValue! + secondValue!)
            resultLabel.text = "\(outputValue)"
        }
        else
        {
            resultLabel.text = "NOPE!"
        }
        
        
        
    }
    
}

