//
//  MenuViewControllerDataSource.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-16.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

extension MenuViewController: UITableViewDataSource {
    
    //: mark - numberOFSectionsInTableView
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return MenuModel.sectionsCount()
    }
    
    //: mark numberOfRowsInSection
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var sections = MenuModel.sections()
        let key = Array(sections.keys)[section]
        let section = sections[key] as! [String]
        return section.count
    }
    
    //: mark - cellForRowAtIndexPath
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DefaultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DefaultTableViewCell
        return cell
    }
    
    //: mark - heightForHeaderInSection
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //: mark - titleForHeaderInSection
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Space"
    }
}

