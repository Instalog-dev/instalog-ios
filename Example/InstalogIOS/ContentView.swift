//
//  ContentView.swift
//  Example
//
//  Created by Ogbonda Chiziaruhoma on 10/03/2024.
//

import InstalogIOS
import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var apiKey: String = ""
    
    init() {
        Instalog.shared.initialize(key: "instalog_9f00512cb7ef49b39f849f593f472177")
     }
     

    var body: some View {
        NavigationView {
            VStack {
                Text("Instalog")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)

                Text("Welcome to Instalog's iOS Example!")

                TextField(
                    "Enter api key...", text: $apiKey,
                    onCommit: {
                        Instalog.shared.initialize(key: apiKey)
                    }
                )
                .autocapitalization(.none)
                .foregroundColor(.black)
                .padding(.all)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding().padding(.bottom, 30)

                Button(action: {
                    Instalog.shared.showFeedbackModal()
                }) {
                    Text("Feedback")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Button(action: {
                    // Your action for send event
                    let log = InstalogLogModel(
                        event: "Testing from Instalog SDK",
                        params: ["name": "anarchist"]
                    )
                    
                    Instalog.shared.logEvent(log: log)
                }) {
                    Text("Send Event")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                    Instalog.crash.simulateCrash()
                }) {
                    Text("Simulate Crash")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
