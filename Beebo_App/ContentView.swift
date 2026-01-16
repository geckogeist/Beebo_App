//
//  ContentView.swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 11/21/25.
//

import SwiftUI

struct ContentView: View {
    //    @State private var timeRemaining = 3 // Start at 10 seconds
    //    @State private var timeRunning = true
    //    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var showLogin = false
        
        var body: some View {
               Group {
                   if showLogin {
                       LoginView()
                   } else {
                       AnimatedLaunchView(showLogin: $showLogin)
                   }
               }
           }
       }

       struct AnimatedLaunchView: View {
           @Binding var showLogin: Bool
           
           var body: some View {
               VStack {
                   Image("Beebo_Logo")
                       .resizable()
                       .frame(width: 200, height: 200)
                       .foregroundColor(.blue)
                       .frame(maxWidth: .infinity, maxHeight: .infinity)
                       .background(Color.lightBlue)
               }
               .onAppear {
                   // 1. Trigger the animation using withAnimation
                   // 2. Wait for a delay after the animation starts (e.g., 2 seconds total)
                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                       // 3. Trigger the view transition by changing the binding state
                       withAnimation(.easeInOut(duration: 1.0)) { // Add animation to the state change
                            self.showLogin = true
                            }
                       
                }
               }
           }
       }
        
        
    
    


#Preview {
    ContentView()
}
