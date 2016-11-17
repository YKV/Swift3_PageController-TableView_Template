//
//  MenuViewController.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

open class MenuViewController: UIViewController {
    
    open lazy var tableView: UITableView = UITableView()
    let stylesheet: Stylesheet = Stylesheet.sharedInstance
    open var tableViewHeaderView: DefaultTableViewHeader?
    
    //: mark - viewDidLoad
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareTableView()
        prepareTableViewHeader()
    }
    
    //: mark - viewDidLayoutSubviews
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutTableView()
        layoutTableViewHeader()
    }
}
