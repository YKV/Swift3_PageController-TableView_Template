//
//  MenuModel.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-16.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation

open class MenuModel {
    
    open class func sectionsCount() -> Int { return 3}
    
    open class func sections() -> Dictionary<String, Any> {
        return ["Default" : ["", "", ""],
                "Preferences" : ["", "", ""],
                "Other" : ["", "", ""]]
    }
}
