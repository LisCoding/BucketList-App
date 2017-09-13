//
//  MissionTableViewController.swift
//  bucketListApp
//
//  Created by Liseth Cardozo Sejas on 9/12/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class  AddItemTableViewController: UITableViewController {
    
 
    
    @IBOutlet weak var inputLabel: UITextField!
    
    //this get the info of the button that was pressed
    var item : String?
    
    //to avoid append an actually update
    var indexPath : NSIndexPath?
    
    //Declare our delegate variable of type cancelButton Delegate(Protocol)
    weak var delegate: AddItemTableViewControllerDelegate?
   
    @IBAction func cancelButtonWasPressed(_ sender: UIBarButtonItem) {
        print("Canceled")
        
        //call the function cancelButtonPressed from the Protocol
        delegate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func saveButtonWasPressed(_ sender: UIBarButtonItem) {
        let text = inputLabel.text!
        print("SAVED")
        
        //call the function cancelButtonPressed from the Protocol
        delegate?.itemSaved(by: self, with : text, at : indexPath)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputLabel.text = item
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
