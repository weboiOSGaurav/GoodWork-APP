//
//  VerificationRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 24/04/23.
//
import UIKit
import NotificationBannerSwift

class VerificationRCVC: BaseVC {
    
    static let storyBoardIdentifier = "VerificationRCVC"
    
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    
    @IBOutlet weak var logInTitleLabel: UILabel!
    @IBOutlet weak var pleaseCheckMobileLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    
    @IBOutlet weak var resendCodeToLabel: UILabel!
    
    @IBOutlet weak var timeCountLabel: UILabel!
    
    @IBOutlet weak var enterCodeLabel: UILabel!
    
    @IBOutlet weak var otpv1: UIView!
    @IBOutlet weak var otpv1shadow: UIView!
    
    @IBOutlet weak var otpv2: UIView!
    @IBOutlet weak var otpv2shadow: UIView!
    
    @IBOutlet weak var otpv3: UIView!
    @IBOutlet weak var otpv3shadow: UIView!
    
    @IBOutlet weak var otpv4: UIView!
    @IBOutlet weak var otpv4shadow: UITextField!
    @IBOutlet weak var resendOTPButton: UIButton!
    
    @IBOutlet weak var otp1TextField: UITextField!
    @IBOutlet weak var otp2TextField: UITextField!
    @IBOutlet weak var otp3TextField: UITextField!
    @IBOutlet weak var otp4TextField: UITextField!
    
    var timer = Timer()
    
    var resendOTPSeconds = 90
    
    var registerMobileNo = ""
    var loginUserID = ""
    var isFromSignUP = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
        
        self.otpv1.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.otpv1shadow.shadow(14)
        
        self.otpv2.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.otpv2shadow.shadow(14)
        
        self.otpv3.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.otpv3shadow.shadow(14)
        
        self.otpv4.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.otpv4shadow.shadow(14)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        self.mobileNumberLabel.text = self.registerMobileNo
        //        self.sendOtpAPI()
        self.resendOTPButton.isUserInteractionEnabled = false
        self.timeCountLabel.text = "01:30"
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateResendOTPTime), userInfo: nil, repeats: true)
        
        if self.registerMobileNo.isValidPhone(){
            self.mobileNumberLabel.text =  String(self.registerMobileNo.dropFirst(2).trimmingCharacters(in: .whitespacesAndNewlines))
        }else{
            self.mobileNumberLabel.text = self.registerMobileNo
        }
        
        if self.isFromSignUP{
            self.sendOtpAPI()
        }
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.logInTitleLabel.addTitleColorAndFont(title: "Verification", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 32, tintColor: GoodWorkAppColor.appLightPink)
        
        self.pleaseCheckMobileLabel.addTitleColorAndFont(title: "We sent a verification code to", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appColour)
        
        self.mobileNumberLabel.addTitleColorAndFont(title: self.registerMobileNo, fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appColour)
        
        self.enterCodeLabel.addTitleColorAndFont(title: "Enter code", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 20, tintColor: GoodWorkAppColor.appColour)
        
        
        
        self.otp1TextField.textColor = GoodWorkAppColor.appColour
        self.otp1TextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.PoppinsRegular, 18)
        self.otp1TextField.updateCursorColour()
        
        self.otp2TextField.textColor = GoodWorkAppColor.appColour
        self.otp2TextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.PoppinsRegular, 18)
        self.otp2TextField.updateCursorColour()
        
        self.otp3TextField.textColor = GoodWorkAppColor.appColour
        self.otp3TextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.PoppinsRegular, 18)
        self.otp3TextField.updateCursorColour()
        
        self.otp4TextField.textColor = GoodWorkAppColor.appColour
        self.otp4TextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.PoppinsRegular, 18)
        self.otp4TextField.updateCursorColour()
        
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.verifyButton.addRadiusBGColorTitleColorFont(title: "Verify", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 16, radius: 20, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.resendCodeToLabel.addTitleColorAndFont(title: "Resend OTP in", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.timeCountLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.setOtpTextField()
        self.buttonActions()
    }
    
    
//    @objc func updateResendOTPTime(){
//
//
//        self.timeCountLabel.text = self.resendOTPSeconds.secondsToTime()
//
//        if self.resendOTPSeconds == 0 {
//            self.timer.invalidate()
//        }
//        self.resendOTPSeconds -= 1
//    }
    
    @objc func updateResendOTPTime() {
        
        self.timeCountLabel.text = self.resendOTPSeconds.secondsToTime()
        
        if self.resendOTPSeconds == 0 {
            self.timer.invalidate()
            self.resendOTPButton.isUserInteractionEnabled = true
            self.resendCodeToLabel.text = "Resend OTP"
            self.timeCountLabel.isHidden = true
        }else{
            if self.timeCountLabel.isHidden{
                self.timeCountLabel.isHidden = false
            }
            self.resendOTPSeconds -= 1
        }
    }
}

//MARK:- Button Actions
extension VerificationRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.verifyButton.addTarget(self, action: #selector(self.verifyButtonPressed(_:)), for: .touchUpInside)
        self.resendOTPButton.addTarget(self, action: #selector(self.resendOTPButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.timer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func verifyButtonPressed(_ sender: UIButton){
        print("verifyButtonPressed")
        if self.validate(){
            
            self.confirmrOtpAPI()
        }
    }
    
    @IBAction func resendOTPButtonPressed(_ sender: UIButton){
        print("verifyButtonPressed")
        self.resendOTPButton.isUserInteractionEnabled = false
        self.resendCodeToLabel.text = "Resend OTP in"
        self.sendOtpAPI()
    }
}

extension VerificationRCVC {
    
    func validate() -> Bool{
        
        if self.otp1TextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.otpNumberBlank.rawValue)
            return false
        }else if self.otp2TextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.otpNumberBlank.rawValue)
            return false
        }else if self.otp3TextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.otpNumberBlank.rawValue)
            return false
        }else if self.otp4TextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.otpNumberBlank.rawValue)
            return false
        }else{
            return true
        }
    }
}


//MARK:- TextFields
extension VerificationRCVC : UITextFieldDelegate{
    
    func setOtpTextField(){
        self.otp1TextField.delegate = self
        self.otp2TextField.delegate = self
        self.otp3TextField.delegate = self
        self.otp4TextField.delegate = self
        
        self.otp1TextField.updateCursorColour()
        self.otp2TextField.updateCursorColour()
        self.otp3TextField.updateCursorColour()
        self.otp4TextField.updateCursorColour()
        
        if #available(iOS 12.0, *) {
            self.otp1TextField.textContentType = .oneTimeCode
        }
        self.self.otp1TextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if #available(iOS 12.0, *) {
            if textField.textContentType == UITextContentType.oneTimeCode{
                //here split the text to your four text fields
                if let otpCode = textField.text, otpCode.count > 3{
                    self.otp1TextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 0)])
                    self.otp2TextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 1)])
                    self.otp3TextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 2)])
                    self.otp4TextField.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 3)])
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (string.count == 1){
            if textField == self.otp1TextField {
                self.otp2TextField?.becomeFirstResponder()
            }
            if textField == self.otp2TextField {
                self.otp3TextField?.becomeFirstResponder()
            }
            if textField == self.otp3TextField {
                self.otp4TextField?.becomeFirstResponder()
            }
            if textField ==  self.otp4TextField {
                self.otp4TextField?.resignFirstResponder()
                textField.text? = string
            }
            textField.text? = string
            return false
        }else{
            if textField ==  self.otp1TextField {
                self.otp1TextField?.becomeFirstResponder()
            }
            if textField ==  self.otp2TextField {
                self.otp1TextField?.becomeFirstResponder()
            }
            if textField ==  self.otp3TextField {
                self.otp2TextField?.becomeFirstResponder()
            }
            if textField ==  self.otp4TextField {
                self.otp3TextField?.becomeFirstResponder()
            }
            textField.text? = string
            return false
        }
    }
}

extension VerificationRCVC {
    
    func sendOtpAPI(){
        
        var mdl = SendOTPRequest()
        mdl.id = self.registerMobileNo
        mdl.role = "recruiter"
        self.startLoading()
        
        LoginDataManager.shared.sendOTP(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                print("dic: \(dict)")
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    var dicResp = response["data"] as? [String : Any] ??  [String : Any]()
                    
                    print("api_status True")
                    
                    self.resendOTPSeconds = 90
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateResendOTPTime), userInfo: nil, repeats: true)
                    
                    self.loginUserID = dicResp["user_id"] as? String ?? ""
                    _userDefault.set(self.loginUserID, forKey: UserDefaultKeys.user_id.rawValue)
                    _userDefault.synchronize()
                    
                    if self.isFromSignUP{
                        self.isFromSignUP = false
                    }else{
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
    
    func confirmrOtpAPI(){
        
        var otp = (self.otp1TextField.text ?? "") + (self.otp2TextField.text ?? "") + (self.otp3TextField.text ?? "") + (self.otp4TextField.text ?? "")
        
        var mdl = ConfirmOTPRequest()
        mdl.user_id = self.loginUserID
        mdl.otp = otp
        
        print("mdl \(mdl)")
        self.startLoading()
        
        LoginDataManager.shared.confirmOTP(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    let dicResp = response["data"] as? [String : Any] ??  [String : Any]()
                    let user_details  = dicResp["user_details"] as? [String : Any] ??  [String : Any]()
                    
                    self.loginUserID = user_details["id"] as? String ?? ""
                    
                    print("self.loginUserID \(self.loginUserID)")
                    
                    _userDefault.set(false, forKey: UserDefaultKeys.isUserLogin.rawValue)
                    _userDefault.set(true, forKey: UserDefaultKeys.isRecruiterUserLogin.rawValue)
                    
                    _userDefault.set(self.loginUserID, forKey: UserDefaultKeys.user_id.rawValue)
                    _userDefault.synchronize()
                    
//                    _userDefault.set("62964b94-35f8-4487-971a-ec105f2bb7b5", forKey: UserDefaultKeys.user_id.rawValue)
                    
                    //            print("Recruiter")
                    let vc = recruiterStoryboard.instantiateViewController(withIdentifier: TabBarRCVCViewController.storyBoardIdentifier) as! TabBarRCVCViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.stopLoading()
            }
        }
    }
}
