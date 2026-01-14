import SwiftUI


struct TaskBar: View {
    let username: String
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            NavigationStack {
                TaskView()
            }
            .tabItem {
                Image(systemName: "checkmark.circle")
                Text("Tasks")
            }
            
            NavigationStack {
                hubWorldView()
            }
            .tabItem {
                Image(systemName: "globe")
                Text("Hub World")
            }
            
            NavigationStack {
                shopView()
            }
            .tabItem {
                Image(systemName: "dollarsign")
                Text("Shop")
            }
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.circle")
                Text("Profile")
            }
            
            
            
        }
    }
}

#Preview {
    TaskBar(username: "Admin")
}
