//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Carlos Camacho on 2020-05-15.
//  Copyright © 2020 Carlos Camacho. All rights reserved.
//

import UIKit
protocol ChangeButton {
    func changeButton(checked: Bool, index: Int)
}


class TaskCell: UITableViewCell {

   
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var TaskNameLabel: UILabel!
    
    @IBAction func checkBoxClicked(_ sender: Any) {
        if tasks![indexP!].checked{
            delegate?.changeButton(checked: false, index: indexP!)
        }else{
            delegate?.changeButton(checked: true, index: indexP!)
        }
        
    }
    
    
    var delegate: ChangeButton?
    var indexP: Int?
    var tasks: [Task]?
}
