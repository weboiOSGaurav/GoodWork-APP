//
//  JobDetailsVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 30/03/23.
//

import UIKit


class JobDetailsVC: BaseVC{
    
    static let storyBoardIdentifier = "JobDetailsVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    @IBOutlet weak var backButtonImageView: UIImageView!
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
    
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    
    @IBOutlet weak var jobDetailsLabel: UILabel!
    
    @IBOutlet weak var aboutJobLabel: UILabel!
    @IBOutlet weak var preferredShiftTitleLabel: UILabel!
    @IBOutlet weak var preferredShiftLabel: UILabel!
    
    @IBOutlet weak var relevantExpTitleLabel: UILabel!
    @IBOutlet weak var relevantExpLabel: UILabel!
    
    @IBOutlet weak var emrTitleLabel: UILabel!
    @IBOutlet weak var emrLabel: UILabel!
    
    @IBOutlet weak var meditechLabel: UILabel!
    @IBOutlet weak var meditechExperiLabel: UILabel!
    
    @IBOutlet weak var epicLabel: UILabel!
    @IBOutlet weak var epicExperiLabel: UILabel!
    
    @IBOutlet weak var recruterLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    @IBOutlet weak var applyJobButton: UIButton!
    
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    
    var states = true
    
    var selectedJobID = ""
    
    var jobDetails : JobDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.jobDetailsLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) { // As soon as vc appears
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
        self.jobDetailsAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "roundTopTwoColour")
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.shareImageView.image = UIImage(named: "share")
        
        self.shareBgView.addRadiusAndBGColour((self.shareBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        
        
        self.descriptionTitleLabel.addTitleColorAndFont(title: "Description", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        
        self.aboutJobLabel.addTitleColorAndFont(title: "About job", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.preferredShiftTitleLabel.addTitleColorAndFont(title: "Preferred shift:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.preferredShiftLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.relevantExpTitleLabel.addTitleColorAndFont(title: "Relevant experience:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.relevantExpLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.emrTitleLabel.addTitleColorAndFont(title: "EMR:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.emrLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.meditechLabel.addTitleColorAndFont(title: "Meditech:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.meditechExperiLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.epicLabel.addTitleColorAndFont(title: "Epic:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.epicExperiLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.recruterLabel.addTitleColorAndFont(title: "Recruiter", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.userProfileImageView.image = UIImage(named: "profile")
        
        self.userNameLabel.addTitleColorAndFont(title: "Emma Watson", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.applyJobButton.addRadiusBGColorTitleColorFont(title: "Apply", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 16, radius: 28, bgColor: GoodWorkAppColor.appDarkPurple, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.bottomLeftImageView.image = UIImage(named: "leftBottom")
        
        
        self.buttonActions()
        self.jobDetailViewSetUP()
    }
    
    func jobDetailViewSetUP(){
        
        self.popularJobMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 16)
        self.shadowBgView.shadowWithRadiusAndColour(16,GoodWorkAppColor.appArsenic)
        
        
        self.jobTypeLable.addTitleColorAndFont(title: "Travel", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appliedNumberLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.saveJobImageView.image = UIImage(named: "saveJob")
        
        self.jobTitleLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.jobDescriptionLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.jobLocationBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.locationImageView.image = UIImage(named: "location")
        self.jobLocationLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.calendarBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.calendarImageView.image = UIImage(named: "calendar")
        self.jobCalanderWksLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.dollarImageView.image = UIImage(named: "dollarcircle")
        self.jobAmountLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.recentlyAddedLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMediumItalic, fontSize: 10, tintColor: GoodWorkAppColor.appColour)
        
        self.applyButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        self.jobDetailsLabel.text = ""
        self.jobDetailsLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 13)
    }
}

//MARK:- Button Actions
extension JobDetailsVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.applyJobButton.addTarget(self, action: #selector(self.applyJobButtonPressed(_:)), for: .touchUpInside)
        self.applyButton.addTarget(self, action: #selector(self.applyButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func applyButtonPressed(_ sender: UIButton){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ApplyJobWithProfileVC.storyBoardIdentifier) as? ApplyJobWithProfileVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func applyJobButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
       
        if appDelegate.nurseProfile?.data?.isUserProfile ?? "" == "true"{
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ApplyJobWithProfileVC.storyBoardIdentifier) as? ApplyJobWithProfileVC else { return }
          
//            vc.selectedJobID = self.selectedJobID
            vc.jobDetails = self.jobDetails
            
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ApplyJobWithoutProfileUpdateVC.storyBoardIdentifier) as? ApplyJobWithoutProfileUpdateVC else { return }
            
            vc.selectedJobID = self.selectedJobID
            vc.jobDetails = self.jobDetails
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton){
        print("saveButtonPressed")
        
        var isJobLike = 0
        
        if self.jobDetails?.data?[0].is_saved == 0{
            isJobLike = 1
        }else{
            isJobLike = 0
        }
        
        self.saveJobAPI(self.jobDetails?.data?[0].job_id ?? "", isSaved: isJobLike)
    }
}

extension JobDetailsVC {
    
    func updateJobDetails(){
        if self.jobDetails?.data?.count != 0 {
            
            if self.jobDetails?.data?[0].keyword_title
                ?? "" != "" {
                self.jobTypeLable.text = self.jobDetails?.data?[0].keyword_title ?? ""
            }else{
                self.jobTypeLable.text = "Travel"
            }
            
//            self.appliedNumberLable.text =  "+\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
            
            if self.jobDetails?.data?[0].applied_nurses ?? "" == "0"{
                self.appliedNumberLable.text =  "\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
            }else{
                self.appliedNumberLable.text =  "+\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
            }
            
            self.jobTitleLable.text = self.jobDetails?.data?[0].job_name ?? ""
            self.jobDescriptionLable.text = self.jobDetails?.data?[0].name ?? ""
            
    //        self.jobLocationLable.text = "\(self.jobDetails?.data?[0].city ?? ""), \(self.jobDetails?.data?[0].state ?? "")"
            
            self.jobLocationLable.text = "\(self.jobDetails?.data?[0].job_location ?? "")"
            
            self.jobCalanderWksLable.text = "\(self.jobDetails?.data?[0].hours_per_week ?? 0) wks"
            
            self.jobAmountLable.text = "\(self.jobDetails?.data?[0].weekly_pay ?? 0)/wks"
            
            self.preferredShiftLabel.text = self.jobDetails?.data?[0].shift
            
            if Int(self.jobDetails?.data?[0].preferred_experience ?? "") ?? 0 > 1 {
                self.relevantExpLabel.text = "\(self.jobDetails?.data?[0].preferred_experience ?? "") years"
            }else{
                self.relevantExpLabel.text = "\(self.jobDetails?.data?[0].preferred_experience ?? "") year"
            }
            
            self.meditechExperiLabel.text = self.jobDetails?.data?[0].job_meditech_exp_definition ?? ""
            self.epicExperiLabel.text = self.jobDetails?.data?[0].job_epic_exp_definition ?? ""
            
            self.recentlyAddedLable.text =   self.jobDetails?.data?[0].created_at_definition ?? ""
            
            if self.jobDetails?.data?[0].is_saved == 1{
                self.saveJobImageView.image = UIImage(named: "saveJob")
                print("saveJob image")
            }else{
                self.saveJobImageView.image = UIImage(named: "unSaveJob")
                print("unSaveJob")
            }
            
            self.jobDetailsLabel.text = self.jobDetails?.data?[0].description ?? ""
        }
    }
}

extension JobDetailsVC{
    
    func jobDetailsAPI(){
        
        var mdl = JobDetailsRequest()
        mdl.id = self.selectedJobID
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.jobDetails(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let jobDetailsResp = try JSONDecoder().decode(JobDetails.self, from: jsonData)
                        
                        self.jobDetails = jobDetailsResp
                        
                        print("do nurseProfile: \(self.jobDetails)")
                        
                        if self.jobDetails?.api_status == "1"{
                            self.updateJobDetails()
                        }else{
                            print("falsee")
                        }
                        
                    }catch{
                        print("catch \(error.localizedDescription)")
                    }
                 }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.stopLoading()
            }
        }
    }
    
    func saveJobAPI(_ jobID : String, isSaved : Int){
        
        var mdl = SaveNewJobRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        mdl.job_id = jobID
        
//        var mdl = likeJobRequest()
//        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
//        mdl.job_id = jobID
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.saveNewJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    self.jobDetails?.data?[0].is_saved = isSaved
                    
                    if self.jobDetails?.data?[0].is_saved == 1{
                        self.saveJobImageView.image = UIImage(named: "saveJob")
                        print("saveJob image")
                        self.saveJobAlertView()
                    }else{
                        self.saveJobImageView.image = UIImage(named: "unSaveJob")
                        print("unSaveJob")
                        self.notificationBanner(response["message"] as? String ?? "")
                    }
                    
                    print("isSaved: \(isSaved)")
//                    self.notificationBanner(response["message"] as? String ?? "")
                 }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.stopLoading()
            }
        }
    }
}


extension String {
    
    func specialPriceAttributedStringWith(_ color: UIColor) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int),
                          .foregroundColor: color, .font: fontForPrice()]
        return NSMutableAttributedString(attributedString: NSAttributedString(string: self, attributes: attributes))
    }
    
    func priceAttributedStringWith(_ color: UIColor) -> NSAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor: color, .font: fontForPrice()]
        
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    func priceAttributedString(_ color: UIColor) -> NSAttributedString {
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        
        return NSAttributedString(string: self, attributes: attributes)
    }
    
    fileprivate func fontForPrice() -> UIFont {
        return UIFont(name: "Helvetica-Neue", size: 13) ?? UIFont()
    }
}
