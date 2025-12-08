import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var goToHome = false      // Controls navigation
    @State private var wrongPassword = false // Optional error handling

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("beebo")
                    .resizable()
                    .frame(width: 350, height: 100)
                Text("Lifestyle & Self Care")
                    .font(.title)
                    .bold()
                
                // Username field
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // Password field
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // LOGIN BUTTON
                Button(action: {
                    authenticateUser()
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                // Hidden navigation triggered by goToHome
                NavigationLink(
                    destination: newHomeView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $goToHome
                ) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)  // hide nav bar on login screen
        }
    }

    func authenticateUser() {
        // Replace this with your real authentication
        if username == "Jack" && password == "1234" {
            goToHome = true        // Navigate to HomeView
        } else {
            wrongPassword = true   // Trigger your error UI if needed
        }
    }
}

#Preview {
    LoginView()
}
