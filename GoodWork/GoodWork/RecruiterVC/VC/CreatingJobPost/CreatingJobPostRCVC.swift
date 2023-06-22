//
//  CreatingJobPostRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/04/23.
//

import UIKit

class CreatingJobPostRCVC: BaseVC {
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var createPostButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var pluseimageView: UIImageView!
    @IBOutlet weak var createPostBGView: UIView!
    
    @IBOutlet weak var draftsLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var onHoldLabel: UILabel!
    @IBOutlet weak var onClosedLabel: UILabel!
    @IBOutlet weak var noJobPostedLabel: UILabel!
    @IBOutlet weak var startPostedLabel: UILabel!
    @IBOutlet weak var noDataLabel: UILabel!
    
    @IBOutlet weak var creatingJobPostTableview: UITableView!
    
    var selectedJobType = 0
    
    var draftApplicationList : DraftApplicationList?
    var publishedList : PublishedList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.updatePostType(0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.noDataLabel.isHidden = true
        self.updateProfileData()
        
        if self.selectedJobType == 0{
            self.getDraftApplicationsAPI()
        }else if self.selectedJobType == 1{
            self.getPublishedAPI()
        }
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.profileImageView.image = UIImage(named: "profile")
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
        self.userNameLabel.addTitleColorAndFont(title: "Opportunities Manager", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.pluseimageView.image = UIImage(named: "pluseGreen")
        self.createPostBGView.addRadiusAndBGColour((self.createPostBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.draftsLabel.addTitleColorAndFont(title: "Drafts", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appGrayCSS)
        
        self.publishedLabel.addTitleColorAndFont(title: "Published", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appGrayCSS)
        
        self.onHoldLabel.addTitleColorAndFont(title: "Hidden", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appGrayCSS)
        
        self.onClosedLabel.addTitleColorAndFont(title: "Closed", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appGrayCSS)
        
        
        self.noJobPostedLabel.addTitleColorAndFont(title: "No Job  Posted.", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 24, tintColor: GoodWorkAppColor.appBlack)
        
        self.startPostedLabel.addTitleColorAndFont(title: "Start Creating Job Request", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 24, tintColor: GoodWorkAppColor.appBlack)
        
        self.noDataLabel.addTitleColorAndFont(title: "No data", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.loadTableView()
        self.buttonActions()
        
        self.creatingJobPostTableview.isHidden = true
    }
    
    func updateProfileData(){
        if appDelegate.recruiterProfile?.data?.count != 0 {
            
            guard let imgUrlString = appDelegate.recruiterProfile?.data?[0].image ?? "".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
            
            self.profileImageView.sd_setImage(with: URL(string: imgUrlString), placeholderImage: UIImage(named: "profileDemo"))
        }
    }
}

//MARK:- Button Actions
extension CreatingJobPostRCVC {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        
        self.createPostButton.addTarget(self, action: #selector(self.createPostButtonPressed(_:)), for: .touchUpInside)
        
        
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ProfileRCVC.storyBoardIdentifier) as? ProfileRCVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createPostButtonPressed(_ sender: UIButton){
        print("createPostButtonPressed")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: CreatJobRequestRCVC.storyBoardIdentifier) as? CreatJobRequestRCVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @IBAction func postTypeButtonPressed(_ sender: UIButton){
        print("postTypeButtonPressed")
        self.updatePostType(sender.tag)
    }
    
    func updatePostType(_ tagNo : Int){
        
        self.noJobPostedLabel.isHidden = true
        self.startPostedLabel.isHidden = true
        self.creatingJobPostTableview.isHidden = false
        
        self.draftsLabel.textColor = GoodWorkAppColor.appGrayCSS
        self.publishedLabel.textColor = GoodWorkAppColor.appGrayCSS
        self.onHoldLabel.textColor = GoodWorkAppColor.appGrayCSS
        self.onClosedLabel.textColor = GoodWorkAppColor.appGrayCSS
        
        self.draftsLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 14)
        self.publishedLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 14)
        self.onHoldLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 14)
        self.onClosedLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 14)
        
        
        switch tagNo{
            
        case 0 :
            print("0")
            self.draftsLabel.textColor = GoodWorkAppColor.appDarkPurple
            self.draftsLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 14)
            self.selectedJobType = 0
            self.getDraftApplicationsAPI()
        case 1 :
            print("1")
            self.publishedLabel.textColor = GoodWorkAppColor.appDarkPurple
            self.publishedLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 14)
            self.selectedJobType = 1
            self.getPublishedAPI()
        case 2 :
            print("2")
            self.onHoldLabel.textColor = GoodWorkAppColor.appDarkPurple
            self.onHoldLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 14)
            self.selectedJobType = 2
            self.getHiddenPostListAPI()
        case 3 :
            print("2")
            self.onClosedLabel.textColor = GoodWorkAppColor.appDarkPurple
            self.onClosedLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 14)
            self.selectedJobType = 3
            self.getClosedPostListAPI()
        default:
            print("default:")
        }
        
        self.creatingJobPostTableview.reloadData()
    }
    
    
}

extension CreatingJobPostRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.creatingJobPostTableview.register(UINib(nibName: CreatedJobTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: CreatedJobTableViewCell.reuseCellIdentifier)
        self.creatingJobPostTableview.delegate = self
        self.creatingJobPostTableview.dataSource = self
        
        self.creatingJobPostTableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedJobType == 3 {
            
            return 180
        }else{
            return 156
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.selectedJobType == 0{
            return self.draftApplicationList?.data?.count ?? 0
        }else{
            return self.publishedList?.data?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CreatedJobTableViewCell.reuseCellIdentifier, for: indexPath) as! CreatedJobTableViewCell
        
        cell.jobSaveImageView.isHidden = true
        cell.appliedCount.isHidden = true
        
        cell.mainBgViewHeightConstrain.constant = 136
        cell.shadowBgViewHeightConstrain.constant = 136
        cell.startDate.isHidden = true
        cell.endDate.isHidden = true
        if self.selectedJobType == 0 {
            cell.updateDraftApplicationData((self.draftApplicationList?.data?[indexPath.row])!)
        }else if self.selectedJobType == 1 {
            cell.updatePublishedListData((self.publishedList?.data?[indexPath.row])!)
        }else if self.selectedJobType == 2 {
            cell.jobSaveImageView.isHidden = false
            cell.appliedCount.isHidden = false
            cell.jobYye.text = ""
            cell.appliedCount.text = ""
            cell.updatePublishedListData((self.publishedList?.data?[indexPath.row])!)
        }else if self.selectedJobType == 3 {
            cell.appliedCount.isHidden = false
            cell.mainBgViewHeightConstrain.constant = 160
            cell.shadowBgViewHeightConstrain.constant = 160
            cell.startDate.isHidden = false
            cell.endDate.isHidden = false
            cell.updatePublishedListData((self.publishedList?.data?[indexPath.row])!)
        }
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if self.selectedJobType == 0 {
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: EditCreatJobRequestRCVC.storyBoardIdentifier) as? EditCreatJobRequestRCVC else { return }
            vc.obj = self.draftApplicationList?.data?[indexPath.row]
            vc.selectedJobType = 0
            self.navigationController?.pushViewController(vc, animated: true)
        }else if self.selectedJobType == 1 {
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: HoldAndPublishedRCVC.storyBoardIdentifier) as? HoldAndPublishedRCVC else { return }
//            vc.isFromHoldApp = true
//            self.navigationController?.pushViewController(vc, animated: true)
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: EditCreatJobRequestRCVC.storyBoardIdentifier) as? EditCreatJobRequestRCVC else { return }
            vc.objPublishedList = self.publishedList?.data?[indexPath.row]
            vc.selectedJobType = 1
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else{
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: HoldAndPublishedRCVC.storyBoardIdentifier) as? HoldAndPublishedRCVC else { return }
//            vc.isFromHoldApp = false
//            self.navigationController?.pushViewController(vc, animated: true)
            
//            self.tabBarController?.tabBar.isHidden = true
////            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: NurseAppliedListRCVC.storyBoardIdentifier) as? NurseAppliedListRCVC else { return }
////            vc.pushOnHoldNurseVC = self
////            vc.shoTabBarOBJ = self
////            vc.modalPresentationStyle = .overCurrentContext
////            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension CreatingJobPostRCVC : pushOnHoldNurseVC, shoTabBarVC {
    func pushOnHoldNurseVC(){
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: HoldAndPublishedRCVC.storyBoardIdentifier) as? HoldAndPublishedRCVC else { return }
        vc.isFromHoldApp = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func shoTabBarVC(){
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension CreatingJobPostRCVC {

    func getDraftApplicationsAPI(){
        
        var mdl = GetDraftJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
       
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getDraftApplicationRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
              
                self.stopLoading()
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                self.navigationController?.popViewController(animated: true)
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let draftApplicationListResp = try JSONDecoder().decode(DraftApplicationList.self, from: jsonData)
                        
                        self.draftApplicationList = draftApplicationListResp
                        
                        print("do draftApplicationList: \(self.draftApplicationList)")
                        
                        if self.draftApplicationList?.data?.count ?? 0 == 0 {
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.draftApplicationList?.api_status == "1"{
                            print("if draftApplicationList.api_status")
                        }else{
                            print("falsee")
                        }
                        self.creatingJobPostTableview.reloadData()
                     }catch{
                        print("error \(error)")
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
    
    func getPublishedAPI(){
        
        var mdl = GetDraftJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
       
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getPublishedRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
              
                self.stopLoading()
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                self.navigationController?.popViewController(animated: true)
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let draftApplicationListResp = try JSONDecoder().decode(PublishedList.self, from: jsonData)
                        
                        self.publishedList = draftApplicationListResp
                        
                        print("do draftApplicationList: \(self.publishedList)")
                        
                        if self.publishedList?.data?.count ?? 0 == 0 {
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.publishedList?.api_status == "1"{
                            print("if draftApplicationList.api_status")
                        }else{
                            print("falsee")
                        }
                        self.creatingJobPostTableview.reloadData()
                     }catch{
                        print("error \(error)")
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
    
    func getHiddenPostListAPI(){
        
        var mdl = GetDraftJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
       
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getHiddenRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
              
                self.stopLoading()
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                self.navigationController?.popViewController(animated: true)
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let draftApplicationListResp = try JSONDecoder().decode(PublishedList.self, from: jsonData)
                        
                        self.publishedList = draftApplicationListResp
                        
                        print("do draftApplicationList: \(self.publishedList)")
                        
                        if self.publishedList?.data?.count ?? 0 == 0 {
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.publishedList?.api_status == "1"{
                            print("if draftApplicationList.api_status")
                        }else{
                            print("falsee")
                        }
                        self.creatingJobPostTableview.reloadData()
                     }catch{
                        print("error \(error)")
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
    
    func getClosedPostListAPI(){
        
        var mdl = GetDraftJobPostRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
       
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getClosePostListRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
              
                self.stopLoading()
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                self.navigationController?.popViewController(animated: true)
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let draftApplicationListResp = try JSONDecoder().decode(PublishedList.self, from: jsonData)
                        
                        self.publishedList = draftApplicationListResp
                        
                        print("do draftApplicationList: \(self.publishedList)")
                        
                        if self.publishedList?.data?.count ?? 0 == 0 {
                            self.noDataLabel.isHidden = false
                        }else{
                            self.noDataLabel.isHidden = true
                        }
                        
                        if self.publishedList?.api_status == "1"{
                            print("if draftApplicationList.api_status")
                        }else{
                            print("falsee")
                        }
                        self.creatingJobPostTableview.reloadData()
                     }catch{
                        print("error \(error)")
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
}

protocol pushOnHoldNurseVC {
    func pushOnHoldNurseVC()
}

protocol shoTabBarVC {
    func shoTabBarVC()
}
