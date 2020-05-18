//
//  TaskController.swift
//  ToDoApp
//
//  Created by Carlos Camacho on 2020-05-16.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit

protocol AddTask {
    func addTask(name: String)
}


class TaskController: UIViewController {

    var delegate: AddTask?
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddTaskClicked(_ sender: Any) {
        if taskNameOutlet.text != ""{
            delegate?.addTask(name: taskNameOutlet.text!)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
