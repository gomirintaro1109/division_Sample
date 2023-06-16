//
//  ViewController.swift
//  Division_MVP
//
//  Created by gomiRintaro on 2023/06/16.
//

import UIKit

class ViewController: UIViewController,CalculatorView {
    var presenter: CalculatorPresenter?
    
    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if let number1 = Double(number1TextField.text!),
           let number2 = Double(number2TextField.text!) {
            presenter?.calculateDivide(number1: number1, number2: number2)
        }
    }
    
    
    func displayResult(result: Double) {
        resultLabel.text = String(result)
    }
    
    func displayError(error: String) {
        let alertController = UIAlertController(title: "エラー", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = CalculatorPresenter(model: Calculator(), view: self)
       }
    }
    
    


