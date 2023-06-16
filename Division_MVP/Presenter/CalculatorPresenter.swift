//
//  Calculator.swift
//  Division_MVP
//
//  Created by gomiRintaro on 2023/06/16.
//

class CalculatorPresenter {
    private let model: Calculator
    weak var view: CalculatorView?
    
    init(model: Calculator, view: CalculatorView) {
        self.model = model
        self.view = view
    }
    
    func calculateDivide(number1: Double, number2: Double) {
        if number2 == 0 {
            view?.displayError(error: "0では割れません")
            return
        }
        let result = model.divide(number1: number1, number2: number2)
        view?.displayResult(result: result)
    }
}


