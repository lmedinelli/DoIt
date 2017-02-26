//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Luis Medinelli on 2/26/17.
//  Copyright © 2017 iBeacon Solutions. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task : Task? = nil
    //var previousVC = TasksViewController()
    

    @IBOutlet weak var taskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        }else{
            taskLabel.text = task!.name!
        }

        
    }

    @IBAction func completeTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //previousVC.tasks.remove(at: previousVC.selectedTask)
        //previousVC.tableView.reloadData() // used to reload data into tableview
        navigationController!.popViewController(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
