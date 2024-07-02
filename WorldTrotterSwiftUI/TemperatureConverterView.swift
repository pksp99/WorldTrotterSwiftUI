//
//  TemperatureConverterView.swift
//  WorldTrotterSwiftUI
//
//  Created by Preet Karia on 1/27/24.
//

import SwiftUI

struct TemperatureConverterView: View {
    
    enum Unit: String {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
    }
    
    @StateObject private var converterViewModel = ConverterViewModel()
    @FocusState private var focusedUnit: Unit?
    
    private var bgColor: Color {
        return (converterViewModel.celsiusString == "" || converterViewModel.fahrenheitString == "") && converterViewModel.fahrenheitString != converterViewModel.celsiusString ? .red : .white
    }


    
    var body: some View {
        VStack(spacing: 20) {
            temperatureInputView(unit: .fahrenheit, input: $converterViewModel.fahrenheitString, onChanged: converterViewModel.setCelsiusString)
            temperatureInputView(unit: .celsius, input: $converterViewModel.celsiusString, onChanged: converterViewModel.setFahrenheitString)
        }
        .padding()
        .background(bgColor)
        .navigationTitle("Conversion")
    }
    private func temperatureInputView(unit: Unit, input: Binding<String>, onChanged: @escaping () -> Void) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.thinMaterial)
            
            VStack {
                Text(unit.rawValue)
                    .font(.title.lowercaseSmallCaps())
                    .padding()
                
                TextField("Enter \(unit.rawValue)", text: input)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.title)
                    .focused($focusedUnit, equals: unit)
                    .onChange(of: input.wrappedValue) {
                        if focusedUnit == unit {
                            onChanged()
                        }
                    }
            }
            
        }
        .padding(20.0)
        .frame(maxHeight: 300)
    }
}


#Preview {
    TemperatureConverterView()
}
