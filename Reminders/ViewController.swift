//
//  ViewController.swift
//  Reminders
//
//  Created by Abhinav Tirath on 9/18/18.
//  Copyright © 2018 Abhinav Tirath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var reminderTable: UITableView!
    var reminders = [Reminder]()
    
    
    override func viewDidLoad() {
        reminderTable.dataSource = self
        reminderTable.delegate = self
        
        reminders.append(Reminder(text: "Clean room", isCompleted: false))
        reminders.append(Reminder(text: "Eat Dinner", isCompleted: true))
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Add Reminder
    
    @IBAction func addReminder(_ sender: Any) {
        let alert = UIAlertController(title: "New Reminder", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Reminder"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            guard let reminderText = alert.textFields?.first?.text,
                !reminderText.isEmpty else {
                    return
            }
            
            self.reminders.append(Reminder(text: reminderText, isCompleted: false))
            self.reminderTable.reloadData()
        }))
        
        present(alert, animated: true)
    }
    

}

  //MARK: Table View Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminder = reminders[indexPath.item]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = reminder.text
        
        if reminder.isCompleted {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reminders[indexPath.item].toggle()
        reminderTable.reloadData()
    }
    
    
}
