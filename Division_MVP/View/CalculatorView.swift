//
//  CalculatorView.swift
//  Division_MVP
//
//  Created by gomiRintaro on 2023/06/16.
//

import Foundation
protocol CalculatorView: AnyObject {
    func displayResult(result: Double)
    func displayError(error: String)
}
