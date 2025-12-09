import SwiftUI

struct HomeView: View {
    @State private var taskCompleted = 0.0
    @State private var maxTask = 20.0
    @State private var userLevel = 1

    private var progressValue: Double {
        taskCompleted / maxTask
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: -30) {
                
                
                ProgressView("Task Progress", value: progressValue, total: 1.0)
                    .padding()
                
                HStack {
                    Text("\(Int(taskCompleted))/\(Int(maxTask))")
                    Spacer()
                }
                .padding(20)

                HStack {
                    Text("Level \(userLevel)")
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(20)
                .bold()

                Button("Increment Progress") {
                    if taskCompleted < maxTask {
                        taskCompleted += 1.0
                    } else {
                        taskCompleted = 0.0
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                        
                    }
                }
            }
            
            HStack {
                Text("Latest Task")
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.green), lineWidth: 1))
                .padding([.top, .horizontal])
            }
            Spacer()
        }
    }
}

#Preview{
    HomeView()
}
