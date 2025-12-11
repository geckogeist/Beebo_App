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
            
            ScrollView(.horizontal) {
                HStack {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                        .frame(width:140, height: 140)
                        .overlay(
                            VStack {
                                Text("Latest Task")
                                    .font(.headline)
                                Text(" - Clean your bathroom")
                                    .font(.subheadline)
                            }
                                .foregroundColor(.white)
                                .padding()
                        )
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                        .frame(width:140, height: 140)
                        .overlay(
                            VStack {
                                Text("Mising Task")
                                    .font(.headline)
                                Text("None missing!")
                                    .font(.subheadline)
                                Image("isaacUp")
                            }
                                .foregroundColor(.white)
                                .padding()
                        )
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                        .frame(width:140, height: 140)
                        .overlay(
                            VStack {
                                Text("Latest Task")
                                    .font(.headline)
                                Text(" - Clean your bathroom")
                                    .font(.subheadline)
                            }
                                .foregroundColor(.white)
                                .padding()
                        )
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                        .frame(width:140, height: 140)
                        .overlay(
                            VStack {
                                Text("Latest Task")
                                    .font(.headline)
                                Text(" - Clean your bathroom")
                                    .font(.subheadline)
                            }
                                .foregroundColor(.white)
                                .padding()
                        )
                    
                    
                    
                }
            }
            Spacer()
        }
    }
}

#Preview{
    HomeView()
}
