import SwiftUI

struct TaskRowView: View {
   @Bindable var task: Task
   @Environment(\.modelContext) private var context
    var body: some View {
        HStack(alignment: .top, spacing: 15){
            Circle()
                .fill(.indigo)
            .frame(width: 10, height: 10)
            .padding(4)
            .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
            .overlay {
                Circle()
                    .foregroundStyle(.clear)
                    .contentShape(.circle)
                    .frame(width: 50, height: 50)
             
                    .onTapGesture {
                        withAnimation(.snappy){
                            task.isCompleted.toggle()
                        }
                    }
            }

            VStack(alignment: .leading, spacing: 8, content: {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)

                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)

            })
            .padding(15)
            .hSpacing(.leading)
            .background(task.tint, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .offset(y: -8)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .contextMenu {
                Button(role: .destructive, "Delete Task") {
                    context.delete(object: task)
                    try? context.save()
                }
            }
        }
        .hSpacing(.leading)
    }

    var indicatorColor: Color {
        if task.isCompleted {
            return .green
        }

        return task.creationDate.isSameHour ? .indigo : (task.creationDate.isPast ? .red : .black)
    }
}

#Preview {
    ContentView()
}
