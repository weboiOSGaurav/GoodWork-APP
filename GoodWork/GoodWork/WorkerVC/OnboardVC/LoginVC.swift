//
//  LoginVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/03/23.
//

import UIKit
import SwiftyAttributes
import NotificationBannerSwift

class LoginVC: BaseVC {
    
    static let storyBoardIdentifier = "LoginVC"
    
    
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var rightSideBottomImageView: UIImageView!
    @IBOutlet weak var skipNowImageView: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var skipForNowButton: UIButton!
    
    @IBOutlet weak var logInTitleLabel: UILabel!
    
    @IBOutlet weak var logView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    @IBOutlet weak var removeLoginImageView: UIImageView!
    @IBOutlet weak var removeLoginBUtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.titleLbl.text = "WELCOME"
        //        self.titleLbl.font = OneLinkFont.OneLinkFontFont(.MontserratSemiBold, 14)
        //        self.titleLbl.textColor = OneLinkColor.appBlack
        //        self.titleLbl.addCharactersSpacing(spacing: 2, text: "WELCOME")
        
        self.setUPUI()
        
        self.loginTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.removeLoginImageView.isHidden = true
        self.removeLoginBUtton.isHidden = true
        
        self.rightSideTopImageView.image = UIImage(named: "roundLineImage")
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.rightSideBottomImageView.image = UIImage(named: "bottomLeftRoundImg")
        
        self.logView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.shadowView.shadow(14)
        
        self.loginTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 14)
        
        self.loginTextField.textColor = GoodWorkAppColor.appColour
        self.loginTextField.placeholder = "Enter phone number or email id"
        self.loginTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.loginButton.addRadiusBGColorTitleColorFont(title: "Login", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 16, radius: 28, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appWhite)
        
        
        self.dontHaveAccountLabel.addTitleColorAndFont(title: "Don’t have an account?", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appColour)
        
        self.signUpLabel.addTitleColorAndFont(title: "Sign up", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.skipNowImageView.image = UIImage(named: "skipForNow")
        
        self.loginTextField.updateCursorColour()
        
        self.loginTextField.delegate = self
        self.buttonActions()
        self.removeLoginImageView.image = UIImage(named: "removeLogin")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.loginTextField.text = ""
        
        let log = "Worker".withAttributes([
            .textColor(GoodWorkAppColor.appLightPink),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 34))
        ])
        
        let inn = " Login".withAttributes([
            .textColor(GoodWorkAppColor.appColour),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 34))
        ])
        
        let finalString = (log + inn)
        
        self.logInTitleLabel.attributedText = finalString
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("textFieldDidChange")
        
        let numbersRange = self.loginTextField.text?.rangeOfCharacter(from: .letters)
        
        if textField == self.loginTextField {
            if textField.text!.count > 3 {
                if numbersRange == nil{
                    self.loginTextField.text = self.loginTextField.text!.applyPatternOnNumbers(pattern: "+# (###) ###-####", replacementCharacter: "#")
                }
            }
        }
    }
}

//MARK:- Button Actions
extension LoginVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.loginButton.addTarget(self, action: #selector(self.loginButtonPressed(_:)), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(self.signUpButtonPressed(_:)), for: .touchUpInside)
        self.skipForNowButton.addTarget(self, action: #selector(self.skipForNowButtonPressed(_:)), for: .touchUpInside)
        self.removeLoginBUtton.addTarget(self, action: #selector(self.removeLoginBUttonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton){
        print("loginButtonPressed")
        if self.validate(){
            self.sendOtpAPI()
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton){
        print("signUpButtonPressed")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: SignUpVC.storyBoardIdentifier) as? SignUpVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipForNowButtonPressed(_ sender: UIButton){
        self.notificationBanner(AlertMassage.comingSoon.rawValue)
    }
    
    @IBAction func removeLoginBUttonPressed(_ sender: UIButton){
        print("removeLoginBUttonPressed")
        self.loginTextField.text = ""
        self.removeLoginImageView.isHidden = true
        self.removeLoginBUtton.isHidden = true
    }
    
}

extension LoginVC {
    
    func validate() -> Bool{
        if self.loginTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.phoneEmailValidation.rawValue)
            return false
        }else if let validphone = self.loginTextField.text, validphone.isValidPhone() || validphone.isValidEmail() {
            print("Success")
            return true
        }else{
            self.notificationBanner(AlertMassage.phoneEmailValidation.rawValue)
            return false
        }
    }
}

extension LoginVC {
    
    func sendOtpAPI(){
        self.view.endEditing(true)
        var mdl = SendOTPRequest()
        mdl.id = self.loginTextField.text ?? ""
        mdl.role = "nurse"
        
        self.startLoading()
        
        LoginDataManager.shared.sendOTP(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                print("dic: \(dict)")
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    var dicResp = response["data"] as? [String : Any] ??  [String : Any]()
                    
                    print("api_status True")
                    
                    var loginUserID = dicResp["user_id"] as? String ?? ""
                    
                    _userDefault.set(loginUserID, forKey: UserDefaultKeys.user_id.rawValue)
                    _userDefault.synchronize()
                    
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: VerificationVC.storyBoardIdentifier) as? VerificationVC else { return }
                    vc.loginUserID = loginUserID
                    vc.registerMobileNo = self.loginTextField.text ?? ""
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                    
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

extension LoginVC : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        let numbersRange = self.loginTextField.text?.rangeOfCharacter(from: .letters)
        
        
        if textField == self.loginTextField {
            if self.loginTextField.text?.count ?? 0 > 1{
                self.removeLoginImageView.isHidden = false
                self.removeLoginBUtton.isHidden = false
            }else{
                self.removeLoginImageView.isHidden = true
                self.removeLoginBUtton.isHidden = true
            }
        }
        
        if textField == self.loginTextField {
            if textField.text!.count > 3 {
                if numbersRange == nil{
                    let maxLength = 17
                    let currentString = (textField.text ?? "") as NSString
                    let newString = currentString.replacingCharacters(in: range, with: string)
                    
                    return newString.count <= maxLength
                }else{
                    return true
                }
                
            }else{
                
                return true
            }
            
        }
        
        
        return true
    }
    
}


extension UIView {
    
    func addBorderWidthColour(_ borderWidth: CGFloat, _ borderColor: UIColor, _ radius: CGFloat) {
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = radius
    }
    
    func addRadiusAndBGColour(_ radius: CGFloat, _ bgColor: UIColor) {
        
        self.layer.cornerRadius = radius
        self.layer.backgroundColor = bgColor.cgColor
    }
    
    func shadow(_ cornerRadius : CGFloat){
        self.backgroundColor = GoodWorkAppColor.appLightGray
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    func shadowWithRadiusAndColour(_ cornerRadius : CGFloat, _ bgColour : UIColor){
        self.backgroundColor = bgColour
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}

extension UIButton {
    
    func addRadiusBGColorTitleColorFont(title: String, fontName : GoodWorkAppFontName, fontSize : CGFloat, radius: CGFloat, bgColor: UIColor, tintColor :UIColor){
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(tintColor, for: .normal)
        self.layer.cornerRadius = radius
        self.layer.backgroundColor = bgColor.cgColor
        
        self.titleLabel?.font = GoodWorkApp.goodWorkAppFont(fontName, fontSize)
    }
    
    func addTitleColour(_ tintColor: UIColor){
        self.setTitleColor(tintColor, for: .normal)
        
    }
}

extension UILabel {
    
    func addTitleColorAndFont(title: String, fontName : GoodWorkAppFontName, fontSize : CGFloat, tintColor :UIColor){
        
        self.textColor = tintColor
        self.text = title
        self.font = GoodWorkApp.goodWorkAppFont(fontName, fontSize)
    }
    
    func addColorAndFontSize(fontName : GoodWorkAppFontName,fontSize : CGFloat, tintColor :UIColor){
        
        self.textColor = tintColor
        self.font = GoodWorkApp.goodWorkAppFont(fontName, fontSize)
    }
}

extension Int {
    
    func secondsToTime() -> String {
        
        let (h,m,s) = (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
        
        
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        
        return "\(m_string):\(s_string)"
    }
}


extension String {
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
