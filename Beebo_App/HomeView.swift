import SwiftUI

struct HomeView: View {
    @State private var exp = 0.0
    @State private var levelCap = 20.0
    @State private var userLevel = 1
    @State private var ranking = 1
    
    private var progressValue: Double {
        exp / levelCap
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: -30) {
                    
                    
                    ProgressView("Task Progress", value: progressValue, total: 1.0)
                        .padding()
                    
                    HStack {
                        Text("\(Int(exp))/\(Int(levelCap))")
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
                        if exp < levelCap {
                            exp += 1.0
                        } else {
                            exp = 0.0
                        }
                    }
                    .padding()
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
                                        .resizable()
                                        .frame(width: 60)
                                }
                                    .foregroundColor(.white)
                                    .padding()
                            )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray)
                            .frame(width:140, height: 140)
                            .overlay(
                                VStack {
                                    Text("Ranking")
                                        .font(.headline)
                                    Text("Bronze")
                                        .font(.subheadline)
                                    if ranking == 1 {
                                        Image("bronze")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        
                                    } else if ranking == 2 {
                                        Image("silver")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    } else if ranking == 3 {
                                        Image("gold")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    } else if ranking == 4 {
                                        Image("diamond")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                    
                                }
                                    .foregroundColor(.white)
                                    .padding()
                            )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray)
                            .frame(width:140, height: 140)
                            .overlay(
                                VStack {
                                    Text("Task Completed ")
                                        .font(.headline)
                                    Text("Work in progres :(")
                                        .font(.subheadline)
                                }
                                    .foregroundColor(.white)
                                    .padding()
                            )
                    }
                }
                Text("Your Room")
                    .font(.largeTitle)
                    .bold()
                ZStack {
                    Image("room")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity, height: .infinity)
                    Image("avatar")
                        .resizable()
                        .frame( width:150, height:300)
                }
            }
        }
        
    }
}

#Preview{
    HomeView()
}
