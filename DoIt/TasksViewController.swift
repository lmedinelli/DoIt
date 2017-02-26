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
    //var selectedTask = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvCell = UITableViewCell()
        if tasks[indexPath.row].important {
            tvCell.textLabel?.text = "❗️" + tasks[indexPath.row].name!
        }else{
            tvCell.textLabel?.text = tasks[indexPath.row].name
        }
        
        return tvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "selectTaskSegue", sender: tasks[indexPath.row])
    }
    

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as [Task]
            print(tasks)
        }catch{
            print("error ")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
        if segue.identifier == "selectTaskSegue"{
            
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

