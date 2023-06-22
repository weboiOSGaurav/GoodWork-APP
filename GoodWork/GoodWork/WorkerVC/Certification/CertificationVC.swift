//
//  CertificationVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit
import DropDown

class CertificationVC: BaseVC {
    
    static let storyBoardIdentifier = "CertificationVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var certificationTitleLabel: UILabel!
    
    @IBOutlet weak var certificatNumberBGView: UIView!
    @IBOutlet weak var certificatNumberShadowView: UIView!
    @IBOutlet weak var certificatNumberTextField: UITextField!
    
    @IBOutlet weak var certificatTypesBGView: UIView!
    @IBOutlet weak var certificatTypesShadowView: UIView!
    @IBOutlet weak var certificatTypesTextField: UITextField!
    
    @IBOutlet weak var organizationBGView: UIView!
    @IBOutlet weak var organizationShadowView: UIView!
    @IBOutlet weak var organizationTextField: UITextField!
    
    @IBOutlet weak var issueDateBGView: UIView!
    @IBOutlet weak var issueDateShadowView: UIView!
    @IBOutlet weak var issueDateTextField: UITextField!
    
    @IBOutlet weak var expDateBGView: UIView!
    @IBOutlet weak var expDateShadowView: UIView!
    @IBOutlet weak var expDateTextField: UITextField!
    
    @IBOutlet weak var renewalDateBGView: UIView!
    @IBOutlet weak var renewalDateShadowView: UIView!
    @IBOutlet weak var renewalDateTextField: UITextField!
    
    @IBOutlet weak var certificationDropImg: UIImageView!
    
    let certificationTypeDropDown = DropDown()
    
    var certificationTypes : Certification?
    
    private lazy var issueDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    
    private lazy var expDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    private lazy var renewDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    var certTypeID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.getCertificatTypesAPI()
        
        if appDelegate.nurseProfile?.data?.certitficate?.count != 0 {
            
            self.certificatNumberTextField.text = appDelegate.nurseProfile?.data?.certitficate?[0].license_number ?? ""
            
            self.certificatTypesTextField.text = appDelegate.nurseProfile?.data?.certitficate?[0].type_definition ?? ""
            
            self.certTypeID = appDelegate.nurseProfile?.data?.certitficate?[0].type ?? 0
            self.organizationTextField.text = appDelegate.nurseProfile?.data?.certitficate?[0].organization ?? ""
            
            self.issueDateTextField.text = appDelegate.nurseProfile?.data?.certitficate?[0].effective_date ?? ""
            
            self.expDateTextField.text = appDelegate.nurseProfile?.data?.certitficate?[0].expiration_date ?? ""
            
            self.renewalDateTextField.text = appDelegate.nurseProfile?.data?.certitficate?[0].renewal_date ?? ""
        }
        
        self.progressView.progress = updateProfileProgress()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.certificationTitleLabel.addTitleColorAndFont(title: "Certification", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        
        self.certificatNumberBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.certificatNumberShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.certificatNumberTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.certificatNumberTextField.placeholder = "Enter certification number"
        self.certificatNumberTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        self.certificatTypesBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.certificatTypesShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.certificatTypesTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.certificatTypesTextField.placeholder = "Select certification type"
        self.certificatTypesTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        self.organizationBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.organizationShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.organizationTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.organizationTextField.placeholder = "Certification organization"
        self.organizationTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        self.issueDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.issueDateShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.issueDateTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.issueDateTextField.placeholder = "Issue date"
        self.issueDateTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.expDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.expDateShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.expDateTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.expDateTextField.placeholder = "Expiration date"
        self.expDateTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.renewalDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.renewalDateShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.renewalDateTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.renewalDateTextField.placeholder = "Renewal date"
        self.renewalDateTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.certificatNumberTextField.updateCursorColour()
        self.certificatTypesTextField.updateCursorColour()
        self.organizationTextField.updateCursorColour()
        self.issueDateTextField.updateCursorColour()
        self.expDateTextField.updateCursorColour()
        self.renewalDateTextField.updateCursorColour()
        
        self.buttonActions()
        self.setUPDatePicker()
    }
    
    func setUPDatePicker(){
        self.issueDateTextField.inputView = self.issueDatePicker
        
        if #available(iOS 14, *) {
            self.issueDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.issueDatePicker.addTarget(self, action: #selector(self.handleIssueDatePicker(sender:)), for: .valueChanged)
        
        
        self.expDateTextField.inputView = self.expDatePicker
        
        if #available(iOS 14, *) {
            self.expDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.expDatePicker.addTarget(self, action: #selector(self.handleExpDatePicker(sender:)), for: .valueChanged)
        
        
        self.renewalDateTextField.inputView = self.renewDatePicker
        
        if #available(iOS 14, *) {
            self.renewDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.renewDatePicker.addTarget(self, action: #selector(self.handleRenewDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleIssueDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.issueDateTextField.text = formatter.string(from: sender.date)
    }
    
    @objc func handleExpDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.expDateTextField.text = formatter.string(from: sender.date)
    }
    
    @objc func handleRenewDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.renewalDateTextField.text = formatter.string(from: sender.date)
    }
}

//MARK:- Button Actions
extension CertificationVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
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
            
            if appDelegate.nurseProfile?.data?.certitficate?.count == 0 {
                self.addNurseCertificationAPI()
            }else{
                self.uploadNurseCertificationAPI()
            }
        }
    }
    
    @IBAction func selectCetiTypeButtonPressed(_ sender: UIButton){
        print("selectCetiTypeButtonPressed")
        self.setUpDropDownCertification()
    }
    
}

extension CertificationVC {
    func setUpDropDownCertification(){
        
        if self.certificationTypes?.data?.count ?? 0 == 0 {
            return
        }
        var strName = [String]()
        
        self.certificationTypeDropDown.anchorView = self.certificationDropImg
        
        var indNo = 0
        
        for _ in 1...(self.certificationTypes?.data?.count ?? 0){
            strName.append(self.certificationTypes?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.certificationTypeDropDown.direction = .bottom
        self.certificationTypeDropDown.bottomOffset = CGPoint(x: -325, y: 22)
        self.certificationTypeDropDown.dataSource = strName
        self.certificationTypeDropDown.width = 370
        self.certificationTypeDropDown.show()
        
        self.certificationDropImg.transform =   self.certificationDropImg.transform.rotated(by: .pi)
        
        self.certificationTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.certificationDropImg.transform =   (self?.certificationDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.certificatTypesTextField.text = item
            
            self?.certTypeID = self?.certificationTypes?.data?[index].id ?? 0
        }
    }
}

extension CertificationVC {
    func getCertificatTypesAPI(){
        
        let mdl = CertificationTypeRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getCertificationTypeListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                // self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let licenseTypesResp = try JSONDecoder().decode(Certification.self, from: jsonData)
                        
                        self.certificationTypes = licenseTypesResp
                        
                    }catch{
                        print("catch")
                    }
                }else{
                    print("False")
                    self.stopLoading()
                }
            }
            self.stopLoading()
        }
    }
    
    func uploadNurseCertificationAPI(){
        
        var mdl = NurseEditCertificationRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.certificate_id = appDelegate.nurseProfile?.data?.certitficate?[0].certificate_id ?? ""
        mdl.type =  self.certTypeID
        mdl.effective_date = self.issueDateTextField.text ?? ""
        mdl.expiration_date = self.expDateTextField.text ?? ""
        mdl.renewal_date = self.renewalDateTextField.text ?? ""
        mdl.license_number = self.certificatNumberTextField.text ?? ""
        mdl.organization = self.organizationTextField.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.nurseEditCertificationAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
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
    
    func addNurseCertificationAPI(){
        
        var mdl = AddNurseCertificationRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.type =  self.certTypeID
        mdl.effective_date = self.issueDateTextField.text ?? ""
        mdl.expiration_date = self.expDateTextField.text ?? ""
        mdl.renewal_date = self.renewalDateTextField.text ?? ""
        mdl.license_number = self.certificatNumberTextField.text ?? ""
        mdl.organization = self.organizationTextField.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.addNurseCertificationAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    self.navigationController?.popViewController(animated: true)
                    
                }else{
                    print("False")
                    
                }
                self.notificationBanner(response["message"] as? String ?? "")
                
                self.stopLoading()
            }
        }
    }
}

extension CertificationVC {
    
    func validate() -> Bool{
        if self.certificatNumberTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.certiNumber.rawValue)
            return false
        }else if self.certificatTypesTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.certitype.rawValue)
            return false
        }else if self.organizationTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.certiOraganization.rawValue)
            return false
        }else if self.issueDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.issueDate.rawValue)
            return false
        }else if self.expDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.expDate.rawValue)
            return false
        }else if self.renewalDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.renewalDate.rawValue)
            return false
        }else{
            return true
        }
    }
}
