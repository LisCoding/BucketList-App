//
//  addprotocol.swift
//  bucketListApp
//
//  Created by Liseth Cardozo Sejas on 9/12/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit
protocol AddItemTableViewControllerDelegate: class {
    
    func itemSaved(by controller: AddItemTableViewController, with text:String, at indexPAth: NSIndexPath?)
    
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
