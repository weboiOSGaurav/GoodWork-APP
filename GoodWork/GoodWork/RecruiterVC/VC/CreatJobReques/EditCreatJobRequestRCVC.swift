//
//  EditCreatJobRequestRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/04/23.
//

import UIKit
import KMPlaceholderTextView
import DropDown

class EditCreatJobRequestRCVC: BaseVC {
    
    static let storyBoardIdentifier = "EditCreatJobRequestRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var createRequestTitleLabel: UILabel!
    
    @IBOutlet weak var shadowBgView1: UIView!
    @IBOutlet weak var shadowBgView2: UIView!
    @IBOutlet weak var shadowBgView3: UIView!
    @IBOutlet weak var shadowBgView4: UIView!
    @IBOutlet weak var shadowBgView5: UIView!
    @IBOutlet weak var shadowBgView6: UIView!
    @IBOutlet weak var shadowBgView7: UIView!
    
    @IBOutlet weak var jobNameBgView: UIView!
    @IBOutlet weak var specialityJobBgView: UIView!
    @IBOutlet weak var jobLocationBgView: UIView!
    @IBOutlet weak var jobLocation1BgView: UIView!
    @IBOutlet weak var durationBgView: UIView!
    @IBOutlet weak var weeklyPayBgView: UIView!
    @IBOutlet weak var jobDescriptionBgView: UIView!
    
    @IBOutlet weak var jobNameTextField: UITextField!
    
    @IBOutlet weak var jobTypeTextField: UITextField!
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
    
    var obj : DraftApplicationListData?
    var objPublishedList : PublishedListData?
    
    var selectedJobType = 0
    var selectedJobId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.getNurseSpecialitiesAPI()
        self.getWorkLocationAPI()
        self.getWorkDurationAPI()
        
        if self.selectedJobType == 0{
            self.updateDraftJobData()
        }else if self.selectedJobType == 1{
            self.updatePublishedJobData()
        }
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.backButtonImageView.image = UIImage(named: "backButton")
        self.createRequestTitleLabel.addTitleColorAndFont(title: "Create Job Request", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        if self.selectedJobType == 1 {
            self.createRequestTitleLabel.addTitleColorAndFont(title: "Edit Job", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        }
        self.jobDescriptionBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.weeklyPayBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.durationBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.jobLocationBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.jobLocation1BgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        
        self.specialityJobBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.jobNameBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        
        self.shadowBgView1.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView2.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView3.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView4.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView5.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView6.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        self.shadowBgView7.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        self.jobNameTextField.addTitleColorAndFont(placeHolder: "Enter job name", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobNameTextField.text = "Travel Nurse RN PICU"
        
        self.jobTypeTextField.addTitleColorAndFont(placeHolder: "Job type", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.specialityTextField.addTitleColorAndFont(placeHolder: "Specialty", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.specialityTextField.text = ""
        
        self.jobLocationTextField.addTitleColorAndFont(placeHolder: "Enter Job Location (City, State)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobLocationTextField.text = "Memorial Hermann Memorial City Medical "
        
        self.jobLocationTextField.addTitleColorAndFont(placeHolder: "Enter Job Location (City, State)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobLocationTextField.text = "Houston, TX"
        
        
        self.workDurationTextField.addTitleColorAndFont(placeHolder: "Enter Work Duration", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.workDurationTextField.text = "12 weeks"
        
        self.weeklyPayTextField.addTitleColorAndFont(placeHolder: "Enter Weekly Pay", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.weeklyPayTextField.text = "$250/wk"
        
        self.jobDescriptionTextView.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.jobDescriptionTextView.text = "This position is accountable and responsible for nursing care administered under the direction of a Registered Nurse (Nurse Manager, Charge Nurse, and/or Staff Nurse). Nurse interns must utilize personal protective equipment such as gloves, gown, mask."
        
        self.publishedNowButton.addRadiusAndBGColour((self.publishedNowButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        self.buttonActions()
    }
    
    func updateDraftJobData(){
            self.jobTypeTextField.text = obj?.job_title ?? ""
            self.jobNameTextField.text = obj?.job_name ?? ""
            self.specialityTextField.text = obj?.preferred_specialty_definition ?? ""
            self.jobLocationTextField.text = obj?.job_location ?? ""
            self.workDurationTextField.text = obj?.assignment_duration_definition ?? ""
            self.weeklyPayTextField.text =  obj?.preferred_hourly_pay_rate ?? ""
            self.jobDescriptionTextView.text = obj?.description ?? ""
            self.specialityID = obj?.preferred_specialty ?? 0
            self.workLocationID = obj?.preferred_work_location ?? 0
            self.assignmentDurationID = obj?.preferred_assignment_duration ?? 0
            self.selectedJobId = self.obj?.job_id ?? ""
    }
    
    func updatePublishedJobData(){
            self.jobTypeTextField.text = objPublishedList?.job_title ?? "Local"
            self.jobNameTextField.text = objPublishedList?.job_name ?? ""
            self.specialityTextField.text = objPublishedList?.preferred_specialty_definition ?? ""
            self.jobLocationTextField.text = objPublishedList?.job_location ?? ""
            self.workDurationTextField.text = objPublishedList?.assignment_duration_definition ?? ""
            self.weeklyPayTextField.text =  objPublishedList?.preferred_hourly_pay_rate ?? ""
            self.jobDescriptionTextView.text = objPublishedList?.description ?? ""
            self.specialityID = objPublishedList?.preferred_specialty ?? 0
            self.workLocationID = objPublishedList?.preferred_work_location ?? 0
            self.assignmentDurationID = objPublishedList?.preferred_assignment_duration ?? 0
         self.selectedJobId = self.objPublishedList?.job_id ?? ""
    }
}

//MARK:- Button Actions
extension EditCreatJobRequestRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.publishedNowButton.addTarget(self, action: #selector(self.publishedNowButtonPressed(_:)), for: .touchUpInside)
        self.specialitiesDropButton.addTarget(self, action: #selector(self.specialitiesDropButtonPressed(_:)), for: .touchUpInside)
        self.locationDropButton.addTarget(self, action: #selector(self.locationTypeDropButtonPressed(_:)), for: .touchUpInside)
        self.durationDropButton.addTarget(self, action: #selector(self.durationTypeDropButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func publishedNowButtonPressed(_ sender: UIButton){
        print("publishedNowButtonPressed")
        self.updateJobPostAPI()
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

extension EditCreatJobRequestRCVC {
    
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
                        
//                        if self.nurseLocation?.data?.count != 0 {
//                            self.jobLocationTextField.text = ""
//                            self.workLocationID = 0
//                        }
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
                        
//                        if self.assignmentDuration?.data?.count != 0 {
//                            self.jobLocationTextField.text = ""
//                            self.workLocationID = 0
//                        }
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
    
    func updateJobPostAPI(){
        
        var mdl = UpdateJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.job_name = self.jobNameTextField.text ?? ""
        mdl.preferred_specialty = "\(self.specialityID)"
        mdl.preferred_work_location = "\(self.workLocationID)"
        mdl.preferred_assignment_duration = "\(self.assignmentDurationID)"
        mdl.preferred_hourly_pay_rate = self.weeklyPayTextField.text ?? ""
        mdl.description = self.jobDescriptionTextView.text ?? ""
        mdl.job_id = self.selectedJobId
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.updateJobPostRCAPI(rqst: mdl) { (dict, error) in
            
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
}

extension EditCreatJobRequestRCVC {
    
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
