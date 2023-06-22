//
//  BookMarkVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 13/04/23.
//

import UIKit

class BookMarkVC: BaseVC {
    
    
    static let storyBoardIdentifier = "BookMarkVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var myWorkTitleLabel: UILabel!
    
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationBGView: UIView!
    
    @IBOutlet weak var jobListTableView: UITableView!
    
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var appliedLabel: UILabel!
    @IBOutlet weak var offeredLabel: UILabel!
    @IBOutlet weak var hiredLabel: UILabel!
    @IBOutlet weak var pastLabel: UILabel!
    
    @IBOutlet weak var noDataLabel: UILabel!
    
    var selectedJobTypeNumber = 0
    
    var mySavedJobList : MySavedJobList?
    var myAppliedJobList : MyAppliedJobList?
    var myHiredJobsList : MyHiredJobs?
    var myPastJobsList : MyPastJobs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
        if appDelegate.nurseProfile?.data?.image ?? "" != ""{
            
            self.profileImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "profileDemo"))
        }else{
            self.profileImageView.image = UIImage(named: "profileDemo")
        }
        
        self.noDataLabel.isHidden = true
        
        if appDelegate.isFromApplyJob{
            self.appliedJobAlertView()
            appDelegate.isFromApplyJob = false
        }
        
        self.jobListTableView.reloadData()
        
        if self.selectedJobTypeNumber == 0 {
            self.mySavedJobListAPI()
        }else if self.selectedJobTypeNumber == 1{
            self.myAppliedJobListAPI()
        }else if self.selectedJobTypeNumber == 2{
            self.myOfferedJobsAPI()
        }else if self.selectedJobTypeNumber == 3{
            self.myHiredJobsAPI()
        }else if self.selectedJobTypeNumber == 4{
            self.myPastJobsAPI()
        }
        
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "homeRightSideTop")
        self.profileImageView.image = UIImage(named: "drProfile")
        
        self.myWorkTitleLabel.addTitleColorAndFont(title: "My Work Journey", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.notificationImageView.image = UIImage(named: "notification")
        self.notificationBGView.addRadiusAndBGColour((self.notificationBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.savedLabel.addTitleColorAndFont(title: "Saved", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.appliedLabel.addTitleColorAndFont(title: "Applied", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.offeredLabel.addTitleColorAndFont(title: "Offered", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.hiredLabel.addTitleColorAndFont(title: "Hired", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.hiredLabel.addTitleColorAndFont(title: "Hired", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.pastLabel.addTitleColorAndFont(title: "Past", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        
        
        
        //self.savedButton.addRadiusBGColorTitleColorFont(title: "Saved", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 15, radius: 0, bgColor: .clear, tintColor: GoodWorkAppColor.appDarkPurple)
        
        //        self.appliedButton.addRadiusBGColorTitleColorFont(title: "Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 15, radius: 0, bgColor: .clear, tintColor: GoodWorkAppColor.appRomanSilver)
        //
        //        self.offeredButton.addRadiusBGColorTitleColorFont(title: "Offered", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 15, radius: 0, bgColor: .clear, tintColor: GoodWorkAppColor.appRomanSilver)
        //
        //        self.hiredButton.addRadiusBGColorTitleColorFont(title: "Hired", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 15, radius: 0, bgColor: .clear, tintColor: GoodWorkAppColor.appRomanSilver)
        //
        //        self.pastButton.addRadiusBGColorTitleColorFont(title: "Past", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 15, radius: 0, bgColor: .clear, tintColor: GoodWorkAppColor.appRomanSilver)
        self.noDataLabel.addTitleColorAndFont(title: "No data", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        self.buttonActions()
        self.loadTableView()
    }
}



//MARK:- Button Actions
extension BookMarkVC {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        self.notificationButton.addTarget(self, action: #selector(self.notificationButtonPressed(_:)), for: .touchUpInside)
        
        
        
        self.labelButtonActions()
    }
    
    func labelButtonActions(){
        self.selectedJobTypeNumber = 0
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.saveButtonPressed))
        self.savedLabel.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.appliedButtonPressed))
        self.appliedLabel.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.offeredButtonPressed))
        self.offeredLabel.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.hiredButtonPressed))
        self.hiredLabel.addGestureRecognizer(tap4)
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(self.pastButtonPressed))
        self.pastLabel.addGestureRecognizer(tap5)
    }
    
    @IBAction func saveButtonPressed(sender: UITapGestureRecognizer) {
        if self.selectedJobTypeNumber == 0{
            return
        }
        self.selectedJobTypeNumber = 0
        self.clearButtonColour()
        self.savedLabel.addTitleColorAndFont(title: "Saved", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        self.jobListTableView.reloadData()
        
        self.mySavedJobListAPI()
    }
    
    @IBAction func appliedButtonPressed(sender: UITapGestureRecognizer) {
        print("appliedButtonPressed")
        if self.selectedJobTypeNumber == 1{
            return
        }
        self.selectedJobTypeNumber = 1
        self.clearButtonColour()
        self.appliedLabel.addTitleColorAndFont(title: "Applied", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        self.jobListTableView.reloadData()
        self.myAppliedJobListAPI()
    }
    
    @IBAction func offeredButtonPressed(sender: UITapGestureRecognizer) {
        print("offeredButtonPressed")
        if self.selectedJobTypeNumber == 2{
            return
        }
        self.selectedJobTypeNumber = 2
        self.clearButtonColour()
        self.offeredLabel.addTitleColorAndFont(title: "Offered", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        self.jobListTableView.reloadData()
        self.myOfferedJobsAPI()
    }
    
    @IBAction func hiredButtonPressed(sender: UITapGestureRecognizer) {
        print("hiredButtonPressed")
        if self.selectedJobTypeNumber == 3{
            return
        }
        self.selectedJobTypeNumber = 3
        self.clearButtonColour()
        self.hiredLabel.addTitleColorAndFont(title: "Hired", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.hiredLabel.addTitleColorAndFont(title: "Hired", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        self.jobListTableView.reloadData()
        self.myHiredJobsAPI()
    }
    
    @IBAction func pastButtonPressed(sender: UITapGestureRecognizer) {
        print("pastButtonPressed")
        if self.selectedJobTypeNumber == 4{
            return
        }
        self.selectedJobTypeNumber = 4
        self.clearButtonColour()
        
        self.pastLabel.addTitleColorAndFont(title: "Past", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        self.jobListTableView.reloadData()
        self.myPastJobsAPI()
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileVC.storyBoardIdentifier) as? MyProfileVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func notificationButtonPressed(_ sender: UIButton){
        print("notificationButtonPressed")
//        self.notificationBanner(AlertMassage.comingSoon.rawValue)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: NotificationsVC.storyBoardIdentifier) as? NotificationsVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func clearButtonColour(){
        self.savedLabel.addTitleColorAndFont(title: "Saved", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.appliedLabel.addTitleColorAndFont(title: "Applied", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.offeredLabel.addTitleColorAndFont(title: "Offered", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.hiredLabel.addTitleColorAndFont(title: "Hired", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
        
        self.pastLabel.addTitleColorAndFont(title: "Past", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDustyGray)
    }
}

extension BookMarkVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.jobListTableView.register(UINib(nibName: RecommendedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: RecommendedTableViewCell.reuseCellIdentifier)
        self.jobListTableView.delegate = self
        self.jobListTableView.dataSource = self
        
        
        self.jobListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.selectedJobTypeNumber == 0{
            return self.mySavedJobList?.data?.count ?? 0
        }else if self.selectedJobTypeNumber == 1{
            return self.myAppliedJobList?.data?.count ?? 0
        }else if self.selectedJobTypeNumber == 3{
            return self.myHiredJobsList?.data?.count ?? 0
        }else if self.selectedJobTypeNumber == 4{
            return self.myPastJobsList?.data?.count ?? 0
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.reuseCellIdentifier, for: indexPath) as! RecommendedTableViewCell
        
        cell.applyNewButton.tag = indexPath.row
        cell.applyNewButton.addTarget(self, action: #selector(self.applyJobCellButtonAction(sender:)), for: .touchUpInside)
        
        cell.appliedButton.tag = indexPath.row
        cell.appliedButton.addTarget(self, action: #selector(self.appliedJobCellButtonAction(sender:)), for: .touchUpInside)
        
        cell.saveJobButton.tag = indexPath.row
        cell.saveJobButton.addTarget(self, action: #selector(self.saveJobButtonAction(sender:)), for: .touchUpInside)
        
        cell.messageNotificationButton.tag = indexPath.row
        cell.messageNotificationButton.addTarget(self, action: #selector(self.chatCellButtonAction(sender:)), for: .touchUpInside)
        
        cell.selectedJobType(self.selectedJobTypeNumber)
        cell.learnMoreButton.isHidden = true
        cell.applyNewButton.isHidden = true
        cell.appliedButton.isHidden = true
        
        if self.selectedJobTypeNumber == 0{
            cell.applyNewButton.isHidden = false
            cell.updateCellDataMySavedJobListJobs(self.mySavedJobList?.data?[indexPath.row])
        }else if self.selectedJobTypeNumber == 1{
            cell.appliedButton.isHidden = false
            cell.updateCellDataMyAppliedJobs(self.myAppliedJobList?.data?[indexPath.row])
        }else if self.selectedJobTypeNumber == 3{
            
            cell.updateCellDataMyHiredJobs(self.myHiredJobsList?.data?[indexPath.row])
        }else if self.selectedJobTypeNumber == 4{
            
            cell.updateCellDataMyPastJobs(self.myPastJobsList?.data?[indexPath.row])
        }
        
        cell.acceptJobButton.tag = indexPath.row
        cell.acceptJobButton.addTarget(self, action: #selector(self.acceptJobButtonAction(sender:)), for: .touchUpInside)
        
        cell.cancelJobButton.tag = indexPath.row
        cell.cancelJobButton.addTarget(self, action: #selector(self.rejectJobButtonAction(sender:)), for: .touchUpInside)
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
    
    @objc func saveJobButtonAction(sender: UIButton){
        
        var isJobLike = 0
        var job_id = ""
        
        if self.selectedJobTypeNumber == 0{
            
            let obj = self.mySavedJobList?.data?[sender.tag]
            //            if obj?.is_liked ?? "0" == "0"{
            //                isJobLike = 1
            //            }else{
            //                isJobLike = 0
            //            }
            job_id = obj?.job_id ?? ""
        }else if self.selectedJobTypeNumber == 1{
            let obj = self.myAppliedJobList?.data?[sender.tag]
            if obj?.is_saved ?? 0 == 0{
                isJobLike = 1
            }else{
                isJobLike = 0
            }
            job_id = obj?.job_id ?? ""
        }else if self.selectedJobTypeNumber == 2{
            //            var obj = self.myAppliedJobList?.data?[sender.tag]
            //            if obj?.is_liked ?? "0" == "0"{
            //                isJobLike = 1
            //            }else{
            //                isJobLike = 0
            //            }
            //            job_id = obj?.job_id ?? ""
        }else if self.selectedJobTypeNumber == 3{
            let obj = self.myHiredJobsList?.data?[sender.tag]
            if obj?.is_saved ?? 0 == 0{
                isJobLike = 1
            }else{
                isJobLike = 0
            }
            job_id = obj?.job_id ?? ""
        }else if self.selectedJobTypeNumber == 4{
            let obj = self.myPastJobsList?.data?[sender.tag]
            if obj?.is_saved ?? 0 == 0{
                isJobLike = 1
            }else{
                isJobLike = 0
            }
            job_id = obj?.job_id ?? ""
        }
        
        
        self.saveJobAPI(job_id, isSaved: isJobLike, tagNo: sender.tag)
        
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppliedJobAlertVC") as! AppliedJobAlertVC
        //        vc.modalPresentationStyle = .overCurrentContext
        //        vc.isFromBookMark = true
        //        self.present(vc, animated: true, completion: nil)
        
        
        
    }
    
    @objc func applyJobCellButtonAction(sender: UIButton){
        print("applyJobCellButtonAction")
        
        if self.selectedJobTypeNumber == 0{
            
            if self.mySavedJobList?.data?[sender.tag].is_applied == "1"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
                vc.isFromSavedJob = true
                vc.selectedJobTypeNo = 1
                vc.selectedJobID = self.mySavedJobList?.data?[sender.tag].job_id ?? ""
                vc.mySavedJobOBJ = self.mySavedJobList?.data?[sender.tag]
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
                vc.selectedJobID = self.mySavedJobList?.data?[sender.tag].job_id ?? ""
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else if self.selectedJobTypeNumber == 1 {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
//            vc.selectedJobTypeNo = self.selectedJobTypeNumber
//            vc.myAppliedJobOBJ = self.myAppliedJobList?.data?[sender.tag]
//            vc.selectedJobID = self.myAppliedJobList?.data?[sender.tag].job_id ?? ""
//            self.navigationController?.pushViewController(vc, animated: true)
        } else if self.selectedJobTypeNumber == 4 {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
            vc.selectedJobID = self.myPastJobsList?.data?[sender.tag].job_id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        } else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
            vc.selectedJobTypeNo = self.selectedJobTypeNumber
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func appliedJobCellButtonAction(sender: UIButton){
        print("appliedJobCellButtonAction")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
        vc.selectedJobTypeNo = self.selectedJobTypeNumber
        vc.myAppliedJobOBJ = self.myAppliedJobList?.data?[sender.tag]
        vc.selectedJobID = self.myAppliedJobList?.data?[sender.tag].job_id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @objc func chatCellButtonAction(sender: UIButton){
        print("chatCellButtonAction")
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
//        vc.selectedJobTypeNo = self.selectedJobTypeNumber
//        self.navigationController?.pushViewController(vc, animated: true)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ChatVC.storyBoardIdentifier) as? ChatVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func acceptJobButtonAction(sender: UIButton){
        print("self.acceptJobButtonAction")
    }
    
    @objc func rejectJobButtonAction(sender: UIButton){
        print("rejectJobButtonAction")
    }
}

extension BookMarkVC{
    
    func mySavedJobListAPI(){
        self.noDataLabel.isHidden = true
        self.startLoading()
        
        var mdl = MySavedJobsRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.role = "nurse"
        
        LoginDataManager.shared.nurseSavedJobListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let mySavedJobsResp = try JSONDecoder().decode(MySavedJobList.self, from: jsonData)
                        
                        self.mySavedJobList = mySavedJobsResp
                        
                        if self.mySavedJobList?.data?.count == 0{
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        print("do mySavedJobList: \(self.mySavedJobList)")
                        
                        if self.mySavedJobList?.api_status == "1"{
                            print("if self.exploreNEW?.api_status")
                        }else{
                            print("falsee")
                        }
                    }catch{
                        
                        print("catch")
                        print("error \(error)")
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.jobListTableView.reloadData()
                self.stopLoading()
            }
        }
    }
    
    func myAppliedJobListAPI(){
        self.noDataLabel.isHidden = true
        self.startLoading()
        var mdl = MyAppliedJobRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        
        LoginDataManager.shared.myAppliedJobListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let myAppliedJobResp = try JSONDecoder().decode(MyAppliedJobList.self, from: jsonData)
                        
                        self.myAppliedJobList = myAppliedJobResp
                        
                        print("do myAppliedJobListNew: \(self.myAppliedJobList)")
                        
                        if self.myAppliedJobList?.data?.count == 0{
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.myAppliedJobList?.api_status == "1"{
                            print("if self.exploreNEW?.api_status")
                        }else{
                            print("falsee")
                        }
                    }catch{
                        print("catch error \(error.localizedDescription)")
                        print("catch error: \(error)")
                    }
                    
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.jobListTableView.reloadData()
                self.stopLoading()
            }
        }
    }
    
    func myOfferedJobsAPI(){
        self.noDataLabel.isHidden = true
        self.startLoading()
        var mdl = MyOfferedJobsRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        LoginDataManager.shared.myOfferedJobsAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    //                    if self.myAppliedJobList?.data?.count == 0{
                    //                        self.noDataLabel.isHidden = true
                    //                    }else{
                    //                        self.noDataLabel.isHidden = false
                    //                    }
                    self.noDataLabel.isHidden = false
                    
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.stopLoading()
            }
        }
    }
    
    func jobAcceptAPI(){
        
        self.startLoading()
        var mdl = JobAcceptRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.offer_id = ""
        
        LoginDataManager.shared.JobAcceptAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                }else{
                    print("False")
                    
                }
                self.notificationBanner(response["message"] as? String ?? "")
                self.stopLoading()
            }
        }
    }
    
    func jobRejectAPI(){
        
        self.startLoading()
        var mdl = JobRejectRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.offer_id = ""
        
        LoginDataManager.shared.jobRejectAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                }else{
                    print("False")
                }
                self.notificationBanner(response["message"] as? String ?? "")
                self.stopLoading()
            }
        }
    }
    
    func myHiredJobsAPI(){
        self.noDataLabel.isHidden = true
        self.startLoading()
        var mdl = MyHiredJobsRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
//        mdl.user_id = "d3acc9f3-5032-4009-b7a8-4c53e978cb80"
        
        LoginDataManager.shared.myHiredJobsAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let myHiredJobsResp = try JSONDecoder().decode(MyHiredJobs.self, from: jsonData)
                        
                        self.myHiredJobsList = myHiredJobsResp
                        
                        if self.myHiredJobsList?.data?.count == 0{
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        print("do myHiredJobsList: \(self.myHiredJobsList)")
                        
                        if self.myHiredJobsList?.api_status == "1"{
                            print("if self.myHiredJobsList")
                        }else{
                            print("falsee")
                        }
                    }catch{
                        print("catch error \(error.localizedDescription)")
                    }
                }else{
                    print("False")
                }
                //                self.notificationBanner(response["message"] as? String ?? "")
                self.jobListTableView.reloadData()
                self.stopLoading()
            }
        }
    }
    
    func myPastJobsAPI(){
        self.noDataLabel.isHidden = true
        self.startLoading()
        var mdl = MyPastJobsRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
//        mdl.user_id = "d3acc9f3-5032-4009-b7a8-4c53e978cb80"
        LoginDataManager.shared.myPastJobAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let myPastJobsResp = try JSONDecoder().decode(MyPastJobs.self, from: jsonData)
                        
                        self.myPastJobsList = myPastJobsResp
                        
                        if self.myPastJobsList?.data?.count == 0{
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.myPastJobsList?.api_status == "1"{
                            print("if self.myHiredJobsList")
                        }else{
                            print("falsee")
                        }
                    }catch{
                        print("catch error \(error.localizedDescription)")
                    }
                }else{
                    print("False")
                }
                
                self.jobListTableView.reloadData()
                self.stopLoading()
            }
        }
    }
}

extension BookMarkVC{
    func saveJobAPI(_ jobID : String, isSaved : Int, tagNo : Int){
        
//        var mdl = likeJobRequest()
//        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
//        mdl.job_id = jobID
        
        
        var mdl = SaveNewJobRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        mdl.job_id = jobID
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.saveNewJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    if self.selectedJobTypeNumber == 0{
                        self.mySavedJobList?.data?.remove(at: tagNo)
                        
                        if self.mySavedJobList?.data?.count == 0{
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        //                        self.mySavedJobList?.data?.popular_jobs?[tagNo].is_liked = "\(isSaved)"
                    }else if self.selectedJobTypeNumber == 1{
                        self.myAppliedJobList?.data?[tagNo].is_saved = isSaved
                    }else if self.selectedJobTypeNumber == 2{
                        //                        self.myAppliedJobList?.data?[tagNo].is_liked = "\(isSaved)"
                    }else if self.selectedJobTypeNumber == 3{
                        self.myHiredJobsList?.data?[tagNo].is_saved = isSaved
                    }else if self.selectedJobTypeNumber == 4{
                        self.myPastJobsList?.data?[tagNo].is_saved = isSaved
                    }
                    
                    if isSaved == 1{
                        self.saveJobAlertView()
                    }else{
                        self.notificationBanner(response["message"] as? String ?? "")
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                self.jobListTableView.reloadData()
                self.stopLoading()
            }
        }
    }
}
