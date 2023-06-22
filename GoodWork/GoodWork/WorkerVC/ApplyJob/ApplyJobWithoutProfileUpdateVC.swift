//
//  ApplyJobWithoutProfileUpdateVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 31/03/23.
//

import UIKit

class ApplyJobWithoutProfileUpdateVC: BaseVC {
    
    static let storyBoardIdentifier = "ApplyJobWithoutProfileUpdateVC"
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareBgView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
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
    
    @IBOutlet weak var jobNoteLable: UILabel!
    
    @IBOutlet weak var recentlyAddedLable: UILabel!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var centerMessageBigImageView: UIImageView!
    @IBOutlet weak var rightSideBottomImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var applyNowButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var selectedJobID = ""
    
    var jobDetails : JobDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.jobDetailViewSetUP()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateJobDetails()
    }
    
    func jobDetailViewSetUP(){
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.popularJobMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 16)
        self.shadowBgView.shadowWithRadiusAndColour(16,GoodWorkAppColor.appArsenic)
        
        
        self.jobTypeLable.addTitleColorAndFont(title: "Travel", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appliedNumberLable.addTitleColorAndFont(title: "+50 Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.jobNoteLable.addTitleColorAndFont(title: "You are missing some information that may be useful to the\n\nrecruiter for this job. Would you like to update your profile\n\nbefore applying?", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        
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
        
        self.centerMessageBigImageView.image = UIImage(named: "messageBigView")
        self.rightSideBottomImageView.image = UIImage(named: "bottomLeftRoundImg")
        
        self.profileButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        //        self.profileButton.addRadiusBGColorTitleColorFont(title: "Yes, go to my profile", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 11, radius: 23, bgColor: GoodWorkAppColor.appWhite, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.applyNowButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        //        self.applyNowButton.addRadiusBGColorTitleColorFont(title: "Apply now", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 11, radius: 23, bgColor: GoodWorkAppColor.appDarkPurple, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.buttonActions()
    }
}


//MARK:- Button Actions
extension ApplyJobWithoutProfileUpdateVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        
        self.applyNowButton.addTarget(self, action: #selector(self.applyJobButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func applyJobButtonPressed(_ sender: UIButton){
        
        self.applyForJobAPI()
        
        
        //        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ApplyJobWithProfileVC.storyBoardIdentifier) as? ApplyJobWithProfileVC else { return }
        //        self.navigationController?.pushViewController(vc, animated: true)
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
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileVC.storyBoardIdentifier) as? MyProfileVC else { return }
        vc.isFromEditInfo = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ApplyJobWithoutProfileUpdateVC {
    
    func updateJobDetails(){
        
        self.jobTypeLable.text = "Travel"
        self.appliedNumberLable.text =  "+\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
        
        if self.jobDetails?.data?[0].applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text =  "\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text =  "+\(self.jobDetails?.data?[0].applied_nurses ?? "") Applied"
        }
        
        self.jobTitleLable.text = self.jobDetails?.data?[0].job_name ?? ""
        
        self.jobDescriptionLable.text = self.jobDetails?.data?[0].name ?? ""
        
        self.jobLocationLable.text = "\(self.jobDetails?.data?[0].city ?? ""), \(self.jobDetails?.data?[0].state ?? "")"
        
        self.jobCalanderWksLable.text = "\(self.jobDetails?.data?[0].hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(self.jobDetails?.data?[0].weekly_pay ?? 0)/wk"
        
        self.recentlyAddedLable.text =   self.jobDetails?.data?[0].created_at_definition ?? ""
        
        if self.jobDetails?.data?[0].is_saved == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
}

extension ApplyJobWithoutProfileUpdateVC {
    
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
        mdl.job_id = self.selectedJobID
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.start_date = Date.getCurrentDate()
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

extension UINavigationController {
    
    func popBack(_ nb: Int) {
        let viewControllers: [UIViewController] = self.viewControllers
        guard viewControllers.count < nb else {
            self.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
            return
        }
    }
}

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy/MM/dd"

        return dateFormatter.string(from: Date())
    }
}
