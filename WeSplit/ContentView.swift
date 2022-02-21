//
//  ContentView.swift
//  WeSplit
//
//  Created by Jordan Haynes on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    // variables/closures needed for the project
    @State private var checkAmount = 0.0
    @State private var tipPercentage = 20
    @State private var numberOfPeople = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalamount: Double {
        let tip = (checkAmount/100) * Double(tipPercentage)
        return checkAmount + tip
    }
    
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
                // This code relates to the meal amount and number of people
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
                    Text("How much was the meal?")                .foregroundColor(.teal)
                }
                
                // This code relates to the tip percentage.
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
                .foregroundColor(.teal)
                
                // This code relates to the total amount of the meal.
                Section {
                    Text(totalamount, format:
                                .currency(code:Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total Amount")
                        .foregroundColor(.blue)
                }
                
                // This code relates to the amount per person.
                Section {
                    Text(totalPerPerson, format:
                                .currency(code:Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
