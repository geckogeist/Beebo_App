//
//  newHomeView.swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 12/3/25.
//

import SwiftUI

struct taskBar: View {
    var body: some View {
        
        TabView {
            Text("Home :)")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Task :|")
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Tasks")
                }
            
            Text("Hub World :0")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Hub World")
                }
            
            Text("Task :|")
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Shop")
                }

            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        
        
        
    }
}


#Preview {
    taskBar()
}
