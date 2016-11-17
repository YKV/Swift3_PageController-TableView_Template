//
//  Stylesheet.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class Stylesheet {
    
    static let sharedInstance = Stylesheet()
    
    let fontLarge: UIFont = UIFont.systemFont(ofSize: 20, weight: 0.5)
    let fontMedium: UIFont = UIFont.systemFont(ofSize: 16, weight: 0.5)
    let fontSmall: UIFont = UIFont.systemFont(ofSize: 12, weight: 0.5)
    
    let large: CGFloat = 20
    let medium: CGFloat = 16
    let small: CGFloat = 12
    
    let buttonCornerRadius: CGFloat = 10
    
    let whiteColor: UIColor = UIColor.white
    let blackColor: UIColor = UIColor.black
    let yellowColor: UIColor = UIColor.yellow
    let darkgrayColor: UIColor = UIColor(red: 77/255, green: 82/255, blue: 90/255, alpha: 1.0)
    
}
