//
// ProfileView.swift
// Beebo_App
//
// Created by Ethan Nkrumah on 12/16/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Header
                HStack(alignment: .top, spacing: 15) {
                    Image("Beebo_Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Joshua")
                            .font(.title)
                            .bold()
                        Text("@admintheone")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                // Bio Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Bio")
                        .font(.headline)
                        .bold()
                    
                    Text("I am a perfectly normal person with no flaws what-so-ever.")
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // Stats Section
                HStack(spacing: 40) {
                    VStack(spacing: 4) {
                        Text("0")
                            .font(.title2)
                            .bold()
                        Text("Posts")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(spacing: 4) {
                        Text("0")
                            .font(.title2)
                            .bold()
                        Text("Followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(spacing: 4) {
                        Text("0")
                            .font(.title2)
                            .bold()
                        Text("Following")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical)
                
                // Edit Profile Button
                Button(action: {
                    // Edit profile action
                }) {
                    Text("Edit Avatar")
                        .font(.subheadline)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.top)
                
                // Posts Grid or List would go here
                Text("Posts will appear here")
                    .foregroundColor(.gray)
                    .padding()
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationBarTitleDisplayMode(.inline)

        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: HomeSettingsView()) {
                    VStack{
                        Image(systemName: "gear")
                            .foregroundColor(.primary)
                    }
                    
                }
            }
        }
    }
}

struct HomeSettingsView: View {
    var body: some View {
        List {
            Section("Account") {
                NavigationLink("Edit Profile") {
                    Text("Edit Profile View")
                }
                NavigationLink("Privacy") {
                    Text("Privacy Settings")
                }
                NavigationLink("Security") {
                    Text("Security Settings")
                }
            }
            
            Section("Preferences") {
                NavigationLink("Notifications") {
                    Text("Notification Settings")
                }
                NavigationLink("Appearance") {
                    Text("Appearance Settings")
                }
            }
            
            Section {
                Button("Log Out") {
                    // Log out action
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
