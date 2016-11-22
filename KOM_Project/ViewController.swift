//
//  ViewController.swift
//  KOM_Project
//
//  Created by GuoGongbin on 11/22/16.
//  Copyright © 2016 GuoGongbin. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var task1 = Task(summary: "this is task1 summary", location: CLLocationCoordinate2D(latitude: 49.8764, longitude: 8.6572), priority: 1)
    
    var task2 = Task(summary: "this is task2 summary", location: CLLocationCoordinate2D(latitude: 49.875452, longitude: 8.656621), priority: 2)
    var task3 = Task(summary: "this is task3 summary", location: CLLocationCoordinate2D(latitude: 49.874796, longitude:8.656234), priority: 3)
    
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        tasks = [task1, task2, task3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == journalEntrySegueIdentifier {
     if let journalEntryViewController = segue.destination as? JournalEntryViewController,
     let cell = sender as? UITableViewCell,
     let indexPath = self.tableView.indexPath(for: cell),
     let entry = journal.entry(indexPath.row) {
     journalEntryViewController.journalEntry = entry
     }
     } else if segue.identifier == newJournalEntrySegueIdentifier {
     if let newJournalEntryViewController = segue.destination as? NewJournalEntryViewController {
     newJournalEntryViewController.journal = journal
     }
     }
     }
 
 */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskDescription", let taskDescriptionViewController = segue.destination as? TaskDescriptionViewController {
//            print("ShowTaskDescription")
            let cell = sender as? UITableViewCell
            let indexPath = self.tableView.indexPath(for: cell!)
            let task = tasks[indexPath!.row]
            taskDescriptionViewController.task = task
        }
    }

}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        
        // Configure the cell...
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.summary
        cell.detailTextLabel?.text =  "\(task.priority)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let selectedTask = tasks[indexPath.row]
        
//        prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
        
    }
    
}


