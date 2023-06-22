//
//  AppliedJobAlertVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 03/04/23.
//

import UIKit

class AppliedJobAlertVC: UIViewController {

    
    @IBOutlet weak var alertBGView: UIView!
    
    @IBOutlet weak var appliedJobImageView: UIImageView!
    
    
    @IBOutlet weak var youHaveAppliedJobLabel: UILabel!
    
    
    
    var isFromSaveJob = false
    @IBOutlet weak var jobSavBGView: UIView!
    @IBOutlet weak var jobSaveAlertBGView: UIView!
    @IBOutlet weak var jobSaveAlertImageView: UIImageView!
    @IBOutlet weak var jobSaveLabel: UILabel!
    @IBOutlet weak var greatLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
   }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .black.withAlphaComponent(0.40)
        if self.isFromSaveJob{
            self.jobSavBGView.isHidden = false
            
            self.alertBGView.isHidden = true
            self.appliedJobImageView.isHidden = true
            self.youHaveAppliedJobLabel.isHidden = true
        }else{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.dismiss(animated: true, completion: nil)
            }
            
            self.alertBGView.isHidden = false
            self.appliedJobImageView.isHidden = false
            self.youHaveAppliedJobLabel.isHidden = false
            
            self.jobSavBGView.isHidden = true
        }
     }
    
    func setUI(){
        
        
        self.alertBGView.addRadiusAndBGColour(25, GoodWorkAppColor.appOffPink)
        
        self.appliedJobImageView.image = UIImage(named: "dialog")
        
//        self.youHaveAppliedJobLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.jobSaveAlertBGView.addRadiusAndBGColour(10, GoodWorkAppColor.appOffPink)
        self.jobSaveAlertImageView.image = UIImage(named: "saveJobBigBg")
        
        
        self.greatLabel.textAlignment = .center
        self.greatLabel.addTitleColorAndFont(title: "Great!", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appBlack)
        
        self.jobSaveLabel.textAlignment = .center
        self.jobSaveLabel.addTitleColorAndFont(title: "This job has been saved.", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appBlack)
        
        self.okButton.addRadiusBGColorTitleColorFont(title: "OK", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 14, radius: (self.okButton.frame.height / 2), bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appOffWhite)
        self.buttonActions()
    }
    
    
 
}
//MARK:- Button Actions
extension AppliedJobAlertVC {
    
    func buttonActions(){
        self.okButton.addTarget(self, action: #selector(self.okButtonPressed(_:)), for: .touchUpInside)
    }
 
    @IBAction func okButtonPressed(_ sender: UIButton){
        print("okButtonPressed")
        self.dismiss(animated: true, completion: nil)
    }
}
