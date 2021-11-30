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
    
    // The feedback the user is given
    @State var feedback = ""
    
    //the target the user is trying find
    let target = Int.random(in: 1...100)
    
    // MARK: Computed Property
    var body: some View {
        VStack{
            
            // Out put - show current guess
            Text("\(String(format: "%.0f", currentGuess))")
                .font(.title2)
                .bold()
            
            // Input - selected guess
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
            
            // Input - check guess
            Button (action:{
                
                // Ceate a temporary constant with the guess as an intager
                let currentGuessAsInteger = Int(currentGuess)
                
                // Check the users guess
                if currentGuessAsInteger > target {
                    
                    feedback = "you are wrong, guess lower"
                    
                } else if currentGuessAsInteger < target{
                    feedback = "You are wrong, guess higher"
                } else {
                    feedback = "Good 4 U"
                }
                
            }, label: {
                Text("Submit Guess")
            })
                .buttonStyle(.bordered)
            
            
            // Output - Show Feedback
            Text("\(feedback)")
                .italic()
                .padding()
            
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
