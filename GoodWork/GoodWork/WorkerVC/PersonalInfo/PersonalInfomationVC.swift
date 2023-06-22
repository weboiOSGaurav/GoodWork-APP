//
//  PersonalInfomationVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 03/04/23.
//

import UIKit

class PersonalInfomationVC: BaseVC {
    
    static let storyBoardIdentifier = "PersonalInfomationVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var profileInfoLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var dateOfBirthBgView: UIView!
    @IBOutlet weak var dateOfBirthShadowView: UIView!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    @IBOutlet weak var socialSecurityBgView: UIView!
    @IBOutlet weak var socialSecurityShadowView: UIView!
    @IBOutlet weak var socialSecurityTextField: UITextField!
    
    @IBOutlet weak var driverLicenseBgView: UIView!
    @IBOutlet weak var driverLicenseShadowView: UIView!
    @IBOutlet weak var driverLicenseTextField: UITextField!
    
    
    private lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
        self.dateOfBirthTextField.text = appDelegate.nurseProfile?.data?.date_of_birth ?? ""
        
        self.socialSecurityTextField.text = appDelegate.nurseProfile?.data?.security_number ?? ""
        
        self.driverLicenseTextField.text = appDelegate.nurseProfile?.data?.driving_license ?? ""
        self.progressView.progress = updateProfileProgress()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.profileInfoLabel.addTitleColorAndFont(title: "Personal information", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.dateOfBirthBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.dateOfBirthShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.socialSecurityBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.socialSecurityShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.driverLicenseBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.driverLicenseShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.dateOfBirthTextField.inputView = self.datePicker
        
        if #available(iOS 14, *) {
            self.datePicker.preferredDatePickerStyle = .wheels
        }
        
        self.datePicker.addTarget(self, action: #selector(self.handleDatePicker(sender:)), for: .valueChanged)
        
        self.datePicker.maximumDate = Date()

        self.dateOfBirthTextField.updateCursorColour()
        self.socialSecurityTextField.updateCursorColour()
        self.driverLicenseTextField.updateCursorColour()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension PersonalInfomationVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        
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
            self.updatePersonalInfoAPI()
        }
    }
}

extension PersonalInfomationVC {
    
    func validate() -> Bool{
        if self.dateOfBirthTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.dateOfBirth.rawValue)
            return false
        }else if self.socialSecurityTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.socialSecurityNo.rawValue)
            return false
        }else if self.driverLicenseTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.driveringNo.rawValue)
            return false
        }
        return true
    }
    
    @objc func handleDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-MM-dd"
        
        self.dateOfBirthTextField.text = formatter.string(from: sender.date)
    }
}

extension PersonalInfomationVC {
    
    func updatePersonalInfoAPI(){
        
        var mdl = UpdatePersonalInfoRequest()
        
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.date_of_birth = self.dateOfBirthTextField.text ?? ""
        mdl.driving_license = self.driverLicenseTextField.text ?? ""
        mdl.security_number = self.socialSecurityTextField.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.updatePersonalInfoAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                self.stopLoading()
                let response = dict as? [String : Any] ??  [String : Any]()
                
                self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    self.navigationController?.popViewController(animated: true)
                }else{
                    print("False")
                }
            }
        }
    }
}
