//
//  Reminder.swift
//  Reminders
//
//  Created by Abhinav Tirath on 9/18/18.
//  Copyright © 2018 Abhinav Tirath. All rights reserved.
//

struct Reminder {
    
    let text: String
    var isCompleted: Bool
    
    mutating func toggle() {
        isCompleted = !isCompleted
    }
}
