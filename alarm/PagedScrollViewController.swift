//
//  PagedScrollViewController.swift
//  alarm
//
//  Created by Yevhen Kim on 2016-11-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

public struct PageControlOptions {

    public struct Indicator {
        
        public struct Color {
            public static let Tint = UIColor.white.withAlphaComponent(0.3)
            public static let CurrentTint = UIColor.white
        }
        
        public struct Size {
            public static let Width = CGFloat(60.0)
            public static let Height = CGFloat(30.0)
        }
        
        public struct Padding {
            public static let Vertical = CGFloat(15.0)
        }
    }
}

public protocol PagedScrollViewControllerDelegate {
    func scrollViewDidScroll()
    func scrollViewDidScrollToPage(_ page: Int)
}

open class PagedScrollViewController: UIViewController, UIScrollViewDelegate {
    var delegate: PagedScrollViewControllerDelegate?
    
    open var pages: [UIView] = [UIView]()
    open let scrollView: UIScrollView = UIScrollView()
    open let pageControl: UIPageControl = UIPageControl()
    
    //: mark - viewDidLoad
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        prepareScrollView()
        preparePageControl()
    }
    
    //: mark - viewDidLayoutSubviews
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutScrollView()
        layoutPages()
        layoutPageControl()
    }
    
    //: mark - prepareScrollView
    
    fileprivate func prepareScrollView() {
        scrollView.backgroundColor = UIColor.clear
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(self.scrollView)
    }
    
    //: mark - preparePageControl
    
    fileprivate func preparePageControl() {
        pageControl.currentPage = 0
        view.addSubview(self.pageControl)
    }
    
    //: mark - layoutScrollView
    
    fileprivate func layoutScrollView() {
        if scrollView.frame != CGRect.zero {
            return
        }
        scrollView.frame = view.bounds
    }
    
    //: mark - layoutPageControl
    
    fileprivate func layoutPageControl() {
        let width = PageControlOptions.Indicator.Size.Width
        let height = PageControlOptions.Indicator.Size.Height
        pageControl.frame = CGRect(x: ((view.bounds.size.width/2) - width/2), y: view.bounds.maxY - 40, width: width, height: height)
    }
    
    //: mark - layoutPages
    
    fileprivate func layoutPages() {
        let scrollWidth = scrollView.bounds.size.width
        let scrollHeight = scrollView.bounds.size.height // FIXME: Make this 64 dynamic based on if this view is in a scrollview or not
        for i in 0 ..< pages.count {
            let page = pages[i]
            page.frame = CGRect(x: scrollView.bounds.maxX * CGFloat(i), y: 0, width: scrollWidth, height: scrollHeight)
            scrollView.addSubview(page)
        }
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(pages.count), height: 0)
        pageControl.numberOfPages = pages.count
    }
    
    //: mark - scrollViewDidScroll
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = self.scrollView.bounds.width
        if pageWidth == 0.0 {
            return
        }
        let pageFraction = self.scrollView.contentOffset.x / pageWidth
        pageControl.currentPage = Int(roundf(Float(pageFraction)))
        delegate?.scrollViewDidScroll()
        delegate?.scrollViewDidScrollToPage(pageControl.currentPage)
    }
    
    //: mark - scrollToPage
    
    open func scrollToPage(_ page: Int) {
        let x = UIScreen.main.bounds.width * CGFloat(page)
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}
