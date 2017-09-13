//
//  ViewController.swift
//  bucketListApp
//
//  Created by Liseth Cardozo Sejas on 9/11/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController , AddItemTableViewControllerDelegate {
    var items = ["go to moon", "Build a robot", "Buy a tesla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        // return an integer that indicates how many rows (cells) to draw
    }
    
    // How should I create each cell?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    
    //to know what cell was touch and add behavior
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
    //click and edit olny when we click the action
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "edit", sender: indexPath)
    }
    
    //remove item from the list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    
  
    //Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "addNewItem" {
            //view where want to go (UINAvigationController -> is the view)
            let navigationController = segue.destination as! UINavigationController
            // now create another variable to set the to view the class has to match the class of other view
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            
        } else if segue.identifier == "edit"  {
            //view where want to go (UINAvigationController -> is the view)
            let navigationController = segue.destination as! UINavigationController
            // now create another variable to set the to view the class has to match the class of other view
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
//        print("Im the hidden controller,  BUT I am responding to the cancel button pressed in the top view controller")
        dismiss(animated: true, completion: nil )
    }

    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath : NSIndexPath?) {
        print("received info from top view \(text)")
        
        if let ip = indexPath {
            items[ip.row] = text
        
        } else {
            items.append(text)
        }
       
        tableView.reloadData()
        dismiss(animated: true, completion: nil )
    }


}

