//
//  LicensesVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit
import DropDown

class LicensesVC: BaseVC {
    
    static let storyBoardIdentifier = "LicensesVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var licensesTitleLabel: UILabel!
    
    @IBOutlet weak var licenseNumberBGView: UIView!
    @IBOutlet weak var licenseNumberShadowView: UIView!
    @IBOutlet weak var licenseNumberTextField: UITextField!
    
    @IBOutlet weak var licenseTypesBGView: UIView!
    @IBOutlet weak var licenseTypesShadowView: UIView!
    @IBOutlet weak var licenseTypesTextField: UITextField!
    
    @IBOutlet weak var authorityIssueBGView: UIView!
    @IBOutlet weak var authorityIssueShadowView: UIView!
    @IBOutlet weak var authorityIssueTextField: UITextField!
    
    @IBOutlet weak var issueDateBGView: UIView!
    @IBOutlet weak var issueDateShadowView: UIView!
    @IBOutlet weak var issueDateTextField: UITextField!
    
    @IBOutlet weak var expDateBGView: UIView!
    @IBOutlet weak var expDateShadowView: UIView!
    @IBOutlet weak var expDateTextField: UITextField!
    
    @IBOutlet weak var renewalDateBGView: UIView!
    @IBOutlet weak var renewalDateShadowView: UIView!
    @IBOutlet weak var renewalDateTextField: UITextField!
    
    @IBOutlet weak var licenseStatusDateBGView: UIView!
    @IBOutlet weak var licenseStatusShadowView: UIView!
    @IBOutlet weak var licenseStatusTextField: UITextField!
    
    
    @IBOutlet weak var licenseTypeDropImg: UIImageView!
    @IBOutlet weak var selectLicenseTypeButton: UIButton!
    
    @IBOutlet weak var licenseStatusDropImg: UIImageView!
    @IBOutlet weak var selectLicenseStatusButton: UIButton!
    
    var licenseTypes : LicenseTypes?
    var licenseStatus : LicenseStatus?
    
    let licenseTypeDropDown = DropDown()
    let licenseStatusDropDown = DropDown()
    
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
    
    
    var licenseTypeID = ""
    var licenseStatusID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        
        self.getLicenseTypesAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.licenseNumberTextField.text = appDelegate.nurseProfile?.data?.nursing_license_number ?? ""
        
        self.authorityIssueTextField.text = ""
        
        self.issueDateTextField.text =  appDelegate.nurseProfile?.data?.license_issue_date ?? ""
        
        self.expDateTextField.text =  appDelegate.nurseProfile?.data?.license_expiry_date ?? ""
        
        self.renewalDateTextField.text =  appDelegate.nurseProfile?.data?.license_renewal_date ?? ""
        
        self.authorityIssueTextField.text =  appDelegate.nurseProfile?.data?.authority_Issue ?? ""
        
        self.progressView.progress = updateProfileProgress()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.licensesTitleLabel.addTitleColorAndFont(title: "Licenses", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        
        self.licenseNumberBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.licenseNumberShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.licenseNumberTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.licenseNumberTextField.placeholder = "Enter license number"
        self.licenseNumberTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        self.licenseTypesBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.licenseTypesShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.licenseTypesTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.licenseTypesTextField.placeholder = "Select license type"
        self.licenseTypesTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        self.authorityIssueBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.authorityIssueShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.authorityIssueTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.authorityIssueTextField.placeholder = "Issuing authority (state or territory)"
        self.authorityIssueTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
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
        
        self.licenseStatusDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.licenseStatusShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.licenseStatusTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.licenseStatusTextField.placeholder = "Select license status"
        self.licenseStatusTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        self.licenseNumberTextField.updateCursorColour()
        self.licenseTypesTextField.updateCursorColour()
        self.authorityIssueTextField.updateCursorColour()
        self.issueDateTextField.updateCursorColour()
        self.expDateTextField.updateCursorColour()
        self.renewalDateTextField.updateCursorColour()
        self.licenseStatusTextField.updateCursorColour()
        
        
        
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
extension LicensesVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        self.selectLicenseTypeButton.addTarget(self, action: #selector(self.selectLicenseTypeButtonPressed(_:)), for: .touchUpInside)
        self.selectLicenseStatusButton.addTarget(self, action: #selector(self.selectLicenseStatusButtonPressed(_:)), for: .touchUpInside)
        
        
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
            print("True data")
            self.uploadNurseLicenseDetailAPI()
        }
    }
    
    @IBAction func selectLicenseTypeButtonPressed(_ sender: UIButton){
        print("selectLicenseTypeButtonPressed")
        self.setUpDropDownLicenseType()
    }
    
    @IBAction func selectLicenseStatusButtonPressed(_ sender: UIButton){
        print("selectLicenseStatusButtonPressed")
        self.setUpDropDownLicenseStatus()
    }
}

extension LicensesVC {
    
    func getLicenseTypesAPI(){
        
        var mdl = LicenseTypesRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getLicenseTypesAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                self.stopLoading()
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let licenseTypesResp = try JSONDecoder().decode(LicenseTypes.self, from: jsonData)
                        
                        self.licenseTypes = licenseTypesResp
                        
                        if self.licenseTypes?.api_status == "1"{
                            print("self.licenseTypes?.data?.count \(self.licenseTypes?.data?.count)")
                            
                            print("id \(self.licenseTypes?.data?[0].id)")
                            print("name \(self.licenseTypes?.data?[0].name)")
                            
                            var indNo = 0
                            for i in 1...(self.licenseTypes?.data!.count)! {
                                
                                if self.licenseTypes?.data?[indNo].id ?? "" == appDelegate.nurseProfile?.data?.license_type ?? ""{
                                    self.licenseTypesTextField.text = self.licenseTypes?.data?[indNo].name ?? ""
                                }
                            }
                            
                        }else{
                            print("falsee")
                        }
                        
                    }catch{
                        print("catch")
                    }
                    
                    self.getLicenseStatusAPI()
                }else{
                    print("False")
                    self.stopLoading()
                }
                
                self.stopLoading()
            }
        }
    }
    
    func getLicenseStatusAPI(){
        
        let mdl = LicenseStatusRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getLicenseStatusAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                // self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let licenseTypesResp = try JSONDecoder().decode(LicenseStatus.self, from: jsonData)
                        
                        self.licenseStatus = licenseTypesResp
                        
                        if self.licenseStatus?.api_status == "1"{
                            print("self.licenseTypes?.data?.count \(self.licenseStatus?.data?.count)")
                            
                            print("id \(self.licenseStatus?.data?[0].id)")
                            print("name \(self.licenseStatus?.data?[0].name)")
                            
                            var indNo = 0
                            for i in 1...(self.licenseStatus?.data!.count)! {
                                
                                if self.licenseStatus?.data?[indNo].id ?? "" == appDelegate.nurseProfile?.data?.license_status ?? ""{
                                    self.licenseStatusTextField.text = self.licenseStatus?.data?[indNo].name ?? ""
                                }
                            }
                            
                        }else{
                            print("falsee")
                        }
                        
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
    
    func uploadNurseLicenseDetailAPI(){
        
        var mdl = NurseLicenseDetailRequest()
        
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.nursing_license_number = self.licenseNumberTextField.text ?? ""
        mdl.license_type = self.licenseTypeID
        mdl.nursing_license_state = self.licenseStatusTextField.text ?? ""
        mdl.license_expiry_date = self.expDateTextField.text ?? ""
        mdl.license_issue_date = self.issueDateTextField.text ?? ""
        mdl.license_renewal_date = self.renewalDateTextField.text ?? ""
        mdl.license_status = self.licenseStatusID
        mdl.authority_Issue = self.authorityIssueTextField.text ?? ""
        
        print("mdl: \(mdl)")
                
        self.startLoading()
        
        LoginDataManager.shared.nurseLicenseDetailAPI(rqst: mdl) { (dict, error) in
            
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
}

extension LicensesVC {
    
    func validate() -> Bool{
        if self.licenseNumberTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.licenseNo.rawValue)
            return false
        }else if self.licenseTypesTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.licenseType.rawValue)
            return false
        }else if self.authorityIssueTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.issueAutho.rawValue)
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
        }else if self.licenseStatusTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.licenseStatus.rawValue)
            return false
        }else{
            return true
        }
    }
    
    func setUpDropDownLicenseType(){
        
        if self.licenseTypes?.data?.count ?? 0 == 0 {
            return
        }
        
        var strName = [String]()
        
        self.licenseTypeDropDown.anchorView = self.licenseTypeDropImg
        
        var indNo = 0
        
        for _ in 1...(self.licenseTypes?.data?.count ?? 0){
            strName.append(self.licenseTypes?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.licenseTypeDropDown.direction = .bottom
        self.licenseTypeDropDown.bottomOffset = CGPoint(x: -115, y: 22)
        self.licenseTypeDropDown.dataSource = strName
        self.licenseTypeDropDown.width = 150
        self.licenseTypeDropDown.show()
        
        self.licenseTypeDropImg.transform =   self.licenseTypeDropImg.transform.rotated(by: .pi)
        
        self.licenseTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.licenseTypeDropImg.transform =   (self?.licenseTypeDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.licenseTypesTextField.text = item
            self?.licenseTypeID = self?.licenseTypes?.data?[index].id ?? ""
        }
    }
    
    func setUpDropDownLicenseStatus(){
        var strName = [String]()
        
        if self.licenseStatus?.data?.count ?? 0 == 0 {
            return
        }
        
        self.licenseStatusDropDown.anchorView = self.licenseStatusDropImg
        
        var indNo = 0
        
        for _ in 1...(self.licenseStatus?.data?.count ?? 0){
            strName.append(self.licenseStatus?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.licenseStatusDropDown.direction = .bottom
        self.licenseStatusDropDown.bottomOffset = CGPoint(x: -115, y: 22)
        self.licenseStatusDropDown.dataSource = strName
        self.licenseStatusDropDown.width = 150
        self.licenseStatusDropDown.show()
        
        self.licenseStatusDropImg.transform =   self.licenseStatusDropImg.transform.rotated(by: .pi)
        
        self.licenseStatusDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.licenseStatusDropImg.transform =   (self?.licenseStatusDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.licenseStatusTextField.text = item
            self?.licenseStatusID = self?.licenseStatus?.data?[index].id ?? ""
        }
    }
}
