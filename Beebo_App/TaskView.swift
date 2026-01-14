//
//  TaskView.swift
//  Beebo_App
//
//  Created by Ethan Nkrumah on 12/11/25.
//

import SwiftUI
// MARK: - MAIN CONTENT VIEW (FIXED)
struct TaskView: View {
    var body: some View {
        RootTabView()
    }
}
// MARK: - ROOT TAB VIEW
struct RootTabView: View {
    
    var body: some View {
        TabView {
            FitnessHomeView()
                .tabItem {
                    Label("Home", systemImage: "figure.walk")
                }
            
            RingsView()
                .tabItem {
                    Label("Rings", systemImage: "circle.grid.3x3.fill")
                }
            
            WeeklyTrendsView()
                .tabItem {
                    Label("Trends", systemImage: "chart.bar.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}
    
// MARK: - FITNESS HOME VIEW
struct FitnessHomeView: View {
    
    @State private var steps = 7200
    @State private var calories = 360
    @State private var distance = 3.3
    
    let goal = 10_000
    
    var progress: Double {
        min(Double(steps) / Double(goal), 1.0)
    }
    
    var message: String {
        switch progress {
        case 0.25..<0.5: return "Great start! 💪"
        case 0.5..<0.8: return "You're halfway there! 🔥"
        case 0.8..<1.0: return "Almost there! 🚀"
        case 1.0: return "🎉 GOAL REACHED! AMAZING JOB! 🎉"
        default: return "Let's get moving! 🏃‍♂️"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                
                ProgressRingView(progress: progress, steps: steps)
                
                Text(message)
                    .font(.headline)
                
                HStack {
                    StatCard(title: "Calories", value: "\(calories)", unit: "kcal")
                    StatCard(title: "Distance", value: String(format: "%.1f", distance), unit: "mi")
                }
                
                Button("Add 500 Steps") {
                    withAnimation {
                        steps += 500
                        calories += 25
                        distance += 0.3
                    }
                }
                .buttonStyle(.borderedProminent)
                
                BarMiniChart(weekly: sampleWeek)
                    .frame(height: 120)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Fitness")
        }
    }
}
// MARK: - RINGS VIEW
struct RingsView: View {
    var body: some View {
        Text("Rings View")
            .font(.largeTitle)
    }
}
// MARK: - WEEKLY TRENDS VIEW
struct WeeklyTrendsView: View {
    var body: some View {
        VStack {
            Text("Weekly Trends")
                .font(.largeTitle)
            BarMiniChart(weekly: sampleWeek)
                .frame(height: 200)
        }
        .padding()
    }
}
// MARK: - SETTINGS VIEW (✅ FIXED FORM ERROR)
struct SettingsView: View {
    
    @State private var stepGoal = 10_000
    @State private var calorieGoal = 500
    @State private var distanceGoal = 5.0
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Goals")) {
                    
                    Stepper("Steps Goal: \(stepGoal)", value: $stepGoal, in: 1000...50_000, step: 500)
                    
                    Stepper(
                        "Calories Goal: \(Int(calorieGoal)) kcal",
                        value: $calorieGoal,
                        in: 100...2000,
                        step: 25
                    )
                    
                    Stepper(
                        "Distance Goal: \(String(format: "%.1f", distanceGoal)) mi",
                        value: $distanceGoal,
                        in: 0.5...50,
                        step: 0.5
                    )
                }
                
                Section {
                    Button("Request Health Authorization") { }
                    Button("Refresh Data") { }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
// MARK: - PROGRESS RING
struct ProgressRingView: View {
    
    var progress: Double
    var steps: Int
    
    var body: some View {
        ZStack {
            Circle().stroke(lineWidth: 16).opacity(0.2)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.orange, style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text("\(steps)")
                .font(.title)
                .bold()
        }
        .frame(width: 200, height: 200)
    }
}
// MARK: - STAT CARD
struct StatCard: View {
    var title: String
    var value: String
    var unit: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
            Text(value)
                .font(.title2)
                .bold()
            Text(unit)
                .font(.caption2)
        }
        .frame(width: 140, height: 90)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
    }
}
// MARK: - MINI BAR CHART ✅ FIXED Date & day errors
struct BarMiniChart: View {
    var weekly: [DayStep]
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(weekly) { day in
                    let maxSteps = weekly.map { $0.steps }.max() ?? 1
                    let height = CGFloat(day.steps) / CGFloat(maxSteps) * geo.size.height
                    
                    VStack {
                        Rectangle()
                            .frame(height: height)
                            .cornerRadius(4)
                        
                        Text(day.label)
                            .font(.caption2)
                    }
                }
            }
        }
    }
}
// MARK: - MODEL ✅ FIXED Date error
struct DayStep: Identifiable {
    let id = UUID()
    let label: String
    let steps: Int
}
// MARK: - SAMPLE WEEK DATA ✅ FIXED
let sampleWeek: [DayStep] = [
    DayStep(label: "Mon", steps: 3000),
    DayStep(label: "Tue", steps: 4500),
    DayStep(label: "Wed", steps: 7200),
    DayStep(label: "Thu", steps: 10000),
    DayStep(label: "Fri", steps: 8500),
    DayStep(label: "Sat", steps: 6000),
    DayStep(label: "Sun", steps: 7200)
]
// MARK: - ✅✅✅ PREVIEW (FIXED & REQUIRED)
#Preview {
    TaskView()
}


