//
//  AccountInfoRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 24/04/23.
//

import UIKit

class AccountInfoRCVC: BaseVC {
    
    static let storyBoardIdentifier = "AccountInfoRCVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var empoloyerTitleLabel: UILabel!
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var nameShadowView: UIView!
    @IBOutlet weak var nameBgView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var emailShadowView: UIView!
    @IBOutlet weak var emailBgView: UIView!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var mobileTitleLabel: UILabel!
    @IBOutlet weak var mobileShadowView: UIView!
    @IBOutlet weak var mobileBgView: UIView!
    @IBOutlet weak var mobileLabel: UILabel!
    
    
    var accountInfo : AccountInfoRC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userNameLabel.isUserInteractionEnabled = false
        self.userEmailLabel.isUserInteractionEnabled = false
        self.mobileLabel.isUserInteractionEnabled = false
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.accountInfoAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "Arrow")
        
        self.empoloyerTitleLabel.addTitleColorAndFont(title: "Account Info", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.nameTitleLabel.addTitleColorAndFont(title: "Name", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.nameBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 10)
        self.nameShadowView.addRadiusAndBGColour(10, GoodWorkAppColor.appArsenic)
        self.userNameLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        
        self.emailTitleLabel.addTitleColorAndFont(title: "Email id", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.emailBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 10)
        self.emailShadowView.addRadiusAndBGColour(10, GoodWorkAppColor.appArsenic)
        self.userEmailLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.mobileTitleLabel.addTitleColorAndFont(title: "Mobile Number", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.mobileBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 10)
        self.mobileShadowView.addRadiusAndBGColour(10, GoodWorkAppColor.appArsenic)
        self.mobileLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.buttonActions()
    }
    
    func updateUserInfo(){
        
        self.userNameLabel.text = "\(self.accountInfo?.data?.first_name ?? "") \(self.accountInfo?.data?.last_name ?? "")"
        self.userEmailLabel.text = "\(self.accountInfo?.data?.email ?? "")"
        self.mobileLabel.text = "\(self.accountInfo?.data?.mobile ?? "")"
        
    }
}

//MARK:- Button Actions
extension AccountInfoRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}

extension AccountInfoRCVC {
    
    func accountInfoAPI(){
        
        var mdl = AccountInfoRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        print("mdl: \(mdl)")
         
        self.startLoading()
        
        LoginDataManager.shared.accountInfoRequestRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                     
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let accountInfoResp = try JSONDecoder().decode(AccountInfoRC.self, from: jsonData)
                        
                        self.accountInfo = accountInfoResp
                        
                        print("Do self.accountInfo: \(self.accountInfo)")
                        
                        if self.accountInfo?.api_status == "1"{
                            print("success")
                            self.updateUserInfo()
                        }else{
                            print("falsee")
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                    }catch{
                        print("catch")
                        
                        self.notificationBanner(response["message"] as? String ?? "")
                    }
                    
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                self.stopLoading()
            }
        }
    }
}
