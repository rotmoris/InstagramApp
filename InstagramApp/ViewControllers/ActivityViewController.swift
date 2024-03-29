//
//  ActivityViewController.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 15/05/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var segmentedControl: CustomSegmentedControl!
  {
        
        didSet {
            
            segmentedControl.delegate = self
            
        }
        
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        
        didSet {
            
            scrollView.delegate = self
            
        }
        
    }
    
    var currentIndex: Int = 0
    
    lazy var slides: [ActivityView] = {
        
        let followingActivityData = FollowingActivityModel()
        
        let followingActivityView = Bundle.main.loadNibNamed("ActivityView", owner: nil, options: nil)?.first as! ActivityView
        
        followingActivityView.activityData = followingActivityData.followingActivity
        
        
        let youActivityData = YouActivityModel()
        
        let youActivityView = Bundle.main.loadNibNamed("ActivityView", owner: nil, options: nil)?.first as! ActivityView
        
        youActivityView.activityData = youActivityData.youActivity
        
        return [followingActivityView, youActivityView]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupSlideScrollView(slides: slides)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    func setupSlideScrollView(slides: [ActivityView]) {
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        scrollView.isPagingEnabled = true
        
        for i in 0..<slides.count {
            
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            
            scrollView.addSubview(slides[i])
            
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        
        segmentedControl.updateSegmentedControlSegs(index: Int(pageIndex))
        
        currentIndex = Int(pageIndex)
        
    }
    
}

extension ActivityViewController: ActivityDelegate {
    
    func scrollTo(index: Int) {
        
        if currentIndex == index {
            
            return
            
        }
        
        let pageWidth: CGFloat = self.scrollView.frame.width
        
        let slideToX = pageWidth * CGFloat(index)
        
        self.scrollView.scrollRectToVisible(CGRect(x: slideToX, y: 0, width: pageWidth, height: self.scrollView.frame.height), animated: true)
        
    }

}
