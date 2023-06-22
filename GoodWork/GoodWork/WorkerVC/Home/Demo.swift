//
//  HomeVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 29/03/23.
//

import UIKit
import SwiftyAttributes
import NotificationBannerSwift

class HomeVC22: BaseVC {
    
    static let storyBoardIdentifier = "HomeVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var exploreLatestJobLabel: UILabel!
    @IBOutlet weak var notificationBGView: UIView!
    
    @IBOutlet weak var latestJobBGView: UIView!
    @IBOutlet weak var latestJobShadowView: UIView!
    @IBOutlet weak var latestJobImageView: UIImageView!
    @IBOutlet weak var latestJobTitle: UILabel!
    
    @IBOutlet weak var popularJobsLable: UILabel!
    
    @IBOutlet weak var popularJobsCollectionView: UICollectionView!
    
    @IBOutlet weak var popularJobsTableView: UITableView!
    @IBOutlet weak var recommendedForYouTableView: UITableView!
    
    @IBOutlet weak var recommendedForYouTableViewHeight: NSLayoutConstraint!
    
    //     var exploreNEW = try? JSONDecoder().decode(Json4Swift_Base.self, from: Data())
    
    @IBOutlet weak var noDataLabel: UILabel!
    
    var exploreNEW : Json4Swift_Base?
    
    var jobTypeIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.latestJobBGView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 20)
        self.latestJobShadowView.shadow(20)
        self.latestJobImageView.image = UIImage(named: "demoLatestJob")
        self.latestJobImageView.cornerRadius(20)
        
        self.setUPUI()
        //self.nurseProfileAPI()
        self.recommendedForYouTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
      //  self.exploreAPI(false)
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "homeRightSideTop")
        self.profileImageView.image = UIImage(named: "profileDemo")
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
        
        
        self.userNameLabel.addTitleColorAndFont(title: "Hi,", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.notificationImageView.image = UIImage(named: "notification")
        self.notificationBGView.addRadiusAndBGColour((self.notificationBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.latestJobTitle.addTitleColorAndFont(title: "New Job Opportunities", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.popularJobsLable.isHidden = true
        self.popularJobsLable.addTitleColorAndFont(title: "Popular jobs", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 20, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.noDataLabel.addTitleColorAndFont(title: "No data", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.loadCollectionview()
        self.buttonActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.noDataLabel.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        self.exploreLatestJobLabel.text = ""
        
        let log = "Explore the ".withAttributes([
            .textColor(GoodWorkAppColor.appDarkPurple),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 34))
        ])
        
        let inn = "latest jobs!".withAttributes([
            .textColor(GoodWorkAppColor.appLightPink),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 34))
        ])
        
        let finalString = (log + inn)
        
        self.exploreLatestJobLabel.attributedText = finalString
        self.nurseProfileAPI()
        
        if appDelegate.isFromApplyJob{
            self.appliedJobAlertView()
            appDelegate.isFromApplyJob = false
            self.exploreAPI(true)
        }else{
            self.exploreAPI(false)
        }
     }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                DispatchQueue.main.async {
                    let newsize  = newvalue as! CGSize
                    self.recommendedForYouTableViewHeight.constant = (newsize.height + 60)
                }
            }
        }
    }
}

extension HomeVC22 : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func loadCollectionview(){
        self.popularJobsCollectionView.register(UINib(nibName: PopularJobsCollectionCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: PopularJobsCollectionCell.reuseCellIdentifier)
        self.popularJobsCollectionView.delegate = self
        self.popularJobsCollectionView.dataSource = self
        
        self.loadTableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //        return self.exploreNEW?.data.popularJobs.count ?? 0
        
        return self.exploreNEW?.data?.popular_jobs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularJobsCollectionCell.reuseCellIdentifier, for: indexPath) as! PopularJobsCollectionCell
        
        cell.updateCellData(self.exploreNEW?.data?.popular_jobs?[indexPath.row])
        cell.appliedNumberLable.isHidden = true
        cell.saveJobButton.tag = indexPath.row
        cell.saveJobButton.addTarget(self, action: #selector(self.saveJobButtonPress), for: .touchUpInside)
        cell.moreButton.isHidden = false
        cell.moreButton.tag = indexPath.row
        cell.moreButton.addTarget(self, action: #selector(self.learnMoreButtonPress), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = (self.popularJobsCollectionView.frame.width * 0.8)
        
//        let collectionViewWidth = (self.popularJobsCollectionView.frame.width * 1)
        print("self.popularJobsCollectionView.frame.width \(self.popularJobsCollectionView.frame.width)")
        return CGSize(width: collectionViewWidth, height: 178)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("indexPath.row\(indexPath.row)")
    }
    
    @objc func learnMoreButtonPress(_ sender: UIButton){
        print("learnMoreButtonPress")
        if self.exploreNEW?.data?.popular_jobs?[sender.tag].is_applied ?? "" == "1" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
            vc.isFromExplore = true
            vc.selectedJobTypeNo = 1
            vc.selectedJobID = self.exploreNEW?.data?.popular_jobs?[sender.tag].job_id ?? ""
            vc.exploreJobOBJ = self.exploreNEW?.data?.popular_jobs?[sender.tag]
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
            vc.selectedJobID = self.exploreNEW?.data?.popular_jobs?[sender.tag].job_id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func saveJobButtonPress(_ sender: UIButton){
        
//        self.jobTypeIndex = 0
//        var obj = self.exploreNEW?.data?.popular_jobs?[sender.tag]
//
//        var isSaved = 0
//
//        if obj?.is_saved ?? "" == "0"{
//            isSaved = 1
//        }else{
//            isSaved = 0
//        }
        self.saveJobPopularTable(sender.tag)
       // self.saveJobAPI(obj?.job_id ?? "", isSaved: isSaved, tagNo: sender.tag)
    }
    
    func saveJobPopularTable(_ tag : Int){
        self.jobTypeIndex = 0
        var obj = self.exploreNEW?.data?.popular_jobs?[tag]
        
        var isSaved = 0
        
        if obj?.is_saved ?? "" == "0"{
            isSaved = 1
        }else{
            isSaved = 0
        }
        
        self.saveJobAPI(obj?.job_id ?? "", isSaved: isSaved, tagNo: tag)
    }
}

extension HomeVC22 : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.recommendedForYouTableView.register(UINib(nibName: RecommendedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: RecommendedTableViewCell.reuseCellIdentifier)
        self.recommendedForYouTableView.delegate = self
        self.recommendedForYouTableView.dataSource = self
        
        self.recommendedForYouTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.recommendedForYouTableViewHeight.constant = self.recommendedForYouTableView.contentSize.height + 130
        }
        
        self.popularJobsTableView.register(UINib(nibName: RecommendedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: RecommendedTableViewCell.reuseCellIdentifier)
        self.popularJobsTableView.delegate = self
        self.popularJobsTableView.dataSource = self
        
        self.popularJobsTableView.reloadData()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        if self.popularJobsTableView == tableView {
            
            return 1
        }else{
            if self.exploreNEW?.data?.recommended_jobs?.count ?? 0 == 0 && self.exploreNEW?.data?.recently_added?.count ?? 0 == 0{

                print(" return 0")
                return 0
            }else if self.exploreNEW?.data?.recommended_jobs?.count ?? 0 != 0 && self.exploreNEW?.data?.recently_added?.count ?? 0 != 0{

                print("return 2")
                return 2
            }

             print("return 1")
             return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if self.popularJobsTableView == tableView {
            
            return UIView()
        }else{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
            
            let  headerTitleLabel = UILabel()
            headerTitleLabel.frame = CGRect.init(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            
            headerTitleLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 20, tintColor: GoodWorkAppColor.appDarkPurple)
            headerView.backgroundColor = .clear
            
            if section == 0 {
                
                if self.exploreNEW?.data?.recently_added?.count ?? 0 != 0 {
                    headerTitleLabel.text = "Recently added"
                }else if self.exploreNEW?.data?.recommended_jobs?.count ?? 0 != 0 {
                    headerTitleLabel.text = "Recommended for you"
                }
            }else if section == 1 {
                
                headerTitleLabel.text = "Recommended for you"
            }
            
            headerView.addSubview(headerTitleLabel)
            
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if self.popularJobsTableView == tableView {
            return 0
        }else{
            return 35
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.popularJobsTableView == tableView {
            
            return self.exploreNEW?.data?.popular_jobs?.count ?? 0
        }else{
            if section == 0 {
                if self.exploreNEW?.data?.recently_added?.count ?? 0 != 0 {
                    return self.exploreNEW?.data?.recently_added?.count ?? 0
                }else{
                    return self.exploreNEW?.data?.recommended_jobs?.count ?? 0
                }
            }else if section == 1{
                return self.exploreNEW?.data?.recommended_jobs?.count ?? 0
            }
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.reuseCellIdentifier, for: indexPath) as! RecommendedTableViewCell
        
        if self.popularJobsTableView == tableView {
            cell.shadowBgView.shadow(16)
            cell.updateCellPopularJobHomeData(self.exploreNEW?.data?.popular_jobs?[indexPath.row])
            cell.saveJobImageView.isHidden = true
            cell.saveJobButton.isHidden = true
            return cell
        }else{
            if indexPath.section == 0 {
                if self.exploreNEW?.data?.recently_added?.count ?? 0 != 0 {
                    cell.updateCellRecentlyJobData(self.exploreNEW?.data?.recently_added?[indexPath.row])
                }else{
                    cell.updateCellRecommendedJobData(self.exploreNEW?.data?.recommended_jobs?[indexPath.row])
                }
            }else{
                cell.updateCellRecommendedJobData(self.exploreNEW?.data?.recommended_jobs?[indexPath.row])
            }
            
            cell.saveJobButton.tag = indexPath.row
            cell.contentView.superview?.tag = indexPath.section
            cell.saveJobButton.addTarget(self, action: #selector(self.saveJobRecentButtonPress(sender:)), for: .touchUpInside)
            
            cell.applyNewButton.isHidden = true
            
            cell.learnMoreButton.tag = indexPath.row
            cell.learnMoreButton.addTarget(self, action: #selector(self.recentJobApplyButtonPress(sender:)), for: .touchUpInside)
            cell.learnMoreButton.isHidden = false
            return  cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        
        if self.popularJobsTableView == tableView {
            let closeAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("OK, marked as Closed")
                self.startLoading()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if self.exploreNEW?.data?.popular_jobs?.count ?? 0 > 0{
                        self.exploreNEW?.data?.popular_jobs?.remove(at: 0)
                        self.popularJobsTableView.reloadData()
                        self.stopLoading()
                        self.notificationBanner("Job hidden successfully.")
                        
                    }
                }
                success(true)
            })
            closeAction.image = UIImage(named: "deleteSwipe")
            closeAction.backgroundColor =  GoodWorkAppColor.appBGPink

            return UISwipeActionsConfiguration(actions: [closeAction])
        }else{
            return nil
        }
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        
        if self.popularJobsTableView == tableView {
            let modifyAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                self.startLoading()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if self.exploreNEW?.data?.popular_jobs?.count ?? 0 > 0{
                        self.exploreNEW?.data?.popular_jobs?.remove(at: 0)
                        self.popularJobsTableView.reloadData()
                        self.saveJobPopularTable(indexPath.row)
                    }
                }
                success(true)
            })
            modifyAction.image = UIImage(named: "swipeSavePost")
            modifyAction.backgroundColor = GoodWorkAppColor.appBGPink

            return UISwipeActionsConfiguration(actions: [modifyAction])
        }else{
            
            return nil
        }
    }
    
    @objc func saveJobRecentButtonPress(sender: UIButton){
        let row = sender.tag
        let section = sender.superview?.tag
        
        if section == 0 {
            self.jobTypeIndex = 1
            let obj = self.exploreNEW?.data?.recently_added?[sender.tag]
            
            var isSaved = 0
            
            if obj?.is_saved ?? "0" == "0"{
                isSaved = 1
            }else{
                isSaved = 0
            }
            
            self.saveJobAPI(obj?.job_id ?? "", isSaved: isSaved, tagNo: sender.tag)
        }else{
            self.jobTypeIndex = 2
            
            let obj = self.exploreNEW?.data?.recommended_jobs?[sender.tag]
            
            var isSaved = 0
            
            if obj?.is_saved ?? "0" == "0"{
                isSaved = 1
            }else{
                isSaved = 0
            }
            
            self.saveJobAPI(obj?.job_id ?? "", isSaved: isSaved, tagNo: sender.tag)
        }
    }
    
    @objc func recentJobApplyButtonPress(sender: UIButton){
        print("recentJobApplyButtonPress")
        let row = sender.tag
        let section = sender.superview?.tag
        
        if section == 0 {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
            vc.selectedJobID = self.exploreNEW?.data?.recently_added?[sender.tag].job_id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
            vc.selectedJobID = self.exploreNEW?.data?.recommended_jobs?[sender.tag].job_id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


//MARK:- Button Actions
extension HomeVC22 {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        
        self.notificationButton.addTarget(self, action: #selector(self.notificationButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileVC.storyBoardIdentifier) as? MyProfileVC else { return }
        vc.obj = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func notificationButtonPressed(_ sender: UIButton){
        print("notificationButtonPressed")
//        self.notificationBanner(AlertMassage.comingSoon.rawValue)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: NotificationsVC.storyBoardIdentifier) as? NotificationsVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeVC22{
    
    func exploreAPI(_ isFromApplyJob : Bool){
        self.noDataLabel.isHidden = true
        var mdl = HomeRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
//        mdl.user_id = "2d403b1a-cca6-4d8a-b23f-11c55428490f"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !isFromApplyJob{
                self.startLoading()
            }
        }
        
        LoginDataManager.shared.explore(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let exploreResp = try JSONDecoder().decode(Json4Swift_Base.self, from: jsonData)
                        
                        self.exploreNEW = exploreResp
                        
                        print("do self.exploreNEW: \(self.exploreNEW)")
                        
                        if self.exploreNEW?.data?.popular_jobs?.count ?? 0 == 0 {
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.exploreNEW?.api_status == "1"{
                            print("if self.exploreNEW?.api_status")
                        }else{
                            print("falsee")
                        }
                        
                        if self.exploreNEW?.data?.popular_jobs?.count ?? 0 == 0 {
                            self.popularJobsLable.isHidden = true
                        }else{
                            self.popularJobsLable.isHidden = false
                        }
                        
                        print("self.exploreNEW?.data:: \(self.exploreNEW?.data?.recently_added?.count ?? 0)")
                        
                        print("recommended_jobs:: \(self.exploreNEW?.data?.recommended_jobs?.count ?? 0)")
                        
                     }catch{
                        print("error \(error)")
                        print("catch \(error.localizedDescription)")
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                
                DispatchQueue.main.async {
//                    self.popularJobsCollectionView.reloadData()
                    self.popularJobsTableView.reloadData()
                    self.recommendedForYouTableView.reloadData()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.stopLoading()
                }
            }
        }
    }
    
    func saveJobAPI(_ jobID : String, isSaved : Int, tagNo : Int){
        
        var mdl = SaveNewJobRequest()
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        mdl.job_id = jobID
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.saveNewJob(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    if self.jobTypeIndex == 0 {
//                        self.exploreNEW?.data?.popular_jobs?[tagNo].is_saved = "\(isSaved)"
                        
                        print("isSaved: \(isSaved)")
    //                    self.notificationBanner(response["message"] as? String ?? "")
//                        self.popularJobsCollectionView.reloadData()
//                        self.popularJobsTableView.reloadData()
                    }else if self.jobTypeIndex == 1 {
                        
                        self.exploreNEW?.data?.recently_added?[tagNo].is_saved = "\(isSaved)"
                        
                        print("isSaved: \(isSaved)")
    //                    self.notificationBanner(response["message"] as? String ?? "")
                        self.recommendedForYouTableView.reloadData()
                        
                    }else if self.jobTypeIndex == 2 {
                        
                        self.exploreNEW?.data?.recommended_jobs?[tagNo].is_saved = "\(isSaved)"
                        
                        print("isSaved: \(isSaved)")
    //                    self.notificationBanner(response["message"] as? String ?? "")
                        self.recommendedForYouTableView.reloadData()
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
                
                self.stopLoading()
            }
        }
    }
    
    func nurseProfileAPI(){
        
        var mdl = NurseProfileRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        print("mdl: \(mdl)")
        
        LoginDataManager.shared.nurseProfileDetails(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseProfileResp = try JSONDecoder().decode(NurseProfile.self, from: jsonData)
                        
                        appDelegate.nurseProfile = nurseProfileResp
                        
                        print("do nurseProfile: \(appDelegate.nurseProfile)")
                        
                        if appDelegate.nurseProfile?.api_status == "1"{
                            
                            self.userNameLabel.text = "Hi, \(appDelegate.nurseProfile?.data?.first_name ?? "")!"
                            
                            if appDelegate.nurseProfile?.data?.image ?? "" != ""{
                                
                                self.profileImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: ""))
                            }else{
                                self.profileImageView.image = UIImage(named: "profileDemo")
                            }
                            
                        }else{
                            print("falsee")
                        }
                        
                    }catch{
                        print("catch")
                    }
                    
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
            }
        }
    }
}

extension HomeVC22 : updateProfilePhotoPro{
    
    func updateProfilePhotoPro(){
        self.nurseProfileAPI()
        print("updateProfilePhotoPro")
    }
}
