//
//  Calculator.swift
//  Division_MVP
//
//  Created by gomiRintaro on 2023/06/16.
//

enum CalculateError: Error {
    case dividedByZero
}

final class Calculator {

    func divide(number1: Double, number2: Double) throws -> Double {
        if number2 == 0 { throw CalculateError.dividedByZero }
        return number1 / number2
    }
}

