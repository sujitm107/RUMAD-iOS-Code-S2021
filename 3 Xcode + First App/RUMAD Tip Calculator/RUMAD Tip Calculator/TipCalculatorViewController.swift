//
//  TipCalculatorViewController.swift
//  RUMAD Tip Calculator
//
//  Created by Sujit Molleti on 2/9/21.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    let tipPercents: [Double] = [0.10, 0.15, 0.20, 0.25]
    var tipPercent: Double = 0.10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
        
    }
    
    
    @IBAction func didTapCalculate(_ sender: Any) {
        //get amount from textfield and convert into a double
        let billString = billAmountTextField.text!
        
        //calcualate the tip using the tipPercent
        guard let billAmount = Double(billString) else { return }
        let tipAmount = billAmount * tipPercent
        
        //calculated the totalAmount
        let totalAmount = billAmount + tipAmount
        
        //display the total and the tip
        if billString.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return
        }
        
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        
        //set the text of the total amount label to
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
        
    }
    
    @IBAction func didTapTipSegmentedControl(_ sender: UISegmentedControl) {
        
        tipPercent = tipPercents[sender.selectedSegmentIndex]
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
