//
//  DefaultTableViewCell.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

public struct DefaultOptions {
    public struct ImageView {
        public struct Padding {
            public static let Vertical = CGFloat(10.0)
            public static let Horizontal = CGFloat(10.0)
        }
    }
    
    public struct Label {
        public struct Padding {
            public static let Vertical = CGFloat(10.0)
            public static let Horizontal = CGFloat(10.0)
        }
    }
}

open class DefaultTableViewCell: UITableViewCell {
    open var defaultImageView: UIImageView = UIImageView()
    open var defaultLabel: UILabel = UILabel()
    let stylesheet: Stylesheet = Stylesheet.sharedInstance
    
    //: mark - required initWithCoder
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //: mark - init
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareDefaultImageView()
        prepareDefaultLabel()
    }
    
    //: mark - layoutSubviews
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutDefaultImageView()
        layoutDefaultLabel()
    }
    
    //: mark - prepareDefaultImageView
    
    open func prepareDefaultImageView() {
        defaultImageView.backgroundColor = stylesheet.yellowColor
        defaultImageView.clipsToBounds = true
        contentView.addSubview(defaultImageView)
    }
    
    //: mark - prepareDefaultLabel
    
    open func prepareDefaultLabel() {
        defaultLabel.font = stylesheet.fontSmall
        defaultLabel.text = "lamp"
        defaultLabel.textColor = stylesheet.blackColor
        defaultLabel.textAlignment = .left
        addSubview(defaultLabel)
    }
    
    //: mark - layoutDefaultImageView
    
    open func layoutDefaultImageView() {
        let x = CGFloat(20.0)
        let y = CGFloat(DefaultOptions.ImageView.Padding.Vertical)
        let w = CGFloat(contentView.bounds.size.height - (DefaultOptions.ImageView.Padding.Vertical * 2))
        let h = w
        defaultImageView.frame = CGRect(x: x, y: y, width: w, height: h)
        
        //FIX ME: make dynamic
        defaultImageView.layer.cornerRadius = w / 2
    }
    
    open func layoutDefaultLabel() {
        let x = defaultImageView.frame.maxX + DefaultOptions.Label.Padding.Horizontal
        let y = (contentView.bounds.size.height / 2) - 15.0
        let w = CGFloat(200.0)
        let h = CGFloat(30.0)
        defaultLabel.frame = CGRect(x: x, y: y, width: w, height: h)
    }
}
