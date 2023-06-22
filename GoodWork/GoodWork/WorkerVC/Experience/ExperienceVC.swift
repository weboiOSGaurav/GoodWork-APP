//
//  ExperienceVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit
import DropDown

class ExperienceVC: BaseVC {
    
    static let storyBoardIdentifier = "ExperienceVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var experienceTitleLabel: UILabel!
    
    @IBOutlet weak var experienceTypeBGView: UIView!
    @IBOutlet weak var experienceTypeShadowView: UIView!
    @IBOutlet weak var experienceTypeTextField: UITextField!
    
    @IBOutlet weak var unitBGView: UIView!
    @IBOutlet weak var unitShadowView: UIView!
    @IBOutlet weak var unitTextField: UITextField!
    
    
    @IBOutlet weak var jobTitleBGView: UIView!
    @IBOutlet weak var jobTitleShadowView: UIView!
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    @IBOutlet weak var startDateBGView: UIView!
    @IBOutlet weak var startDateShadowView: UIView!
    @IBOutlet weak var startDateTextField: UITextField!
    
    @IBOutlet weak var endDateBGView: UIView!
    @IBOutlet weak var endDateShadowView: UIView!
    @IBOutlet weak var endDateTextField: UITextField!
    
    @IBOutlet weak var workingImageView: UIImageView!
    @IBOutlet weak var currentlyWorkingLabel: UILabel!
    
    @IBOutlet weak var expTypeDropImg: UIImageView!
    
    
    
    var experienceTypeList : ExperienceTypeList?
    
    let expTypeDropDown = DropDown()
    
    private lazy var startDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    
    private lazy var endDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    
    var isCurrentJob = 1
    var experienceTypeID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getExperienceTypesAPI()
        self.tabBarController?.tabBar.isHidden = true
        self.isCurrentJob = 1
        
        if appDelegate.nurseProfile?.data?.experience?.count != 0 {
            self.unitTextField.text = appDelegate.nurseProfile?.data?.experience?[0].unit ?? ""
            
            self.jobTitleTextField.text = appDelegate.nurseProfile?.data?.experience?[0].position_title ?? ""
            
            self.startDateTextField.text = appDelegate.nurseProfile?.data?.experience?[0].start_date ?? ""
            
            self.endDateTextField.text = appDelegate.nurseProfile?.data?.experience?[0].end_date ?? ""
        }
        self.progressView.progress = updateProfileProgress()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.experienceTitleLabel.addTitleColorAndFont(title: "Experience", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.experienceTypeBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.experienceTypeShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.experienceTypeTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.experienceTypeTextField.placeholder = "Experience type"
        self.experienceTypeTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.unitBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.unitShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.unitTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.unitTextField.placeholder = "Unit"
        self.unitTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        
        
        
        self.jobTitleBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.jobTitleShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.jobTitleTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.jobTitleTextField.placeholder = "Job title"
        self.jobTitleTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.startDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.startDateShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.startDateTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.startDateTextField.placeholder = "Start date"
        self.startDateTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.endDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.endDateShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.endDateTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.endDateTextField.placeholder = "End date"
        self.endDateTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.workingImageView.image = UIImage(named: "tickcircle")
        
        self.currentlyWorkingLabel.addTitleColorAndFont(title: "I am currently working in this role", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.experienceTypeTextField.updateCursorColour()
        self.unitTextField.updateCursorColour()
        self.jobTitleTextField.updateCursorColour()
        self.startDateTextField.updateCursorColour()
        self.endDateTextField.updateCursorColour()
        
        self.buttonActions()
        self.setUPDatePicker()
    }
    
    func setUPDatePicker(){
        self.startDateTextField.inputView = self.startDatePicker
        
        if #available(iOS 14, *) {
            self.startDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.startDatePicker.addTarget(self, action: #selector(self.handleStartDatePicker(sender:)), for: .valueChanged)
        
        self.endDateTextField.inputView = self.endDatePicker
        
        if #available(iOS 14, *) {
            self.endDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.endDatePicker.addTarget(self, action: #selector(self.handleEndDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleStartDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.startDateTextField.text = formatter.string(from: sender.date)
    }
    
    @objc func handleEndDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.endDateTextField.text = formatter.string(from: sender.date)
    }
}

//MARK:- Button Actions
extension ExperienceVC {
    
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
            self.uploadNurseExpAPI()
        }
    }
    
    @IBAction func selectExpTypeButtonPressed(_ sender: UIButton){
        print("selectExpTypeButtonPressed")
        self.setUpDropDownExpType()
    }
    
    @IBAction func iMWorkingButtonPressed(_ sender: UIButton){
        print("iMWorkingButtonPressed")
        
        if self.isCurrentJob == 1{
            self.isCurrentJob = 0
            self.workingImageView.image = UIImage(named: "unCheckTickcircle")
        }else{
            self.isCurrentJob = 1
            self.workingImageView.image = UIImage(named: "tickcircle")
        }
    }
    }

extension ExperienceVC {
    
    func setUpDropDownExpType(){
        
        if self.experienceTypeList?.data?.count ?? 0 == 0 {
            return
        }
        var strName = [String]()
        
        self.expTypeDropDown.anchorView = self.expTypeDropImg
        
        var indNo = 0
        
        for _ in 1...(self.experienceTypeList?.data?.count ?? 0){
            strName.append(self.experienceTypeList?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.expTypeDropDown.direction = .bottom
        self.expTypeDropDown.bottomOffset = CGPoint(x: -115, y: 22)
        self.expTypeDropDown.dataSource = strName
        self.expTypeDropDown.width = 150
        self.expTypeDropDown.show()
        
        self.expTypeDropImg.transform =   self.expTypeDropImg.transform.rotated(by: .pi)
        
        self.expTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.expTypeDropImg.transform =   (self?.expTypeDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.experienceTypeTextField.text = item
            self?.experienceTypeID = self?.experienceTypeList?.data?[index].id ?? 0
        }
    }
    
    func validate() -> Bool{
        if self.experienceTypeTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.expType.rawValue)
            return false
        }else if self.unitTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.unit.rawValue)
            return false
        }else if self.jobTitleTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.jobTitle.rawValue)
            return false
        }else if self.startDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.startDate.rawValue)
            return false
        }else if self.endDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.endDate.rawValue)
            return false
        }else {
            return true
        }
    }
}

extension ExperienceVC {
    func getExperienceTypesAPI(){
        
        var mdl = ExperienceTypesRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getExperienceTypesAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                self.stopLoading()
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let experienceTypesResp = try JSONDecoder().decode(ExperienceTypeList.self, from: jsonData)
                        
                        self.experienceTypeList = experienceTypesResp
                        
                        if self.experienceTypeList?.api_status == "1"{
                            print("self.licenseTypes?.data?.count \(self.experienceTypeList?.data?.count)")
                            
                            var countNo = 0
                            
                            for i in 1...(self.experienceTypeList?.data?.count ?? 0) {
                                
                                if appDelegate.nurseProfile?.data?.experience?.count != 0 {
                                    if self.experienceTypeList?.data?[countNo].id ?? 0 == appDelegate.nurseProfile?.data?.experience?[0].type ?? 0 {
                                        
                                        self.experienceTypeTextField.text = self.experienceTypeList?.data?[countNo].name ?? ""
                                        self.experienceTypeID = self.experienceTypeList?.data?[countNo].id ?? 0
                                    }
                                }
                                
                                countNo += 1
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
                
                self.stopLoading()
            }
        }
    }
    
    func uploadNurseExpAPI(){
        
        var mdl = NurseExpRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        mdl.type = self.experienceTypeID
        mdl.unit = self.unitTextField.text ?? ""
        mdl.position_title = self.jobTitleTextField.text ?? ""
        mdl.start_date = self.startDateTextField.text ?? ""
        mdl.end_date = self.endDateTextField.text ?? ""
        mdl.is_current_job = self.isCurrentJob
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.addNurseExperienceAPI(rqst: mdl) { (dict, error) in
            
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
