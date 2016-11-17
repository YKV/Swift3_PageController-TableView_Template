//
//  DefaultTableViewHeaderView.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

open class DefaultTableViewHeader: UIView {
    
    open lazy var defaultLabel: UILabel = UILabel()
    let stylesheet: Stylesheet = Stylesheet.sharedInstance
    
    //: mark required initWithCoder
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    //: mark - init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareDefaultLabel()
    }
    
    //: mark - layoutSubviews
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutDefaultLabel()
    }
    
    
    //: mark - prepareDefaultLabel
    
    open func prepareDefaultLabel() {
        defaultLabel.font = stylesheet.fontSmall
        defaultLabel.text = "space"
        defaultLabel.textColor = stylesheet.blackColor
        defaultLabel.textAlignment = .center
        addSubview(defaultLabel)
    }
    
    //: mark - layoutDefaultLabel
    
    open func layoutDefaultLabel() {
        
    }
}
