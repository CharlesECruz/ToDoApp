//
//  ViewController.swift
//  ToDoApp
//
//  Created by Carlos Camacho on 2020-05-15.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
    func changeButton(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableViewOutlet.reloadData()
    }    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    

    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks.append(Task(name: "Do my homework"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)as! TaskCell
        cell.TaskNameLabel.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked{
            cell.checkBoxButton.setBackgroundImage(UIImage(named: "checkBoxFILLED") , for: .normal)
        }else{
            cell.checkBoxButton.setBackgroundImage(UIImage(named: "checkBoxOUTLINE"), for: .normal)
        }
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TaskController
        vc.delegate = self
    }
    
    
    func addTask(name: String) {
        tasks.append(Task(name: name))
        tableViewOutlet.reloadData()
    }
    
    @IBAction func clickDeleteItems(_ sender: UIBarButtonItem) {
        var index = 0
        
        for task in tasks{
            print(task.checked)
            if !task.checked{
                tasks.remove(at: index)
            }else{
                index += 1
            }
        }
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}


class Task {
    var name = ""
    var checked = false
    
    convenience init (name: String){
        self.init()
        self.name = name
    }
}
