import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isUsernameInvalid = false
    @State private var isPasswordInvalid = false
    @State private var isAuthenticated = false
    @State private var isLoading = false
    @FocusState private var focusedField: Field?
    
    enum Field {
        case username, password
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                decorativeCircles
                
                VStack(spacing: 25) {
                    headerSection
                    inputFields
                    loginButton
                }
                .padding(.horizontal, 40)
            }
            // Modern way to handle programmatic navigation
            .navigationDestination(isPresented: $isAuthenticated) {
                TaskBar(username: username)

                
                
                    .navigationBarBackButtonHidden(true) // hide back button here
            }
        }
    }


    // MARK: - View Components
    
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.blue, Color.blue.opacity(0.8)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    private var decorativeCircles: some View {
        ZStack {
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Image("beebo")
                .resizable()
                .frame(width:200, height: 60)
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Sign in to continue")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.bottom, 20)
    }
    
    private var inputFields: some View {
        VStack(spacing: 15) {
            InputField(
                icon: "person.fill",
                placeholder: "Username",
                text: $username,
                isInvalid: isUsernameInvalid,
                errorMessage: "Invalid username"
            )
            .focused($focusedField, equals: .username)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .onSubmit { focusedField = .password }
            
            SecureInputField(
                icon: "lock.fill",
                placeholder: "Password",
                text: $password,
                isInvalid: isPasswordInvalid,
                errorMessage: "Invalid password"
            )
            .focused($focusedField, equals: .password)
            .onSubmit { authenticateUser() }
        }
    }
    
    private var loginButton: some View {
        Button {
            authenticateUser()
        } label: {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text("Login")
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(isFormValid ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 5, y: 3)
        }
        .disabled(!isFormValid || isLoading)
        .animation(.easeInOut(duration: 0.2), value: isFormValid)
    }
    
    // MARK: - Computed Properties
    
    private var isFormValid: Bool {
        !username.isEmpty && !password.isEmpty
    }
    
    // MARK: - Authentication Logic
    
    private func authenticateUser() {
        // Reset error states
        isUsernameInvalid = false
        isPasswordInvalid = false
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if username.lowercased() == "admin" {
                if password.lowercased() == "password" {
                    withAnimation {
                        isAuthenticated = true
                    }
                } else {
                    withAnimation {
                        isPasswordInvalid = true
                        shakeField()
                    }
                }
            } else {
                withAnimation {
                    isUsernameInvalid = true
                    shakeField()
                }
            }
            isLoading = false
        }
    }
    
    private func shakeField() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
// MARK: - Input Field Component
struct InputField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var isInvalid: Bool = false
    var errorMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .frame(width: 20)
                TextField(placeholder, text: $text)
            }
            .padding()
            .background(Color.black.opacity(0.05))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isInvalid ? Color.red : Color.clear, lineWidth: 2)
            )
            
            if isInvalid && !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
                    .transition(.opacity)
            }
        }
    }
}
// MARK: - Secure Input Field Component
struct SecureInputField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var isInvalid: Bool = false
    var errorMessage: String = ""
    @State private var isSecure = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .frame(width: 20)
                
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
                
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.black.opacity(0.05))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isInvalid ? Color.red : Color.clear, lineWidth: 2)
            )
            
            if isInvalid && !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
                    .transition(.opacity)
            }
        }
    }
}
// MARK: - Home View

#Preview {
    LoginView()
}

