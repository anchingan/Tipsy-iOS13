//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //Dismiss keyboard when user tapped tip button
        billTextField.endEditing(true)
        
        //Deselect all tip buttons
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        
        //Make the button that triggered the IBAction selected
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text
        if bill != "" {
            billTotal = Double(bill!)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            print(String(format: "%.2f", result))
            performSegue(withIdentifier: "ShowResultVCSegue", sender: String(format: "%.2f", result))
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResultVCSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.splitAmount = sender as? String
            destinationVC.numberOfPeople = self.numberOfPeople
            destinationVC.tip = self.tip
        }
    }
    

}

