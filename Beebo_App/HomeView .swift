//
//  HomeView .swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack {
            Spacer()   // Pushes the bar to the bottom
            HStack {
                navItem(icon: "house.fill", title: "Home", index: 0)
                Spacer()
                navItem(icon: "checkmark.circle", title: "Task", index: 1)
                Spacer()
                navItem(icon: "globe", title: "Hub World", index: 2)
                Spacer()
                navItem(icon: "dollarsign.circle", title: "Shop", index: 3)
                Spacer()
                navItem(icon: "person.circle", title: "Profile", index: 4)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(red: 212/255, green: 235/255, blue: 229/255))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Proper infinite frame
    }
    func navItem(icon: String, title: String, index: Int) -> some View {
        VStack(spacing: 2) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(selectedTab == index ? .black : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(selectedTab == index ? .black : .gray)
        }
        .onTapGesture {
            selectedTab = index
            print(index)
        }
    }
}
#Preview {
    HomeView()
}

