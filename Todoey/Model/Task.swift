//
//  Task.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 06/10/24.
//

import SwiftUI
import SwiftData

@Model
struct Task : Identifiable {
    var id: UUID
    var taskTitle: String
    var creationDate: Date
    var isCompleted: Bool 
    var tint: String
    
    init(id: UUID = .init(), taskTitle: String, creationDate: Date = .init(), isCompleted: Bool = false, tint: String) {
        self.id = id
        self.taskTitle = taskTitle
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
    }
               
    
    var tintColor: Color {
        switch tint {
        case "TaskColor1": return .blue
        case "TaskColor2": return .green
        case "TaskColor3": return .gray
        case "TaskColor4": return .orange
        case "TaskColor5": return .purple
            
        default: return .black
        }
    }
}



extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
