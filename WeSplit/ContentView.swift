//
//  ContentView.swift
//  WeSplit
//
//  Created by Jordan Haynes on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var tipPercentage = 20
    @State private var numberOfPeople = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipvalue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipvalue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                        .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people?", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                } header: {
                    Text("How much was the meal?")
                        .foregroundColor(.blue)
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                .foregroundColor(.blue)
                
                Section {
                    Text(totalPerPerson, format:
                                .currency(code:Locale.current.currencyCode ?? "USD"))
                }
            }
            .navigationTitle("WeSplit!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
