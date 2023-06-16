//
//  Calculator.swift
//  Division_MVP
//
//  Created by gomiRintaro on 2023/06/16.
//

protocol PresenterInput: AnyObject {
    func tappedCalculateButton(number1: Double, number2: Double)
}

protocol PresenterOutput: AnyObject {
    func displayResult(result: Double)
    func displayError(error: String)
}


final class CalculatorPresenter {
    private let model: Calculator
    private weak var view: PresenterOutput?
    
    init(model: Calculator, view: PresenterOutput) {
        self.model = model
        self.view = view
    }
}

extension CalculatorPresenter: PresenterInput {

    func tappedCalculateButton(number1: Double, number2: Double) {
        do {
            let result = try model.divide(number1: number1, number2: number2)
            view?.displayResult(result: result)
        } catch let error as CalculateError {
            view?.displayError(error: error.message)
        } catch {
            view?.displayError(error: "不明なエラー")
        }
    }
}

private extension CalculateError {

    var message: String {
        switch self {
        case .dividedByZero: return "0では割れません。"
        }
    }
}


