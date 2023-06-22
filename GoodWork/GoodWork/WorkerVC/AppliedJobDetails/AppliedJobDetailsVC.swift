//
//  AppliedJobDetailsVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 15/04/23.
//

import UIKit

class AppliedJobDetailsVC: BaseVC{
    
    static let storyBoardIdentifier = "AppliedJobDetailsVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
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
    
    @IBOutlet weak var recentlyAddedLable: UILabel!
    
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var jobDetailsLabel: UILabel!
    
    @IBOutlet weak var aboutJobLable: UILabel!
    
    @IBOutlet weak var popularJobsLable: UILabel!
    
    @IBOutlet weak var alreadyAppliedButton: UIButton!
    
    @IBOutlet weak var popularJobsCollectionView: UICollectionView!
    
    @IBOutlet weak var saveunSaveJobButton: UIButton!
    
    var states = true
    
    var selectedJobTypeNo = 0
    
    var myAppliedJobOBJ : MyAppliedJobListData?
    var exploreJobOBJ : Popular_jobs?
    var browseJobOBJ : BrowseJobsData?
    var mySavedJobOBJ : MySavedJobListData?
    
    var isFromExplore = false
    var isFromPopularJob = false
    var isFromBrowseJob = false
    var isFromSavedJob = false
    
    var selectedJobIndex = 0
    
    var selectedJobID = ""
    
    var popularJob : PopularJobList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
        
        if self.selectedJobTypeNo == 1 {
            
        }else if self.selectedJobTypeNo == 3 {
            self.popularJobsLable.isHidden = true
            self.popularJobsCollectionView.isHidden = true
            self.alreadyAppliedButton.addRadiusBGColorTitleColorFont(title: "Chat Now", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 16, radius: self.alreadyAppliedButton.frame.height / 2, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appOffWhite)
        }else if self.selectedJobTypeNo == 4 {
            self.popularJobsLable.isHidden = true
            self.popularJobsCollectionView.isHidden = true
            self.alreadyAppliedButton.isHidden = true
        }
        
        if self.isFromExplore{
            self.updateAppliedJObdetailsExplore(self.exploreJobOBJ)
        }else if self.isFromBrowseJob{
            self.updateAppliedJObdetailsBrows(self.browseJobOBJ)
        }else if self.isFromSavedJob{
            self.updateJobdetailsSavedJob(self.mySavedJobOBJ)
        }else{
            self.updateAppliedJObdetails(self.myAppliedJobOBJ)
        }
        
        self.popularJobsCollectionView.reloadData()
        
       
        
        if appDelegate.isFromApplyJob{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.popularJobAPI(false)
            }
            self.appliedJobAlertView()
            appDelegate.isFromApplyJob = false
            
        }else{
            self.popularJobAPI(true)
        }
        
        
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "roundTopTwoColour")
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.shareImageView.image = UIImage(named: "share")
        
        self.shareBgView.addRadiusAndBGColour((self.shareBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.bottomLeftImageView.image = UIImage(named: "leftBottom")
        self.buttonActions()
        self.jobDetailViewSetUP()
        self.loadCollectionview()
    }
    
    func jobDetailViewSetUP(){
        
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
        
        
        self.descriptionLable.addTitleColorAndFont(title: "Description", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
      
        
        self.aboutJobLable.addTitleColorAndFont(title: "About job", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.popularJobsLable.addTitleColorAndFont(title: "Popular  jobs", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 17, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.alreadyAppliedButton.addRadiusBGColorTitleColorFont(title: "Already Applied", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 16, radius: self.alreadyAppliedButton.frame.height / 2, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.jobDetailsLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 13)
        self.jobDetailsLabel.numberOfLines = 0
      //  self.readMore()
        
    }
    
//    func readMore(){
//        let currentSource = preparedSources()[0]
//
//        self.jobDetailsLabel.setLessLinkWith(lessLink: "Read Less", attributes: [.foregroundColor: GoodWorkAppColor.appDarkPurple], position: currentSource.textAlignment)
//
//        self.jobDetailsLabel.shouldCollapse = true
//        self.jobDetailsLabel.textReplacementType = currentSource.textReplacementType
//        self.jobDetailsLabel.numberOfLines = currentSource.numberOfLines
//        self.jobDetailsLabel.collapsed = states
//        self.jobDetailsLabel.text = currentSource.text
//        self.jobDetailsLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 13)
//    }
    
//    func preparedSources() -> [(text: String, textReplacementType: ExpandableLabel.TextReplacementType, numberOfLines: Int, textAlignment: NSTextAlignment)] {
//
//        return [(loremIpsumText(), .word, 3, .left)]
//    }
//
//    func loremIpsumText() -> String {
//        return self.myAppliedJobOBJ?.description ?? ""
//    }
//
//    func didExpandLabel(_ label: ExpandableLabel) {
//        self.states = false
//        readMore()
//    }
    
    
//    func didCollapseLabel(_ label: ExpandableLabel) {
//        self.states = true
//        readMore()
//    }
//
//    func willExpandLabel(_ label: ExpandableLabel) {
//
//    }
//
//    func willCollapseLabel(_ label: ExpandableLabel) {
//
//    }
}

//MARK:- Button Actions
extension AppliedJobDetailsVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.saveunSaveJobButton.addTarget(self, action: #selector(self.saveunSaveJobButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveunSaveJobButtonPressed(_ sender: UIButton){
        print("saveunSaveJobButtonPressed")
        
        if self.isFromExplore{
            self.saveJobAPI(jobID: self.exploreJobOBJ?.job_id ?? "")
        }else if self.isFromBrowseJob{
            self.saveJobAPI(jobID: self.browseJobOBJ?.job_id ?? "")
        }else if self.isFromSavedJob{
            self.saveJobAPI(jobID: self.mySavedJobOBJ?.job_id ?? "")
        } else{
            self.saveJobAPI(jobID: self.myAppliedJobOBJ?.job_id ?? "")
        }
    }
}


extension AppliedJobDetailsVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func loadCollectionview(){
        self.popularJobsCollectionView.register(UINib(nibName: PopularJobsCollectionCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: PopularJobsCollectionCell.reuseCellIdentifier)
        self.popularJobsCollectionView.delegate = self
        self.popularJobsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.popularJob?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularJobsCollectionCell.reuseCellIdentifier, for: indexPath) as! PopularJobsCollectionCell
        cell.updateAppliedJobCellData(self.popularJob?.data?[indexPath.row])
//        cell.applyButton.setTitle("Apply Now", for: .normal)
        
        cell.saveJobButton.tag = indexPath.row
        cell.saveJobButton.addTarget(self, action: #selector(self.savePopularJobButtonAction(sender:)), for: .touchUpInside)
        cell.applyButton.isHidden = false
        cell.applyButton.tag = indexPath.row
        cell.applyButton.addTarget(self, action: #selector(self.applyJobButtonAction(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = (self.popularJobsCollectionView.frame.width * 0.8)
        print("self.popularJobsCollectionView.frame.width \(self.popularJobsCollectionView.frame.width)")
        return CGSize(width: collectionViewWidth, height: 178)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("indexPath.row\(indexPath.row)")
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func savePopularJobButtonAction(sender: UIButton){
        print("savePopularJobButtonAction")
        self.selectedJobIndex = sender.tag
        self.isFromPopularJob = true
        self.saveJobAPI(jobID : self.popularJob?.data?[sender.tag].job_id ?? "")
    }
    
    @objc func applyJobButtonAction(sender: UIButton){
        print("applyJobButtonAction")
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
        vc.selectedJobID = self.popularJob?.data?[sender.tag].job_id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AppliedJobDetailsVC {
    
    
    func updateAppliedJObdetails(_ objNEW : MyAppliedJobListData?){
        if objNEW?.applied_nurses ?? "" == "0" {
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        self.jobDetailsLabel.text =  objNEW?.description ?? ""
    }
    
    func updateAppliedJObdetailsExplore(_ objNEW : Popular_jobs?){
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
            
        
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
    //    print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? "0" == "1"{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        
        self.jobDetailsLabel.text =  objNEW?.description ?? ""
    }
    
    func updateAppliedJObdetailsBrows(_ objNEW : BrowseJobsData?){
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        self.jobDetailsLabel.text =  objNEW?.description ?? ""
       
    }
    
    func updateJobdetailsSavedJob(_ objNEW : MySavedJobListData?){
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        self.jobDetailsLabel.text =  objNEW?.description ?? ""
       
    }
}

extension AppliedJobDetailsVC {
    func saveJobAPI(jobID : String){
       
        var mdl = SaveNewJobRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        mdl.job_id = jobID
        mdl.role = "nurse"
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.saveNewJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    if self.isFromExplore {
                        if self.exploreJobOBJ?.is_saved == "0" {
                            self.exploreJobOBJ?.is_saved = "1"
                            self.saveJobAlertView()
                        }else{
                            self.exploreJobOBJ?.is_saved = "0"
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        self.updateAppliedJObdetailsExplore(self.exploreJobOBJ)
                    }else if self.isFromPopularJob {
                        self.isFromPopularJob = false
                        
                        if self.popularJob?.data?[self.selectedJobIndex].is_saved == "0" {
                            self.popularJob?.data?[self.selectedJobIndex].is_saved = "1"
                            self.saveJobAlertView()
                        }else{
                            self.popularJob?.data?[self.selectedJobIndex].is_saved = "r0"
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        self.popularJobsCollectionView.reloadData()
                    }else if self.isFromBrowseJob{
                        if self.browseJobOBJ?.is_saved == 0 {
                            self.browseJobOBJ?.is_saved = 1
                            self.saveJobAlertView()
                        }else{
                            self.browseJobOBJ?.is_saved = 0
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        self.updateAppliedJObdetailsBrows(self.browseJobOBJ)
                    }else if self.isFromSavedJob{
                        if self.mySavedJobOBJ?.is_saved == 0 {
                            self.mySavedJobOBJ?.is_saved = 1
                            self.saveJobAlertView()
                        }else{
                            self.mySavedJobOBJ?.is_saved = 0
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        self.updateJobdetailsSavedJob(self.mySavedJobOBJ)
                    }else{
                        if self.myAppliedJobOBJ?.is_saved == 0 {
                            self.myAppliedJobOBJ?.is_saved = 1
                            self.saveJobAlertView()
                        }else{
                            self.myAppliedJobOBJ?.is_saved = 0
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        self.updateAppliedJObdetails(self.myAppliedJobOBJ)
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                self.stopLoading()
            }
        }
    }
}

extension AppliedJobDetailsVC {
    
    func popularJobAPI(_ isLoader : Bool){
        
        if isLoader{
            self.startLoading()
        }
        
        var mdl = PopularJobRequest()
        mdl.job_id = self.selectedJobID
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        LoginDataManager.shared.popularJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let popularJobResp = try JSONDecoder().decode(PopularJobList.self, from: jsonData)
                        
                        self.popularJob = popularJobResp
                        
                        print("do self.popularJob: \(self.popularJob)")
                        
                        if self.popularJob?.api_status == "1"{
                            print("if self.popularJob?.api_status")
                        }else{
                            print("falsee")
                        }
                    }catch{
                        print("error \(error)")
                        print("catch \(error.localizedDescription)")
                        self.navigationController?.popViewController(animated: true)
                        self.notificationBanner("Something went wrong please try again")
                    }
                }else{
                    print("False")
//                    self.notificationBanner(response["message"] as? String ?? "")
                    self.navigationController?.popViewController(animated: true)
                    self.notificationBanner("Something went wrong please try again")
                }
                
                self.popularJobsCollectionView.reloadData()
                
                self.stopLoading()
            }
        }
    }
}
