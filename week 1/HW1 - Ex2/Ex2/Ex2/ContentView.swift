import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
            
            SubjectsView()
                .tabItem {
                    Label("Subjects", systemImage: "book.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(.blue)
    }
}

struct ProfileView: View {
    let studentName: String = "Võ Châu Anh"
    let studentID: String = "SEIU24001"
    var age: Int = 19
    var gpa: Double = 2.0
    let isStudent: Bool = true
    let motto: String = "~Progress over perfection~"
    
    var body: some View {
        ZStack {
            Image("bg 2")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("ava")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(8)
                    .background(Color.blue.opacity(0.5))
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .zIndex(1)
                    .padding(.bottom, -55)
                    .accessibilityLabel("Profile picture of \(studentName)")
                
                VStack(spacing: 20) {
                    
                    VStack(spacing: 6) {
                        Text(studentName)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                            .padding(.top, 50)
                        
                        Text(motto)
                            .font(.caption)
                            .italic()
                            .foregroundColor(.gray)
                    }
                    
                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            InfoRow(icon: "person.fill", title: "Student ID", value: studentID, iconColor: .blue, bgColor: Color.blue.opacity(0.15))
                            InfoRow(icon: "calendar", title: "Age", value: "\(age)", iconColor: .yellow, bgColor: Color.yellow.opacity(0.15))
                        }
                        
                        HStack(spacing: 12) {
                            InfoRow(icon: "chart.bar.fill", title: "GPA", value: "\(gpa)", iconColor: .green, bgColor: Color.red.opacity(0.15))
                            InfoRow(icon: "checkmark.circle.fill", title: "Student", value: "\(isStudent)", iconColor: .green, valueColor: .green, bgColor: Color.green.opacity(0.15))
                        }
                    }
                    
                    Button(action: {
                    }) {
                        Text("Edit Profile")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.9))
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                    
                }
                .padding(20)
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .shadow(radius: 10)
            }
            .padding(16)
        }
    }
}

struct SubjectsView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "book.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.blue)
                
                Text("Subjects")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .bold()
                    .foregroundColor(.blue)
                
                Text("See your list of subjects here.")
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.blue)
                
                Text("Settings")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .bold()
                    .foregroundColor(.blue)
                
                Text("Your settings available here.")
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }
}

struct InfoRow: View {
    let icon: String
    let title: String
    let value: String
    let iconColor: Color
    var valueColor: Color = .black
    var bgColor: Color = .black
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .frame(width: 20)
                .accessibilityLabel(title)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(valueColor)
            }
            Spacer()
        }
        .padding(10)
        .background(bgColor)
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
