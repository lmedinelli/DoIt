//
//  TasksViewController.swift
//  DoIt
//
//  Created by Luis Medinelli on 2/23/17.
//  Copyright © 2017 iBeacon Solutions. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    var selectedTask = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvCell = UITableViewCell()
        if tasks[indexPath.row].important {
            tvCell.textLabel?.text = "❗️" + tasks[indexPath.row].name
        }else{
            tvCell.textLabel?.text = tasks[indexPath.row].name
        }
        
        return tvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = indexPath.row
        
        performSegue(withIdentifier: "selectTaskSegue", sender: tasks[indexPath.row])
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheesse"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Clean bedroom"
        task3.important = true
        
        return [task1,task2,task3]
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
            
        }else if segue.identifier == "selectTaskSegue"{
            
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

