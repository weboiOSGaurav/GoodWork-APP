//
//  TabBarCV.swift
//  GoodWork
//
//  Created by Gaurav Jani on 29/03/23.
//

import UIKit



class TabBarCV: UITabBarController {
    
    static let storyBoardIdentifier = "TabBarCV"
    
    @IBInspectable var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBarItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 100
        tabBar.frame.origin.y = view.frame.height - 100
        tabBar.layer.cornerRadius = 24
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "homeUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem1.selectedImage = UIImage(named: "homeSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem1.imageInsets = UIEdgeInsets(top: 34, left: 0, bottom: -34, right: 0)

        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "searchUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem2.selectedImage = UIImage(named: "searchSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        myTabBarItem2.imageInsets = UIEdgeInsets(top: 34, left: 0, bottom: -34, right: 0)
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "exploreUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        myTabBarItem3.selectedImage = UIImage(named: "exploreSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        myTabBarItem3.imageInsets = UIEdgeInsets(top: 32, left: 0, bottom: -34, right: 0)

        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "messageUnSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        myTabBarItem4.selectedImage = UIImage(named: "messageSelected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        myTabBarItem4.imageInsets = UIEdgeInsets(top: 32, left: 0, bottom: -34, right: 0)
    }
}



@IBDesignable class TabBarWithCorners: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 15.0
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0))
        
        return path.cgPath
    }
}
