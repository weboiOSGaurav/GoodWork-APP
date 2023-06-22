//
//  SignUpVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/03/23.
//

import UIKit
import SwiftyAttributes
import NotificationBannerSwift

class SignUpVC: BaseVC {
    
    static let storyBoardIdentifier = "SignUpVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var rightSideBottomImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInTitleLabel: UILabel!
    
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v1shadow: UIView!
    
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v2shadow: UIView!
    
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v3shadow: UIView!
    
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v4shadow: UIView!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    
    @IBOutlet weak var alreadyHaveAccountLabel: UILabel!
    @IBOutlet weak var signInUpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.mobileNumberTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let sign = "Worker".withAttributes([
            .textColor(GoodWorkAppColor.appLightPink),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 34))
        ])
        
        let up = " Signup".withAttributes([
            .textColor(GoodWorkAppColor.appColour),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 34))
        ])
        
        let signUP = (sign + up)
        
        self.logInTitleLabel.attributedText = signUP
        
        self.firstNameTextField.text = ""
        self.lastNameField.text = ""
        self.emailTextField.text = ""
        self.mobileNumberTextField.text = ""
    }
    
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.mobileNumberTextField.delegate = self
        self.rightSideTopImageView.image = UIImage(named: "roundLineImage")
        self.backButtonImageView.image = UIImage(named: "backRC")
        self.rightSideBottomImageView.image = UIImage(named: "bottomLeftRoundImg")
        
        self.v1.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.v1shadow.shadow(14)
        
        self.v2.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.v2shadow.shadow(14)
        
        self.v3.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.v3shadow.shadow(14)
        
        self.v4.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.v4shadow.shadow(14)
        
        self.alreadyHaveAccountLabel.addTitleColorAndFont(title: "Already have an account?", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appColour)
        
        self.signInUpLabel.addTitleColorAndFont(title: "Sign in", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.signUpButton.addRadiusBGColorTitleColorFont(title: "Sign Up", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 16, radius: 28, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appWhite)
        
        self.firstNameTextField.updateCursorColour()
        self.lastNameField.updateCursorColour()
        self.emailTextField.updateCursorColour()
        self.mobileNumberTextField.updateCursorColour()
        
        self.buttonActions()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("textFieldDidChange")
        
        
        if textField == self.mobileNumberTextField {
            
            
            self.mobileNumberTextField.text = self.mobileNumberTextField.text!.applyPatternOnNumbers(pattern: "+# (###) ###-####", replacementCharacter: "#")
            
        }
    }
}

extension SignUpVC {
    
    func validate() -> Bool{
        
        if self.firstNameTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.firstNameBlank.rawValue)
            return false
        }else if self.lastNameField.text!.isEmpty{
            self.notificationBanner(AlertMassage.lastNameBlank.rawValue)
            return false
        }else if self.emailTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.emailAddressBlank.rawValue)
            return false
        } else if !self.emailTextField.text!.isValidEmail(){
            self.notificationBanner(AlertMassage.emailAddressWrong.rawValue)
            return false
        }else if self.mobileNumberTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.phoneNumberBlank.rawValue)
            return false
        }else{
            return true
        }
    }
}

//MARK:- Button Actions
extension SignUpVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(self.signUpButtonPressed(_:)), for: .touchUpInside)
        self.loginButton.addTarget(self, action: #selector(self.loginButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton){
        print("signUpButtonPressed")
        if self.validate(){
            self.signUpAPI()
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton){
        print("loginButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}

extension SignUpVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.mobileNumberTextField == textField{
            let maxLength = 17
            let currentString = (textField.text ?? "") as NSString
            let newString = currentString.replacingCharacters(in: range, with: string)
            
            return newString.count <= maxLength
        }
        
        return  true
    }
}

extension SignUpVC {
    
    func signUpAPI(){
        
        var mdl = SignUpRequest()
        mdl.first_name = self.firstNameTextField.text ?? ""
        mdl.last_name = self.lastNameField.text ?? ""
        mdl.email = self.emailTextField.text ?? ""
        mdl.mobile = self.mobileNumberTextField.text ?? ""
        
        self.startLoading()
        
        LoginDataManager.shared.registerNewUser(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                print("dic: \(dict)")
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    let dicRes = response["data"] as? [String : Any] ??  [String : Any]()
                    
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: VerificationVC.storyBoardIdentifier) as? VerificationVC else { return }
                    vc.registerMobileNo = self.emailTextField.text ?? ""
                    
                    print(dicRes["id"] as? String ?? "")
                   
                    vc.isFromSignUP = true
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                   // self.notificationBanner(response["message"] as? String ?? "")
                }else{
                     self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.stopLoading()
            }
        }
    }
}
