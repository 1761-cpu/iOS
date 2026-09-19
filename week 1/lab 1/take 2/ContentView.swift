import SwiftUI

struct ContentView: View {
    let studentName = "Võ Châu Anh"
    let studentID = "SESEIU24001"
    var age = 19
    var gpa = 2.0
    let isStudent = "true"

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
                
                VStack(spacing: 16) {
                    
                    
                    Text("Student Profile")
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                        .foregroundColor(.blue)
                        .padding(.top, 50)
                        .padding(.bottom, 10)
                    
                    
                    InfoRow(icon: "person.circle", title: "Name", value: studentName, iconColor: .blue)
                    InfoRow(icon: "person.text.rectangle", title: "Student ID", value: studentID, iconColor: .blue)
                    InfoRow(icon: "calendar", title: "Age", value: "\(age)", iconColor: .blue)
                    InfoRow(icon: "chart.bar", title: "GPA", value: "\(gpa)", iconColor: .blue)
                    InfoRow(icon: "checkmark.circle.fill", title: "Student", value: isStudent, iconColor: .green, valueColor: .green)
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


struct InfoRow: View {
    let icon: String
    let title: String
    let value: String
    let iconColor: Color
    var valueColor: Color = .black
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(.gray)
                .font(.body)
                .frame(width: 100, alignment: .leading)
            

            Text(value)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(valueColor)
            
            Spacer()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 17)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
