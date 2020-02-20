//
//  header.swift
//  AlamoFireBasic
//
//  Created by Twnibit_Raihan on 20/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit
protocol CustomHeaderDelegate: class {
    func customHeader(_ customHeader: header, didTapButtonInSection section: Int)
}
class header: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel: UILabel!
    static let reuseIdentifier = "header"
     weak var delegate: CustomHeaderDelegate?
    var sectionNumber: Int!  // you don't have to do this, but it can be useful to have reference back to the section number so that when you tap on a button, you know which section you came from; obviously this is problematic if you insert/delete sections after the table is loaded; always reload in that case
    
}
