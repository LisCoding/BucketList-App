//
//  cancelButtonProtocol.swift
//  bucketListApp
//
//  Created by Liseth Cardozo Sejas on 9/12/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import Foundation
import UIKit

protocol CancelButtonDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
}
