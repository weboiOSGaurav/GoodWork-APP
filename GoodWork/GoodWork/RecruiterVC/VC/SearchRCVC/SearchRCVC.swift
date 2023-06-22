//
//  SearchRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 25/04/23.
//

import UIKit
import SwiftyAttributes

class SearchRCVC: BaseVC {
    
    static let storyBoardIdentifier = "SearchRCVC"
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var appJourneyLabel: UILabel!
    
    @IBOutlet weak var filterBGView: UIView!
    @IBOutlet weak var filterImageView: UIImageView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    
    @IBOutlet weak var helpYourTitleLabel: UILabel!
    
    @IBOutlet weak var applicationTypeCollectionView: UICollectionView!
    @IBOutlet weak var applicationTypeTableView: UITableView!
    
    let appTypeArray = ["New", "Screening", "Submitted", "Offered", "Onboarding", "Working", "Done", "Rejected", "Blocked"]
    
    var applicationList : ApplicantTypeList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        
        self.helpYourTitleLabel.text = ""
        
        let log = "Help your ".withAttributes([
            .textColor(GoodWorkAppColor.appColour),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 24))
        ])
        
        let inn = "applicants advance!".withAttributes([
            .textColor(GoodWorkAppColor.appLightPink),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 24))
        ])
        
        let finalString = (log + inn)
        
        self.helpYourTitleLabel.attributedText = finalString
        self.updateProfileData()
        self.applicationTypeListAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.profileImageView.image = UIImage(named: "profileDemo")
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
        self.appJourneyLabel.addTitleColorAndFont(title: "Applications Journey", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.filterTitleLabel.addTitleColorAndFont(title: "Filters", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appLavender)
        
        self.filterBGView.addRadiusAndBGColour((self.filterBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        self.filterImageView.image = UIImage(named: "filterWhiteImg")
        
        
        self.buttonActions()
        self.loadTableView()
    }
    
    func updateProfileData(){
        if appDelegate.recruiterProfile?.data?.count != 0 {
            
            guard let imgUrlString = appDelegate.recruiterProfile?.data?[0].image ?? "".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
           
            self.profileImageView.sd_setImage(with: URL(string: imgUrlString), placeholderImage: UIImage(named: "profileDemo"))
        }
    }
}

//MARK:- Button Actions
extension SearchRCVC {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ProfileRCVC.storyBoardIdentifier) as? ProfileRCVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//extension SearchRCVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//
//
//    func loadCollectionview(){
//        self.applicationTypeCollectionView.register(UINib(nibName: ApplicationAdvanceCollectionViewCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: ApplicationAdvanceCollectionViewCell.reuseCellIdentifier)
//        self.applicationTypeCollectionView.delegate = self
//        self.applicationTypeCollectionView.dataSource = self
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return self.appTypeArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ApplicationAdvanceCollectionViewCell.reuseCellIdentifier, for: indexPath) as! ApplicationAdvanceCollectionViewCell
//
//        cell.applicationLabel.text = self.appTypeArray[indexPath.row]
//        cell.applicationCount.text = "15 Applicants"
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let leftAndRightPaddings: CGFloat = 10
//        let numberOfItemsPerRow: CGFloat = 3.0
//
//        let width = (collectionView.frame.width - leftAndRightPaddings)/numberOfItemsPerRow
//
//        return CGSize(width: collectionView.frame.width , height: 60)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        switch indexPath.row {
//        case 0:
//            print("0")
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: NewApplicationsRCVC.storyBoardIdentifier) as? NewApplicationsRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//        case 1:
//            print("1")
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ScreeningRCVC.storyBoardIdentifier) as? ScreeningRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        case 2:
//            print("1")
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: SubmittedRCVC.storyBoardIdentifier) as? SubmittedRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        case 3:
//            print("1")
//
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: OfferedEmployeesRCVC.storyBoardIdentifier) as? OfferedEmployeesRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        case 4:
//            print("1")
//
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: OnboardingEmployeesRCVC.storyBoardIdentifier) as? OnboardingEmployeesRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        case 5:
//            print("1")
//
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: WorkingEmployeesRCVC.storyBoardIdentifier) as? WorkingEmployeesRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        case 6:
//            print("1")
//
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: DoneEmployeesRCVC.storyBoardIdentifier) as? DoneEmployeesRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        case 7:
//            print("1")
//
//            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: RejectedRCVC.storyBoardIdentifier) as? RejectedRCVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        default:
//            print("default")
//        }
//    }
//}

extension SearchRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.applicationTypeTableView.register(UINib(nibName: ApplicationAdvanceTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: ApplicationAdvanceTableViewCell.reuseCellIdentifier)
        
        self.applicationTypeTableView.delegate = self
        self.applicationTypeTableView.dataSource = self
        
        
        self.applicationTypeTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.applicationList?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationAdvanceTableViewCell.reuseCellIdentifier, for: indexPath) as! ApplicationAdvanceTableViewCell
        
        cell.appTitlefoLabel.text = self.applicationList?.data?[indexPath.row].name ?? ""
        
        cell.appDescriptionInfoLabel.text = "\(self.applicationList?.data?[indexPath.row].applicants ?? 0) Applicants"
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        switch indexPath.row {
        case 0:
            print("0")
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: NewApplicationsRCVC.storyBoardIdentifier) as? NewApplicationsRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("1")
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ScreeningRCVC.storyBoardIdentifier) as? ScreeningRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            print("1")
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: SubmittedRCVC.storyBoardIdentifier) as? SubmittedRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            print("1")
            
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: OfferedEmployeesRCVC.storyBoardIdentifier) as? OfferedEmployeesRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            print("1")
            
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: OnboardingEmployeesRCVC.storyBoardIdentifier) as? OnboardingEmployeesRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            print("1")
            
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: WorkingEmployeesRCVC.storyBoardIdentifier) as? WorkingEmployeesRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            print("1")
            
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: DoneEmployeesRCVC.storyBoardIdentifier) as? DoneEmployeesRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            print("1")
            
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: RejectedRCVC.storyBoardIdentifier) as? RejectedRCVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("default")
        }
    }
}


extension SearchRCVC {
    
    func applicationTypeListAPI(){
        
        self.startLoading()
        
        var mdl = AboutMeRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
    
        print("mdl: \(mdl)")
        
        LoginDataManager.shared.applicationTypeListRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let homeResp = try JSONDecoder().decode(ApplicantTypeList.self, from: jsonData)
                        
                        self.applicationList = homeResp
                        DispatchQueue.main.async {
                            self.applicationTypeTableView.reloadData()
                        }
                    }catch{
                        print("catch:: \(error)")
                       // self.notificationBanner(response["message"] as? String ?? "")
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
