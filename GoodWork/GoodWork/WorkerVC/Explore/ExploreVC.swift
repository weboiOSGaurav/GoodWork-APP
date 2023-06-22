//
//  ExploreVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 13/04/23.
//

import UIKit

class ExploreVC: BaseVC {
    
    static let storyBoardIdentifier = "ExploreVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var exploreTitleLabel: UILabel!
    
    @IBOutlet weak var filterBGView: UIView!
    @IBOutlet weak var filterImageView: UIImageView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    
    @IBOutlet weak var jobListTableView: UITableView!
    
    @IBOutlet weak var noDataLabel: UILabel!
    
    var exploreJobs : BrowseJobs?
    
    var clasMDL = BrowseJobsRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
        self.profileImageView.image = UIImage(named: "profileDemo")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.noDataLabel.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        self.profileImageView.image = UIImage(named: "profileDemo")
        
        if appDelegate.nurseProfile?.data?.image ?? "" != ""{
            
            self.profileImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "profileDemo"))
        }else{
            self.profileImageView.image = UIImage(named: "profileDemo")
        }
        
        if appDelegate.isFromApplyJob{
            print("appDelegate.isFromApplyJob")
            self.appliedJobAlertView()
            appDelegate.isFromApplyJob = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.exploreAPI()
            }
        }else{
            self.exploreAPI()
        }
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
        self.rightSideTopImageView.image = UIImage(named: "homeRightSideTop")
        self.profileImageView.image = UIImage(named: "profileDemo")
        
        self.noDataLabel.addTitleColorAndFont(title: "No data", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.exploreTitleLabel.addTitleColorAndFont(title: "Explore", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.filterTitleLabel.addTitleColorAndFont(title: "Filters", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appLavender)
        
        self.filterBGView.addRadiusAndBGColour((self.filterBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        self.filterImageView.image = UIImage(named: "filterWhiteImg")
        
        self.loadTableView()
        self.buttonActions()
    }
}

extension ExploreVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.jobListTableView.register(UINib(nibName: RecommendedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: RecommendedTableViewCell.reuseCellIdentifier)
        self.jobListTableView.delegate = self
        self.jobListTableView.dataSource = self
        
        
        self.jobListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.exploreJobs?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.reuseCellIdentifier, for: indexPath) as! RecommendedTableViewCell
        
        cell.jobDescriptionLable.addTitleColorAndFont(title: "Medical Solutions Recruiter", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        cell.selectedJobType(0)
        cell.updateCellData(self.exploreJobs?.data?[indexPath.row])
        
        cell.applyNewButton.tag = indexPath.row
        cell.applyNewButton.addTarget(self, action: #selector(self.applyJobCellButtonAction(sender:)), for: .touchUpInside)
        
        cell.saveJobButton.tag = indexPath.row
        cell.saveJobButton.addTarget(self, action: #selector(self.saveJobButtonPress(sender:)), for: .touchUpInside)
        cell.applyNewButton.isHidden = false
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
    
    @objc func applyJobCellButtonAction(sender: UIButton){
        
        
        if self.exploreJobs?.data?[sender.tag].is_applied ?? "" == "1" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: AppliedJobDetailsVC.storyBoardIdentifier) as! AppliedJobDetailsVC
            vc.isFromBrowseJob = true
            vc.selectedJobTypeNo = 1
            vc.selectedJobID = self.exploreJobs?.data?[sender.tag].job_id ?? ""
            vc.browseJobOBJ = self.exploreJobs?.data?[sender.tag]
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: JobDetailsVC.storyBoardIdentifier) as? JobDetailsVC else { return }
            vc.selectedJobID = self.exploreJobs?.data?[sender.tag].job_id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func saveJobButtonPress(sender: UIButton){
        
        var obj = self.exploreJobs?.data?[sender.tag]
        
        var isJobLike = 0
        
        if obj?.is_saved ?? 0 == 0{
            isJobLike = 1
        }else{
            isJobLike = 0
        }
        
        self.saveJobAPI(obj?.job_id ?? "", isSaved: isJobLike, tagNo: sender.tag)
    }
}

//MARK:- Button Actions
extension ExploreVC {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        self.filterButton.addTarget(self, action: #selector(self.filterButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: MyProfileVC.storyBoardIdentifier) as? MyProfileVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton){
        print("filterButtonPressed")
        self.tabBarController?.tabBar.isHidden = true
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: FilterVC.storyBoardIdentifier) as? FilterVC else { return }
        vc.objExp = self
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
}

extension ExploreVC : PassFilterData {
    func passFilterData(_ isClose : Bool, _ mdl : BrowseJobsRequest){
        
        print("passFilterData")
        self.tabBarController?.tabBar.isHidden = false
        
        if isClose{
            
        }else{
            self.clasMDL = mdl
            
            self.exploreAPI()
        }
    }
}

extension ExploreVC{
    
    func exploreAPI(){
        self.startLoading()
        
        self.clasMDL.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        print("\(self.clasMDL)")
        
        
        LoginDataManager.shared.browseJobAPI(rqst: self.clasMDL) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let exploreResp = try JSONDecoder().decode(BrowseJobs.self, from: jsonData)
                        
                        self.exploreJobs = exploreResp
                        
                        print("do self.exploreNEW: \(self.exploreJobs)")
                        
                        if  self.exploreJobs?.data?.count == 0 {
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.exploreJobs?.api_status == "1"{
                            print("if self.exploreNEW?.api_status")
                        }else{
                            print("falsee")
                        }
                    }catch{
                        print("catch")
                        print("error \(error.localizedDescription)")
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
                    
                    self.exploreJobs?.data?[tagNo].is_saved = isSaved
                    
                    print("isSaved: \(isSaved)")
                    
                    if isSaved == 1 {
                        self.saveJobAlertView()
                    }else{
                        self.notificationBanner(response["message"] as? String ?? "")
                    }
                    self.jobListTableView.reloadData()
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
protocol PassFilterData {
    func passFilterData(_ isClose : Bool, _ mdl : BrowseJobsRequest)
}
