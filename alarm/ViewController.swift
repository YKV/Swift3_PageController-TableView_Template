//
//  ViewController.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pagedScrollViewController = PagedScrollViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        
        view1.backgroundColor = UIColor.purple
        view2.backgroundColor = UIColor.yellow
        view3.backgroundColor = UIColor.blue
        
        pagedScrollViewController.pages = [ view1, view2, view3]
        displayContentController(pagedScrollViewController, frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 300))
        displayContentController(MenuViewController(), frame: CGRect(x: 0, y: pagedScrollViewController.view.bounds.maxY, width: view.bounds.size.width, height: view.bounds.size.height - pagedScrollViewController.view.bounds.size.height))
    }



}


extension UIViewController {
    
    //: mark - displayContentController
    //@param content view controller to be displayed as child
    
    func displayContentController(_ content: UIViewController, frame: CGRect?) {
        addChildViewController(content)
        content.view.frame = frame == nil ? view.bounds : frame!
        view.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
    //: mark - hideContentController
    //@param content view controller to be removed as child
    
    func hideContentController(_ content: UIViewController) {
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
}
