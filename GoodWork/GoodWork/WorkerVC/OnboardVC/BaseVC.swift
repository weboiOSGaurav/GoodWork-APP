//
//  BaseVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/03/23.
//

import UIKit
import NotificationBannerSwift
import SwiftyAttributes
import SwiftLoader
import SDWebImage


class BaseVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 120
        config.spinnerColor = GoodWorkAppColor.appLightPink
        config.foregroundColor = GoodWorkAppColor.appDarkPurple
        config.foregroundAlpha = 0.5
        SwiftLoader.setConfig(config)
        // Do any additional setup after loading the view.
    }
    
    func notificationBanner(_ title : String){
        let banner = NotificationBanner(title: title, subtitle: "", style: .warning)
        
        banner.show()
    }
    
    func startLoading(){
        SwiftLoader.show(title: "Loading...", animated: true)
    }
    
    func stopLoading(){
        SwiftLoader.hide()
    }
    
    func appliedJobAlertView(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppliedJobAlertVC") as! AppliedJobAlertVC
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    func saveJobAlertView(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppliedJobAlertVC") as! AppliedJobAlertVC
        vc.isFromSaveJob = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension  BaseVC{
    
    func updateProfileProgress() -> Float{
        var progressCount = Float()
        
        switch  appDelegate.nurseProfile?.data?.profile_completion ?? 0{
        case 1:
            progressCount = 0.16
        case 2:
            progressCount = 0.33
        case 3:
            progressCount = 0.5
        case 4:
            progressCount = 0.66
        case 5:
            progressCount = 0.83
        case 6:
            progressCount = 1
        default:
            progressCount = 0
        }
        
        return progressCount
    }
}
