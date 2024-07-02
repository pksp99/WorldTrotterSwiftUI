//
//  ConverterViewModel.swift
//  WorldTrotterSwiftUI
//
//  Created by Preet Karia on 2/2/24.
//

import Foundation

class ConverterViewModel: ObservableObject {
    @Published var fahrenheitString = ""
    @Published var celsiusString = ""
    
    func setCelsiusString() {
        if let fahrenheit = Double(fahrenheitString) {
            let celsius = (fahrenheit - 32) * 5 / 9
            celsiusString = String(format: "%.2f", celsius)
        }
        else {
            celsiusString = ""
        }
    }
    
    func setFahrenheitString() {
        if let celsius = Double(celsiusString) {
            let fahrenheit = celsius * 9 / 5 + 32
            fahrenheitString = String(format: "%.2f", fahrenheit)
        }
        else {
            fahrenheitString = ""
        }
    }
    
}
