//
//  HelpAndSupportRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 25/04/23.
//

import UIKit

class HelpAndSupportRCVC: BaseVC {
    
    static let storyBoardIdentifier = "HelpAndSupportRCVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var subjectTypeLabel: UILabel!
    @IBOutlet weak var dropDownImageView: UIImageView!
    
    @IBOutlet weak var subjectBGView: UIView!
    @IBOutlet weak var subjectShadowView: UIView!
  
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var issueDescriptionTextView: UITextView!
    @IBOutlet weak var issueBGView: UIView!
    @IBOutlet weak var issueShadowView: UIView!
    
    @IBOutlet weak var sendNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUPUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "Help & Support", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.subjectTypeLabel.addTitleColorAndFont(title: "Login", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        
        
        self.backButtonImageview.image = UIImage(named: "Arrow")
        
        
        self.dropDownImageView.image = UIImage(named: "dropArrow")
        
        self.subjectLabel.addTitleColorAndFont(title: "Subject", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.subjectBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.subjectShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.issueLabel.addTitleColorAndFont(title: "Issue", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.issueBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.issueShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.sendNowButton.addRadiusBGColorTitleColorFont(title: "Send Now", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 16, radius: 28, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appWhite)
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension HelpAndSupportRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.sendNowButton.addTarget(self, action: #selector(self.sendNowButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendNowButtonPressed(_ sender: UIButton){
        print("sendNowButtonPressed")
        
        if self.issueDescriptionTextView.text.isEmpty {
            self.notificationBanner(AlertMassage.helpIssue.rawValue)
            return
        }else{
            self.helpAndSupportAPI()
        }
    }
}

extension HelpAndSupportRCVC {
    
    func helpAndSupportAPI(){
        
        var mdl = HelpSupportRequest()
        mdl.user_id  = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.subject = 418
        mdl.issue = self.issueDescriptionTextView.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getHelpSupportAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                self.stopLoading()
                if response["api_status"] as? String ?? "" == "1" {
                    self.navigationController?.popViewController(animated: true)
                }else{
                    print("False")
                }
                
                self.notificationBanner(response["message"] as? String ?? "")
            }
        }
    }
}
