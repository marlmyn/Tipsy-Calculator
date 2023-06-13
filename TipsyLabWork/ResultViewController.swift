//
//  ResultViewController.swift
//  TipsyLabWork
//
//  Created by Akmaral Ergesh
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue: String?
    var tip = 0
    var split = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(split) people, with \(tip) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
            
            self.dismiss(animated: true, completion: nil)
            
        }
}
