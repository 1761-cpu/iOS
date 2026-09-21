import SwiftUI

struct ContentView: View {
    let studentName: String = "Võ Châu Anh"
    let studentID: String = "SESEIU24001"
    var gpa: Double = 2.0
    let isActive: String = "Active"
    
    var body: some View {
        ZStack {
            Image("bg 2")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(
                                AngularGradient(
                                    colors: [.blue, .purple, .indigo, .blue],
                                    center: .center
                                )
                            )
                            .frame(width: 84, height: 84)
                        
                        Image("ava")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                            .accessibilityLabel("Profile picture of \(studentName)")
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(studentName)
                                    .font(.headline)
                                    .bold()
                                
                                Spacer()
                                
                                StatusBadge(text: isActive)
                            }
                            
                            Text("Student ID: \(studentID)")
                                .font(.subheadline)
                                .italic()
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 4) {
                                Image(systemName: "chart.bar.fill")
                                    .foregroundColor(.blue)
                                    .font(.caption)
                                
                                Text("GPA: \(gpa, specifier: "%.1f")")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Button(action: {}) {
                        Text("View Details")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.blue.opacity(0.9))
                            .cornerRadius(12)
                    }
                    .padding(.top, 5)
                }
                .padding(20)
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(18)
       }
    }
}

struct StatusBadge: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .bold()
            .foregroundColor(.green)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.green.opacity(0.2))
            .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
