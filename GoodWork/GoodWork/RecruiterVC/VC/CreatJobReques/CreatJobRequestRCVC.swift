//
//  CreatJobRequestRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/04/23.
//

import UIKit
import KMPlaceholderTextView
import DropDown

class CreatJobRequestRCVC: BaseVC {
    
    static let storyBoardIdentifier = "CreatJobRequestRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createRequestTitleLabel: UILabel!
    
    @IBOutlet weak var shadowBgView1: UIView!
    @IBOutlet weak var shadowBgView2: UIView!
    @IBOutlet weak var shadowBgView3: UIView!
    @IBOutlet weak var shadowBgView4: UIView!
    @IBOutlet weak var shadowBgView5: UIView!
    @IBOutlet weak var shadowBgView6: UIView!
    
    @IBOutlet weak var jobNameBgView: UIView!
    @IBOutlet weak var specialityJobBgView: UIView!
    @IBOutlet weak var jobLocationBgView: UIView!
    @IBOutlet weak var durationBgView: UIView!
    @IBOutlet weak var weeklyPayBgView: UIView!
    @IBOutlet weak var jobDescriptionBgView: UIView!
    
    @IBOutlet weak var jobNameTextField: UITextField!
    @IBOutlet weak var specialityTextField: UITextField!
    @IBOutlet weak var jobLocationTextField: UITextField!
    @IBOutlet weak var workDurationTextField: UITextField!
    @IBOutlet weak var weeklyPayTextField: UITextField!
    
    @IBOutlet weak var jobDescriptionTextView: KMPlaceholderTextView!
    
    @IBOutlet weak var publishedNowButton: UIButton!
    
    @IBOutlet weak var specialitiesDropButton: UIButton!
    @IBOutlet weak var specialitiesDropImg: UIImageView!
    
    @IBOutlet weak var locationDropButton: UIButton!
    @IBOutlet weak var locationDropImg: UIImageView!
    
    @IBOutlet weak var durationDropButton: UIButton!
    @IBOutlet weak var durationDropImg: UIImageView!
    
    var nurseSpecialities : NurseSpecialities?
    let specialitiesTypeDropDown = DropDown()
    
    var nurseLocation : NurseWorkLocation?
    let nurseLocationTypeDropDown = DropDown()
    
    
    var assignmentDuration : AssignmentDuration?
    let durationTypeDropDown = DropDown()
    
    var specialityID = 0
    var workLocationID = 0
    var assignmentDurationID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.getNurseSpecialitiesAPI()
        self.getWorkLocationAPI()
        self.getWorkDurationAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.backButtonImageView.image = UIImage(named: "backButton")
        self.createRequestTitleLabel.addTitleColorAndFont(title: "Create Opportunity", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobDescriptionBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.weeklyPayBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.durationBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.jobLocationBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.specialityJobBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.jobNameBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        
        self.shadowBgView1.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView2.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView3.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView4.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView5.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView6.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        
        
        self.jobNameTextField.addTitleColorAndFont(placeHolder: "Enter job name", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.specialityTextField.addTitleColorAndFont(placeHolder: "Specialty", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobLocationTextField.addTitleColorAndFont(placeHolder: "Enter Job Location (City, State)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.workDurationTextField.addTitleColorAndFont(placeHolder: "Enter Work Duration", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.weeklyPayTextField.addTitleColorAndFont(placeHolder: "Enter Weekly Pay", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobDescriptionTextView.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.publishedNowButton.addRadiusAndBGColour((self.publishedNowButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension CreatJobRequestRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.publishedNowButton.addTarget(self, action: #selector(self.publishedNowButtonPressed(_:)), for: .touchUpInside)
        self.specialitiesDropButton.addTarget(self, action: #selector(self.specialitiesDropButtonPressed(_:)), for: .touchUpInside)
        self.locationDropButton.addTarget(self, action: #selector(self.locationTypeDropButtonPressed(_:)), for: .touchUpInside)
        self.durationDropButton.addTarget(self, action: #selector(self.durationTypeDropButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        if self.validateForDraftJob(){
            self.addJobOnDraftAPI()
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func publishedNowButtonPressed(_ sender: UIButton){
        print("publishedNowButtonPressed")
        if self.validate(){
            self.createJobPostAPI()
        }
    }
    
    @IBAction func specialitiesDropButtonPressed(_ sender: UIButton){
        print("specialitiesDropButtonPressed")
        self.setUpDropDownNurseSpecialitiesType()
    }
    
    @IBAction func locationTypeDropButtonPressed(_ sender: UIButton){
        print("locationTypeDropButtonPressed")
        self.setUpDropDownNurseLocationType()
    }
    
    @IBAction func durationTypeDropButtonPressed(_ sender: UIButton){
        print("durationTypeDropButtonPressed")
        self.setUpDropDownDurationType()
    }
}

extension CreatJobRequestRCVC {
    
    func validate() -> Bool{
        
        if self.jobNameTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.jobName.rawValue)
            return false
        }else if self.specialityTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.speciality.rawValue)
            return false
        }else if self.jobLocationTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.jobLocation.rawValue)
            return false
        }else if self.workDurationTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.workDuration.rawValue)
            return false
        }else if self.weeklyPayTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.weeklyPay.rawValue)
            return false
        }else if self.jobDescriptionTextView.text!.isEmpty{
            self.notificationBanner(AlertMassage.jobDescription.rawValue)
            return false
        }
        
        return true
    }
    
    
    func validateForDraftJob() -> Bool{
        
        if self.jobNameTextField.text!.isEmpty{
            return false
        }else if self.specialityTextField.text!.isEmpty{
            return false
        }else if self.jobLocationTextField.text!.isEmpty{
            return false
        }else if self.workDurationTextField.text!.isEmpty{
            return false
        }else if self.weeklyPayTextField.text!.isEmpty{
            return false
        }else if self.jobDescriptionTextView.text!.isEmpty{
            return false
        }
        
        return true
    }
}

extension CreatJobRequestRCVC {
    
    func getNurseSpecialitiesAPI(){
        
        let mdl = NurseSpecialitiesRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getNurseSpecialitiesListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                // self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseSpecialitiesResp = try JSONDecoder().decode(NurseSpecialities.self, from: jsonData)
                        
                        self.nurseSpecialities = nurseSpecialitiesResp
                        
                        if self.nurseSpecialities?.data?.count != 0 {
                            self.specialityTextField.text =  ""
                            self.specialityID = 0
                        }
                        
                    }catch{
                        print("catch")
                    }
                }else{
                    print("False")
                    
                }
                self.stopLoading()
            }
        }
    }
    
    func getWorkLocationAPI(){
        
        let mdl = WorkLocationRequest()
        
        print("getWorkLocationAPI mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getWorkLocationListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseWorkLocationResp = try JSONDecoder().decode(NurseWorkLocation.self, from: jsonData)
                        
                        self.nurseLocation = nurseWorkLocationResp
                        
                        if self.nurseLocation?.data?.count != 0 {
                            self.jobLocationTextField.text = ""
                            self.workLocationID = 0
                        }
                    }catch{
                        print("catch")
                    }
                    
                }else{
                    print("False")
                }
                self.stopLoading()
            }
        }
    }
    
    func getWorkDurationAPI(){
        
        self.startLoading()
        
        LoginDataManager.shared.getAssignmentDurationRCAPI() { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let assignmentDurationResp = try JSONDecoder().decode(AssignmentDuration.self, from: jsonData)
                        
                        self.assignmentDuration = assignmentDurationResp
                        
                        if self.assignmentDuration?.data?.count != 0 {
                            self.jobLocationTextField.text = ""
                            self.workLocationID = 0
                        }
                    }catch{
                        print("catch")
                    }
                    
                }else{
                    print("False")
                }
                self.stopLoading()
            }
        }
    }
    
    func createJobPostAPI(){
        
        var mdl = CreateJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.job_name = self.jobNameTextField.text ?? ""
        mdl.preferred_specialty = "\(self.specialityID)"
        mdl.preferred_work_location = "\(self.workLocationID)"
        mdl.preferred_assignment_duration = "\(self.assignmentDurationID)"
        mdl.preferred_hourly_pay_rate = self.weeklyPayTextField.text ?? ""
        mdl.description = self.jobDescriptionTextView.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.creatNewjobPostRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                 self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    self.navigationController?.popViewController(animated: true)
                }else{
                    print("False")
                }
                self.stopLoading()
            }
        }
    }
    
    func addJobOnDraftAPI(){
        
        var mdl = CreateJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.job_name = self.jobNameTextField.text ?? ""
        mdl.preferred_specialty = "\(self.specialityID)"
        mdl.preferred_work_location = "\(self.workLocationID)"
        mdl.preferred_assignment_duration = "\(self.assignmentDurationID)"
        mdl.preferred_hourly_pay_rate = self.weeklyPayTextField.text ?? ""
        mdl.description = self.jobDescriptionTextView.text ?? ""
        mdl.job_type = ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.addJobOnDraftRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                self.stopLoading()
                let response = dict as? [String : Any] ??  [String : Any]()
                
                 //self.notificationBanner(response["message"] as? String ?? "")
                self.navigationController?.popViewController(animated: true)
                if response["api_status"] as? String ?? "" == "1" {
                    print("added")
                }else{
                    print("False")
                }
                self.notificationBanner(response["message"] as? String ?? "")
                
            }
        }
    }
}

extension CreatJobRequestRCVC {
    
    func setUpDropDownNurseSpecialitiesType(){
        
        if self.nurseSpecialities?.data?.count ?? 0 == 0 {
            return
        }
        var strName = [String]()
        
        self.specialitiesTypeDropDown.anchorView = self.specialitiesDropImg
        
        var indNo = 0
        
        for _ in 1...(self.nurseSpecialities?.data?.count ?? 0){
            strName.append(self.nurseSpecialities?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.specialitiesTypeDropDown.direction = .bottom
        self.specialitiesTypeDropDown.bottomOffset = CGPoint(x: -325, y: 22)
        self.specialitiesTypeDropDown.dataSource = strName
        self.specialitiesTypeDropDown.width = 370
        self.specialitiesTypeDropDown.show()
        
        self.specialitiesDropImg.transform =   self.specialitiesDropImg.transform.rotated(by: .pi)
        
        self.specialitiesTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.specialitiesDropImg.transform =   (self?.specialitiesDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.specialityTextField.text = item
            self?.specialityID = self?.nurseSpecialities?.data?[index].id ?? 0
        }
    }
    
    func setUpDropDownNurseLocationType(){
        
        if self.nurseLocation?.data?.count ?? 0 == 0 {
            return
        }
        
        var strName = [String]()
        
        self.nurseLocationTypeDropDown.anchorView = self.locationDropImg
        
        var indNo = 0
        
        for _ in 1...(self.nurseLocation?.data?.count ?? 0){
            strName.append(self.nurseLocation?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.nurseLocationTypeDropDown.direction = .bottom
        self.nurseLocationTypeDropDown.bottomOffset = CGPoint(x: -325, y: 22)
        self.nurseLocationTypeDropDown.dataSource = strName
        self.nurseLocationTypeDropDown.width = 370
        self.nurseLocationTypeDropDown.show()
        
        self.locationDropImg.transform =   self.locationDropImg.transform.rotated(by: .pi)
        
        self.nurseLocationTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.locationDropImg.transform =   (self?.locationDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.jobLocationTextField.text = item
            self?.workLocationID = self?.nurseLocation?.data?[index].id ?? 0
        }
    }
    
    func setUpDropDownDurationType(){
        
        if self.assignmentDuration?.data?.count ?? 0 == 0 {
            return
        }
        
        var strName = [String]()
        
        self.durationTypeDropDown.anchorView = self.durationDropImg
        
        var indNo = 0
        
        for _ in 1...(self.assignmentDuration?.data?.count ?? 0){
            strName.append(self.assignmentDuration?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.durationTypeDropDown.direction = .bottom
        self.durationTypeDropDown.bottomOffset = CGPoint(x: -80, y: 22)
        self.durationTypeDropDown.dataSource = strName
        self.durationTypeDropDown.width = 100
        self.durationTypeDropDown.show()
        
        self.durationDropImg.transform =   self.durationDropImg.transform.rotated(by: .pi)
        
        self.durationTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.durationDropImg.transform =   (self?.durationDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.workDurationTextField.text = item
            self?.assignmentDurationID = self?.assignmentDuration?.data?[index].id ?? 0
        }
    }
}


extension UITextField {
    
    func addTitleColorAndFont(placeHolder: String, fontName : GoodWorkAppFontName, fontSize : CGFloat, tintColor :UIColor){
        
        self.textColor = GoodWorkAppColor.appColour
        self.placeholder = placeHolder
        self.font = GoodWorkApp.goodWorkAppFont(fontName, fontSize)
    }
}
