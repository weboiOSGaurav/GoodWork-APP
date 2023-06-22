//
//  ApplyJobWithProfileVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 31/03/23.
//

import UIKit

class ApplyJobWithProfileVC: BaseVC {
    
    static let storyBoardIdentifier = "ApplyJobWithProfileVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareBgView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var popularJobMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var jobTypeLable: UILabel!
    @IBOutlet weak var appliedNumberLable: UILabel!
    @IBOutlet weak var saveJobImageView: UIImageView!
    @IBOutlet weak var jobTitleLable: UILabel!
    @IBOutlet weak var jobDescriptionLable: UILabel!
    
    @IBOutlet weak var jobLocationBgView: UIView!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var jobLocationLable: UILabel!
    
    @IBOutlet weak var calendarBgView: UIView!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var jobCalanderWksLable: UILabel!
    
    @IBOutlet weak var amountBgView: UIView!
    @IBOutlet weak var dollarImageView: UIImageView!
    @IBOutlet weak var jobAmountLable: UILabel!
    
    @IBOutlet weak var recentlyAddedLable: UILabel!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var topRightMessageBigImageView: UIImageView!
    @IBOutlet weak var rightSideBottomImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var applyNowButton: UIButton!
    
    
    @IBOutlet weak var yourInfoLable: UILabel!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var emailIDLable: UILabel!
    @IBOutlet weak var phoneNumberLable: UILabel!
    
    @IBOutlet weak var liceTitleLable: UILabel!
    @IBOutlet weak var liceDetailsLable: UILabel!
    
    @IBOutlet weak var certificationTitleLable: UILabel!
    @IBOutlet weak var certificationLable: UILabel!
    
    @IBOutlet weak var documentTitleLable: UILabel!
    
    @IBOutlet weak var resumeLable: UILabel!
    @IBOutlet weak var workExpLable: UILabel!
    @IBOutlet weak var expLatterLable: UILabel!
    
    @IBOutlet weak var whenYouStartTitleLable: UILabel!
    
    @IBOutlet weak var startDateBGView: UIView!
    @IBOutlet weak var startDateShadowBGView: UIView!
    
    @IBOutlet weak var startDateTextField: UITextField!
    
    @IBOutlet weak var dotView1: UIView!
    @IBOutlet weak var dotView2: UIView!
    @IBOutlet weak var dotView3: UIView!
    
    @IBOutlet weak var resumeView: UIView!
    @IBOutlet weak var expView: UIView!
    @IBOutlet weak var expLatterView: UIView!
    
    private lazy var startDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    var jobDetails : JobDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.jobDetailViewSetUP()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.jobDetail()
        self.startDateTextField.text = ""
    }
    
    func jobDetailViewSetUP(){
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.popularJobMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 16)
        
        self.shadowBgView.shadowWithRadiusAndColour(16,GoodWorkAppColor.appArsenic)
        
        self.jobTypeLable.addTitleColorAndFont(title: "Travel", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appliedNumberLable.addTitleColorAndFont(title: "+50 Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.saveJobImageView.image = UIImage(named: "saveJob")
        
        self.jobTitleLable.addTitleColorAndFont(title: "Manager CRNA - Anesthesia", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.jobDescriptionLable.addTitleColorAndFont(title: "Medical Solutions Recruiter", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.jobLocationBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.locationImageView.image = UIImage(named: "location")
        self.jobLocationLable.addTitleColorAndFont(title: "Los Angeles, CA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.calendarBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.calendarImageView.image = UIImage(named: "calendar")
        self.jobCalanderWksLable.addTitleColorAndFont(title: "10 wks", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.dollarImageView.image = UIImage(named: "dollarcircle")
        self.jobAmountLable.addTitleColorAndFont(title: "2500/wk", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.recentlyAddedLable.addTitleColorAndFont(title: "Recently Added", fontName: GoodWorkAppFontName.NeueKabelMediumItalic, fontSize: 10, tintColor: GoodWorkAppColor.appColour)
        
        self.applyButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        
        self.topRightMessageBigImageView.image = UIImage(named: "messageCroseView")
        self.rightSideBottomImageView.image = UIImage(named: "bottomLeftRoundImg")
        
        self.profileButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        //        self.profileButton.addRadiusBGColorTitleColorFont(title: "Yes, go to my profile", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 11, radius: 23, bgColor: GoodWorkAppColor.appWhite, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.applyNowButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        //        self.applyNowButton.addRadiusBGColorTitleColorFont(title: "Apply now", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 11, radius: 23, bgColor: GoodWorkAppColor.appDarkPurple, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.setUI()
    }
    
    func setUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.yourInfoLable.addTitleColorAndFont(title: "Your Information", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.userNameLable.addTitleColorAndFont(title: "James Bond", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.emailIDLable.addTitleColorAndFont(title: "jamesnurse01@gmail.com", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.phoneNumberLable.addTitleColorAndFont(title: "(419) 405-xxxx", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.liceTitleLable.addTitleColorAndFont(title: "Licenses:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.liceDetailsLable.addTitleColorAndFont(title: "BLS", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.certificationTitleLable.addTitleColorAndFont(title: "Certifications:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.certificationLable.addTitleColorAndFont(title: "BLS", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.documentTitleLable.addTitleColorAndFont(title: "Documents:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        
        self.resumeLable.addTitleColorAndFont(title: "Resume.pdf", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.workExpLable.addTitleColorAndFont(title: "WorkExperience.pdf", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.expLatterLable.addTitleColorAndFont(title: "ExperienceLetter.pdf", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.whenYouStartTitleLable.addTitleColorAndFont(title: "When whould you like to start?", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.startDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.startDateShadowBGView.shadowWithRadiusAndColour(16,GoodWorkAppColor.appArsenic)
        
        self.startDateTextField.updateCursorColour()
        
        self.startDateTextField.text = "04-04-2023"
        
        self.dotView1.addRadiusAndBGColour((self.dotView1.frame.height/2), GoodWorkAppColor.appColour)
        self.dotView2.addRadiusAndBGColour((self.dotView1.frame.height/2), GoodWorkAppColor.appColour)
        self.dotView3.addRadiusAndBGColour((self.dotView1.frame.height/2), GoodWorkAppColor.appColour)
        self.setUPDatePicker()
        self.buttonActions()
    }
    
    func jobDetail(){
        self.jobTypeLable.text = "Travel"
//        self.appliedNumberLable.text =  "+\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
        
        if self.jobDetails?.data?[0].applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text =  "\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text =  "+\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
        }
        
        self.jobTitleLable.text = self.jobDetails?.data?[0].job_name ?? ""
        
        self.jobDescriptionLable.text = self.jobDetails?.data?[0].name ?? ""
        
        self.jobLocationLable.text = "\(self.jobDetails?.data?[0].job_location ?? "")"
        
        self.jobCalanderWksLable.text = "\(self.jobDetails?.data?[0].hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(self.jobDetails?.data?[0].weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text =   self.jobDetails?.data?[0].created_at_definition ?? ""
        
        if self.jobDetails?.data?[0].is_saved == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        
        self.userNameLable.text = appDelegate.nurseProfile?.data?.fullName ?? ""
        self.emailIDLable.text = appDelegate.nurseProfile?.data?.email ?? ""
        
        var mobile = "\(appDelegate.nurseProfile?.data?.mobile ?? "")"
        mobile = String(mobile.dropLast(3))
        mobile = mobile + "XXXX"
        self.phoneNumberLable.text = mobile
        
        self.liceDetailsLable.text = appDelegate.nurseProfile?.data?.license_type_definition ?? ""
        
        if appDelegate.nurseProfile?.data?.certitficate?.count != 0 {
            self.certificationLable.text = appDelegate.nurseProfile?.data?.certitficate?[0].type_definition ?? ""
        }else{
            self.certificationLable.text = ""
        }
        
        if appDelegate.nurseProfile?.data?.resume ?? "" == "" {
            self.resumeView.isHidden = true
        }else{
            let lastPathOfResume = URL(string: appDelegate.nurseProfile?.data?.resume ?? "")?.lastPathComponent
            self.resumeLable.text = "\(lastPathOfResume ?? "")"
            self.resumeView.isHidden = false
        }
    }
}

//MARK:- Button Actions
extension ApplyJobWithProfileVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.applyNowButton.addTarget(self, action: #selector(self.appyJobButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func appyJobButtonPressed(_ sender: UIButton){
        print("appyJobButtonPressed")
            
        if self.startDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.startDate.rawValue)
            return
     }
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppliedJobAlertVC") as! AppliedJobAlertVC
//        vc.modalPresentationStyle = .overCurrentContext
//        self.present(vc, animated: true, completion: nil)
//        
        self.applyForJobAPI()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton){
        
        let obj = self.jobDetails?.data?[0]
        
        var isJobLike = 0
        
        if obj?.is_saved ?? 0 == 0{
            isJobLike = 1
        }else{
            isJobLike = 0
        }
        
        self.saveJobAPI(obj?.job_id ?? "", isJobLike)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileVC.storyBoardIdentifier) as? MyProfileVC else { return }
        vc.isFromEditInfo = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ApplyJobWithProfileVC {
    
    func saveJobAPI(_ jobID : String, _ isSaved : Int){
        
        var mdl = SaveNewJobRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        mdl.job_id = jobID
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.saveNewJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    print("isSaved: \(isSaved)")
                    self.notificationBanner(response["message"] as? String ?? "")
                    if isSaved == 1{
                        self.saveJobImageView.image = UIImage(named: "saveJob")
                        self.saveJobAlertView()
                    }else{
                        self.saveJobImageView.image = UIImage(named: "unSaveJob")
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
    
    func applyForJobAPI(){
        
        var mdl = ApplyJobRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        mdl.job_id = self.jobDetails?.data?[0].job_id ?? ""
        mdl.start_date = self.startDateTextField.text ?? ""
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.applyJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    appDelegate.isFromApplyJob = true
                    self.navigationController?.popBack(3)
                }else{
                    
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                self.stopLoading()
            }
        }
    }
}

extension ApplyJobWithProfileVC {
    func setUPDatePicker(){
        self.startDateTextField.inputView = self.startDatePicker
        
        if #available(iOS 14, *) {
            self.startDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.startDatePicker.addTarget(self, action: #selector(self.handleStartDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleStartDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.startDateTextField.text = formatter.string(from: sender.date)
    }
}
