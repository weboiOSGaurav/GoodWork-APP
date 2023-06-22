//
//  AccountInfoVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit

class AccountInfoVC: BaseVC {
    
    static let storyBoardIdentifier = "AccountInfoVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var firstNameBGView: UIView!
    @IBOutlet weak var firstNameShadowView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameBGView: UIView!
    @IBOutlet weak var lastNameShadowView: UIView!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailBGView: UIView!
    @IBOutlet weak var emailShadowView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneBGView: UIView!
    @IBOutlet weak var phoneShadowView: UIView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var resetinfoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.phoneTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.firstNameTextField.text = appDelegate.nurseProfile?.data?.first_name ?? ""
        self.lastNameTextField.text = appDelegate.nurseProfile?.data?.last_name ?? ""
        self.emailTextField.text = appDelegate.nurseProfile?.data?.email ?? ""
        self.phoneTextField.text = appDelegate.nurseProfile?.data?.mobile ?? ""
     }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "Account Info", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.backButtonImageview.image = UIImage(named: "backButton")
        
        self.firstNameBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.firstNameShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.firstNameTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.firstNameTextField.placeholder = "First name"
        self.firstNameTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.lastNameBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.lastNameShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.lastNameTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.lastNameTextField.placeholder = "Last name"
        self.lastNameTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.emailBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.emailShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.emailTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.emailTextField.placeholder = "Email"
        self.emailTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.phoneBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.phoneShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.phoneTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.phoneTextField.placeholder = "Mobile"
        self.phoneTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.firstNameTextField.tintColor = GoodWorkAppColor.appDarkPurple
        self.lastNameTextField.tintColor = GoodWorkAppColor.appDarkPurple
        self.emailTextField.tintColor = GoodWorkAppColor.appDarkPurple
        self.phoneTextField.tintColor = GoodWorkAppColor.appDarkPurple
        
        self.phoneTextField.delegate = self
        
        self.buttonActions()
    }
    
    func validate() -> Bool{
        if self.firstNameTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.firstNameBlank.rawValue)
            return false
        }else if self.lastNameTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.lastNameBlank.rawValue)
            return false
        }else if self.emailTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.emailAddressBlank.rawValue)
            return false
        }else if !(self.emailTextField.text?.isValidEmail())!{
            self.notificationBanner(AlertMassage.emailAddressWrong.rawValue)
            return false
        }else if self.phoneTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.phoneNumberBlank.rawValue)
            return false
        }else if !self.phoneTextField.text!.isValidPhone(){
            self.notificationBanner(AlertMassage.phoneNumberWrong.rawValue)
            return false
        }else{
           return true
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("textFieldDidChange")
        
        if textField == self.phoneTextField {
            
            self.phoneTextField.text = self.phoneTextField.text!.applyPatternOnNumbers(pattern: "+# (###) ###-####", replacementCharacter: "#")
        }
    }
}

//MARK:- Button Actions
extension AccountInfoVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        
        self.resetinfoButton.addTarget(self, action: #selector(self.resetInfoButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton){
        print("skipButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton){
        print("saveButtonPressed")
        if self.validate(){
            print("self.validate()")
            self.updateAccountInfoAPI()
        }
    }
    
    @IBAction func resetInfoButtonPressed(_ sender: UIButton){
        print("resetInfoButtonPressed")
        
        self.firstNameTextField.text = ""
        self.lastNameTextField.text = ""
        self.emailTextField.text = ""
        self.phoneTextField.text = ""
    }
}

extension AccountInfoVC {
    
    func updateAccountInfoAPI(){
        self.startLoading()
        var mdl = UpdateAccountInfoRequest()
        
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        mdl.first_name = self.firstNameTextField.text ?? ""
        mdl.last_name = self.lastNameTextField.text ?? ""
        mdl.user_name = ""
        mdl.mobile = self.phoneTextField.text ?? ""
        mdl.email = self.emailTextField.text ?? ""
        
        print("mdl: \(mdl)")
        
        LoginDataManager.shared.updateAccountInfo(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    self.navigationController?.popViewController(animated: true)
                    self.notificationBanner(response["message"] as? String ?? "")
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.stopLoading()
            }
        }
    }
}


extension AccountInfoVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.phoneTextField == textField{
            let maxLength = 17
            let currentString = (textField.text ?? "") as NSString
            let newString = currentString.replacingCharacters(in: range, with: string)
            
            return newString.count <= maxLength
        }
        
        return  true
    }
}
