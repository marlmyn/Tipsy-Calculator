//
//  ViewController.swift
//  TipsyLabWork
//
//  Created by Akmaral Ergesh
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ZeroPersent: UIButton!
    @IBOutlet weak var TenPersent: UIButton!
    @IBOutlet weak var TwentyPercent: UIButton!
    @IBOutlet weak var calculateLabel: UITextField!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var billTotal = 0.0
    var tip = 0.1
    var persentageValue = 2
    var totalValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateLabel.keyboardType = .numberPad
    }

    @IBAction func stepper(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        persentageValue = Int(sender.value)
    }
    
  
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        
        let removeFromSymbol = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(removeFromSymbol)!
        
        tip = buttonTitleAsANumber / 100
        
        ZeroPersent.isSelected = false
        TenPersent.isSelected = false
        TwentyPercent.isSelected = false
        
        sender.isSelected = true
        
        calculateLabel.endEditing(true)
   
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill = calculateLabel.text!
        
        if bill != ""{
            
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(persentageValue)
            let resultToDecimal = String(format: "%.2f", result)
            totalValue = resultToDecimal
            print(resultToDecimal)
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if segue.identifier == "goToResult"{
                let destinationVC = segue.destination as! ResultViewController
                destinationVC.totalValue = totalValue
                destinationVC.tip = Int(tip * 100)
                destinationVC.split = persentageValue
            }
        }
    
}

