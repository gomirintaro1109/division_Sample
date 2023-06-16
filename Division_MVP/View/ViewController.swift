//
//  ViewController.swift
//  Division_MVP
//
//  Created by gomiRintaro on 2023/06/16.
//

import UIKit

final class ViewController: UIViewController {

    private var presenter: CalculatorPresenter?
    
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBAction private func calculateButtonPressed(_ sender: Any) {
        guard let number1 = Double(number1TextField.text!) else { return }
        guard let number2 = Double(number2TextField.text!) else { return }
        presenter?.tappedCalculateButton(number1: number1, number2: number2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CalculatorPresenter(model: Calculator(), view: self)
    }
}

extension ViewController: PresenterOutput {

    func displayResult(result: Double) {
        resultLabel.text = String(result)
    }

    func displayError(error: String) {
        let alertController = UIAlertController(title: "エラー", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
    
    


