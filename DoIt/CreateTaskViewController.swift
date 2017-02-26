//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Luis Medinelli on 2/24/17.
//  Copyright © 2017 iBeacon Solutions. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameText: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        // create a Task from the outlet information
        
        let task = Task()
        task.name = taskNameText.text!
        task.important = importantSwitch.isOn
        
        // add a new task to array in previous viewcontroller
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData() // used to reload data into tableview
        navigationController!.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
