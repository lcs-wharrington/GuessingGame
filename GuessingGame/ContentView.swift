//
//  ContentView.swift
//  GuessingGame
//
//  Created by William Robert Harrington on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Property
    @State var currentGuess: Double = 50
    
    //the target the user is trying
    let target = Int.random(in: 1...100)
    
    // MARK: Computed Property
    var body: some View {
        VStack{

            Text("\(String(format: "%.0f", currentGuess))")
                .font(.title2)
                .bold()
            
            
            Slider(value: $currentGuess,
                   in: 0.0...100.0,
                   label: {
                Text("Guess")
            },
                   minimumValueLabel: {
                Text("0.0")
            },
                   maximumValueLabel: {
                Text("100.0")
            })
            
            Button (action:{
                print("Guess Submited")
            }, label: {
                Text("Submit Guess")
            })
                .buttonStyle(.bordered)

            Text("The actual secret number is: \(target).")
            
            
            Spacer()
        }
        .padding()
        .navigationTitle("Guessing game")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
