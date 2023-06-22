//
//  TabBarRCVCViewController.swift
//  GoodWork
//
//  Created by Gaurav Jani on 24/04/23.
//

import UIKit

class TabBarRCVCViewController: UITabBarController {
    
    static let storyBoardIdentifier = "TabBarRCVCViewController"
    
    @IBInspectable var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBarItems()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        self.tabBar.frame.size.height = 100
        self.tabBar.frame.origin.y = view.frame.height - 100
        self.tabBar.layer.cornerRadius = 24
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "HomeRecrUnSelec")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem1.selectedImage = UIImage(named: "HomeRecrSelect")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem1.imageInsets = UIEdgeInsets(top: 34, left: 0, bottom: -34, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "searchUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem2.selectedImage = UIImage(named: "searchSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem2.imageInsets = UIEdgeInsets(top: 32, left: 0, bottom: -34, right: 0)
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "exploreUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem3.selectedImage = UIImage(named: "exploreSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem3.imageInsets = UIEdgeInsets(top: 34, left: 0, bottom: -34, right: 0)
        
        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "OpportunitiesManager")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem4.selectedImage = UIImage(named: "OpportunitiesManagerSelec")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem4.imageInsets = UIEdgeInsets(top: 32, left: 0, bottom: -34, right: 0)
        
        let myTabBarItem5 = (self.tabBar.items?[4])! as UITabBarItem
        myTabBarItem5.image = UIImage(named: "messageUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem5.selectedImage = UIImage(named: "messageSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem5.imageInsets = UIEdgeInsets(top: 32, left: 0, bottom: -34, right: 0)
    }
}
