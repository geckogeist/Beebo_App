import SwiftUI

struct HomeView: View {
    @State private var taskCompleted = 0.0
    @State private var maxTask = 20.0
    @State private var userLevel = 1
    
    private var progressValue: Double {
        taskCompleted / maxTask
    }
    
    var body: some View {
        VStack(spacing:-30) {
            
            NavigationLink(destination: SettingsView()) {
                Label("Settings", systemImage: "gearshape")
            }
            Spacer()
            ProgressView("Task Progress", value: progressValue, total: 1.0)
                .padding()
            
            HStack {
                Text("\(Int(taskCompleted))/\(Int(maxTask))")
                Spacer()
            }
            .padding(20)
            HStack {
                Text("Level " + String(userLevel))
                    .font(.system(size: 24))

                Spacer()
            }
            .padding(20)
            .bold()

            Button("Increment Progress") {
                if taskCompleted < maxTask {
                    taskCompleted += 1.0
                } else {
                    taskCompleted = 0.0  // Reset
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

