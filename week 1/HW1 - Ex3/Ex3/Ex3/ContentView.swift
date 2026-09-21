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
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "house.fill")
                }
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(.blue)
    }
}

struct TodayView: View {
    let userName: String = "Võ Châu Anh"
    let quote: String = "~Your dreams are worth the discipline of planning~"
    
    @State private var tasks: [Task] = [
        Task(title: "Read chapter 2", category: "Study", isCompleted: false, time: "09:00"),
        Task(title: "Workout", category: "Health", isCompleted: true, time: "17:00"),
        Task(title: "Finish lab report", category: "Work", isCompleted: false, time: "20:00"),
        Task(title: "Update music storage", category: "Personal", isCompleted: false, time: "22:00")
    ]
    
    @State private var newTaskCount: Int = 1
    @State private var categoryIndex: Int = 0 

    var body: some View {
        ZStack {
            Image("bg 2")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ZStack {
                    Color.white.opacity(0.85)
                        .cornerRadius(20)
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 6) {
                            Text("Good Morning,")
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundColor(.gray)
                            
                            Image(systemName: "sun.max.fill")
                                .foregroundColor(.yellow)
                        }
                        
                        Image("ava")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(6)
                            .background(Color.blue.opacity(0.3))
                            .clipShape(Circle())
                            .shadow(radius: 4)
                            .padding(.vertical, 4)
                        
                        Text(userName)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                        
                        Text("\"\(quote)\"")
                            .font(.caption)
                            .italic()
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
                
                HStack(spacing: 12) {
                    HStack(spacing: 12) {
                        Image(systemName: "calendar")
                            .font(.title2)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(getDayOfWeek())
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(getDayNumber())
                                .font(.title2)
                                .bold()
                                .foregroundColor(.blue)
                            Text(getMonthYear())
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(15)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "lightbulb.max.fill")
                            .font(.title3)
                            .foregroundColor(.orange)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("One day or day one.")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("You. Decide.")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.yellow.opacity(0.85))
                    .cornerRadius(15)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                HStack {
                    Text("My Tasks")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.85))
                        .cornerRadius(10)
                    
                    Spacer()
                    
                    Button(action: {
                        addNewTask()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "plus")
                                .font(.caption)
                                .bold()
                            Text("Add Task")
                                .font(.subheadline)
                                .bold()
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.green.opacity(0.95))
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
                
                ScrollView {
                    if tasks.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "checklist")
                                .font(.system(size: 50))
                                .foregroundColor(.gray.opacity(0.5))
                            Text("No tasks yet. Add one!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 50)
                        
                    } else {
                        VStack(spacing: 8) {
                            ForEach(tasks) { task in
                                TaskRow(task: task) {
                                    toggleTask(task)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        deleteTask(task)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 20)   
                    }
                }
            }   
        }     
    }
    
    func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(_ task: Task) {
    tasks.removeAll { $0.id == task.id }
    }

    func addNewTask() {
        newTaskCount += 1
        let categories = ["Study", "Health", "Work", "Personal"]
        let currentCategory = categories[categoryIndex % categories.count]
        categoryIndex += 1
        
        let newTask = Task(
            title: "New Task #\(newTaskCount)",
            category: currentCategory,
            isCompleted: false,
            time: "23:00"
        )
        tasks.append(newTask)
    }
    
    func getDayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: Date())
    }
    
    func getDayNumber() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: Date())
    }
    
    func getMonthYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: Date())
    }
}

struct StatsView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "chart.bar.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .foregroundColor(.blue)
                
                Text("Stats")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                
                Text("Your productivity statistics here.")
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
                    .foregroundColor(.blue)
                
                Text("Your settings available here.")
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }
}

struct TaskRow: View {
    let task: Task
    let onToggle: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                    .font(.title3)
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            
            Image(systemName: getIconForCategory(task.category))
                .font(.title3)
                .foregroundColor(getColorForCategory(task.category))
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .strikethrough(task.isCompleted, color: .gray)
                    .foregroundColor(task.isCompleted ? .gray : .black)
                
                Text(task.category)
                    .font(.caption2)
                    .bold()
                    .foregroundColor(getColorForCategory(task.category))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(getColorForCategory(task.category).opacity(0.15))
                    .cornerRadius(6)
            }
            
            Spacer()
            
            Text(task.time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(12)
        .background(Color.white.opacity(0.9))
        .cornerRadius(12)
    }
    
    func getIconForCategory(_ category: String) -> String {
        switch category {
        case "Study": return "book.fill"
        case "Health": return "figure.run"
        case "Work": return "laptopcomputer"
        case "Personal": return "person.bust.fill"
        default: return "circle.fill"
        }
    }
    
    func getColorForCategory(_ category: String) -> Color {
        switch category {
        case "Study": return .green
        case "Health": return .orange
        case "Work": return .red
        case "Personal": return .blue
        default: return .gray
        }
    }
}

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var category: String
    var isCompleted: Bool
    var time: String
}

#Preview {
    ContentView()
}
