//
//  DecimalGeneratorViewController.swift
//  BinaryGenerator
//
//  Created by RV on 6/10/19.
//  Copyright © 2019 RV. All rights reserved.
//

import UIKit

class DecimalGeneratorViewController: UIViewController {

    var decimalValue = 0
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var ansLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func generateDecimalBtn(_ sender: Any) {
        calculateDecimal(textField.text!)
        
    }
    
    func calculateDecimal(_ value:String){
        
        // Checking if the input given by user is valid
        if(validateInput(value)){
            
            // decimalValue is a Global variable which is calculated while validating the input
            ansLabel.text = String(decimalValue)
            
            // Reseting the decimal value so it doesn't keep adding
            decimalValue = 0
        
        }
    }
    
    func resetAnsLable(){
        ansLabel.text = "Answer"
    }
    
    //Checks the input if it is valid, if string is a number or not
    func validateInput(_ input1:String)-> Bool{
        
        let binaryCalculator = BinaryCalculator()
        decimalValue = binaryCalculator.getBinaryToDecimal(binaryString: input1)
        
        if (decimalValue == -1){
            
            // string contained a digit except 1 or 0 or contains a character
            showToast(controller: self, message : "Check Your Input.", seconds: 2.0)
            resetAnsLable()
            return false
            
        }else{
            
            return true

        }
    }
    
    // Creates a small pop-up using alert class, to show user small message
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        
        // Setting up the alert
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

}
