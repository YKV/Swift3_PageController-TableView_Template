//
//  MenuViewControllerConfiguration.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

public extension MenuViewController {
    
    //: mark - prepareView
    
    public func prepareView() {
        view.backgroundColor = stylesheet.darkgrayColor
    }
    
    //:mark -  prepareTableView
    public func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    //: mark - preparedTableViewHeader
    
    public func prepareTableViewHeader() {
        tableView.tableHeaderView = tableViewHeaderView
    }
    
    //: mark - layoutTableView
    
    public func layoutTableView() {
        tableView.frame = view.bounds
    }
    
    //: mark - layoutTableViewHeader
    
    public func layoutTableViewHeader() {
        
    }
}
