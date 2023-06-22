//
//  MyProfileVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 03/04/23.
//

import UIKit
import SwiftyAttributes
import Alamofire

class MyProfileVC: BaseVC {
    
    static let storyBoardIdentifier = "MyProfileVC"
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var settingBGView: UIView!
    @IBOutlet weak var settingImageView: UIImageView!
    
    @IBOutlet weak var myProfileTitle: UILabel!
    
    @IBOutlet weak var userProfileTitleImageView: UIImageView!
    @IBOutlet weak var userProfileShadowView: UIView!
    
    
    @IBOutlet weak var cameraBGView: UIView!
    @IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var userFullNameLable: UILabel!
    
    @IBOutlet weak var emailIDLable: UILabel!
    
    @IBOutlet weak var completeYourProfile: UILabel!
    @IBOutlet weak var completeProfileCount: UILabel!
    
    @IBOutlet weak var completeProfileProgressView: UIProgressView!
    
    @IBOutlet weak var profileInfoTableview: UITableView!
    
    @IBOutlet weak var clickOnProfileButton: UIButton!
    
    let profileDetailsAry = ["Personal information","Resume","Licenses","Certifications","Education","Experience"]
    
    var obj : updateProfilePhotoPro?
    
    var isFromEditInfo = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.startLoading()
        self.nurseProfileAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.isFromEditInfo {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            self.tabBarController?.tabBar.isHidden = true
        }else{
            self.tabBarController?.tabBar.isHidden = false
        }
        
        self.myProfileTitle.text = ""
        
        let log = "My".withAttributes([
            .textColor(GoodWorkAppColor.appDarkPurple),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 32))
        ])
        
        let inn = " Profile".withAttributes([
            .textColor(GoodWorkAppColor.appLightPink),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 32))
        ])
        
        let finalString = (log + inn)
        
        self.myProfileTitle.attributedText = finalString
        
        self.updateNurseProfileData()
        self.nurseProfileAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "Group3")
        self.rightSideTopImageView.backgroundColor = .clear
        self.userProfileImageView.image = UIImage(named: "drProfile")
        
        self.userProfileImageView.addBorderCornerRadius(Int(self.userProfileImageView.frame.height) / 2, 0, .clear)
        
        self.userNameLabel.addTitleColorAndFont(title: "James", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.settingBGView.addRadiusAndBGColour((self.settingBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.settingImageView.image = UIImage(named: "setting")
        
        self.userNameLabel.addTitleColorAndFont(title: "James", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.userProfileTitleImageView.image = UIImage(named: "placeHolderRect")
        self.userProfileTitleImageView.addRadiusAndBGColour(14, .clear)
        self.userProfileShadowView.addRadiusAndBGColour(14, GoodWorkAppColor.appArsenic)
        
        self.userFullNameLable.addTitleColorAndFont(title: "James Bond", fontName: GoodWorkAppFontName.QuicksandRegular, fontSize: 24, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.emailIDLable.addTitleColorAndFont(title: "650#99KOSE@2493", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 14, tintColor: GoodWorkAppColor.appRomanSilver)
        
        self.completeYourProfile.addTitleColorAndFont(title: "Complete Your Profile", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.completeProfileCount.addTitleColorAndFont(title: "(0/6)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.cameraBGView.cornerRadiusWithBgColour((Int(self.cameraBGView.frame.height)/2), bgColour: GoodWorkAppColor.appGre)
        self.cameraImageView.image = UIImage(named: "camera")
        
        self.loadTableView()
        self.buttonActions()
    }
    
    func updateNurseProfileData(){
        self.userNameLabel.text = "\(appDelegate.nurseProfile?.data?.first_name ?? "")"
        
        self.userFullNameLable.text = "\(appDelegate.nurseProfile?.data?.fullName ?? "")"
        
        if appDelegate.nurseProfile?.data?.image ?? "" != ""{
            
            self.userProfileImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "profileDemo"))
            
            self.userProfileTitleImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "placeHolderRect"))
            self.userProfileTitleImageView.addRadiusAndBGColour(14, .clear)
        }else{
            self.userProfileTitleImageView.image = UIImage(named: "placeHolderRect")
            
//            self.userProfileTitleImageView.backgroundColor = GoodWorkAppColor.appAuroMetalSaurus
            self.userProfileTitleImageView.addRadiusAndBGColour(0, .clear)
            self.userProfileImageView.image = UIImage(named: "profileDemo")
        }
        self.userNameLabel.text = "\(appDelegate.nurseProfile?.data?.first_name ?? "")"
        
        self.userFullNameLable.text = "\(appDelegate.nurseProfile?.data?.fullName ?? "")"
        
        if appDelegate.nurseProfile?.data?.image ?? "" != ""{
            
            self.userProfileImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "profileDemo"))
            
            self.userProfileTitleImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "placeHolderRect"))
            self.userProfileTitleImageView.addRadiusAndBGColour(14, .clear)
        }else{
            self.userProfileTitleImageView.image = UIImage(named: "placeHolderRect")
            self.userProfileTitleImageView.addRadiusAndBGColour(0, .clear)
//            self.userProfileTitleImageView.backgroundColor = GoodWorkAppColor.appAuroMetalSaurus
            
            self.userProfileImageView.image = UIImage(named: "profileDemo")
        }
        self.completeProfileCount.text = "(\(String(describing: appDelegate.nurseProfile?.data?.profile_completion ?? 0))/6)"
  
        self.completeProfileProgressView.progress = updateProfileProgress()
    }
}

extension MyProfileVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.profileInfoTableview.register(UINib(nibName: ProfileInfoTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: ProfileInfoTableViewCell.reuseCellIdentifier)
        
        self.profileInfoTableview.delegate = self
        self.profileInfoTableview.dataSource = self
        
        self.profileInfoTableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.profileDetailsAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTableViewCell.reuseCellIdentifier, for: indexPath) as! ProfileInfoTableViewCell

        cell.updateProfileData(indexPath.row,txt: self.profileDetailsAry[indexPath.row])
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
        
        self.openProfileDetailsVC(indexPath.row)
    }
}

extension MyProfileVC {
    func openProfileDetailsVC(_ indexNo : Int){
        
        switch  indexNo{
        case 0:
            print("0")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: PersonalInfomationVC.storyBoardIdentifier) as? PersonalInfomationVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("1")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ResumeVC.storyBoardIdentifier) as? ResumeVC else { return }
            vc.resumeStr = appDelegate.nurseProfile?.data?.resume ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("2")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: LicensesVC.storyBoardIdentifier) as? LicensesVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            print("3")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: CertificationVC.storyBoardIdentifier) as? CertificationVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            print("4")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: EducationVC.storyBoardIdentifier) as? EducationVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            print("5")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ExperienceVC.storyBoardIdentifier) as? ExperienceVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("default")
        }
        
    }
}

//MARK:- Button Actions
extension MyProfileVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.settingButton.addTarget(self, action: #selector(self.settingButtonPressed(_:)), for: .touchUpInside)
        self.clickOnProfileButton.addTarget(self, action: #selector(self.clickOnProfileButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settingButtonPressed(_ sender: UIButton){
        print("settingButtonPressed")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: SettingsVC.storyBoardIdentifier) as? SettingsVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickOnProfileButtonPressed(_ sender: UIButton){
        print("clickOnProfileButtonPressed")
        ImagePickerManager().pickImage(self){ image in
            self.userProfileImageView.image = image
            self.userProfileTitleImageView.image = image
            self.userProfileTitleImageView.addRadiusAndBGColour(14, .clear)
            self.uploadLogoImage()
        }
    }
}

extension MyProfileVC {
    
    func uploadLogoImage(){
        
        self.startLoading()
        var userName = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        let imgData = self.userProfileTitleImageView.image!.jpegData(compressionQuality: 1) ?? Data()
        //Optional for extra parameter
        let header = ["Authorization": "Bearer" + " " + APIDataHandler.shared.getSessionToken()]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "profile_image",fileName: "file.jpg", mimeType: "image/jpg")
        },
                         to:"https://goodwork.jobpazi.in/api/update-profile-picture?user_id=\(userName)&api_key=goodwork@123",headers: header)
        { (result) in
            switch result {
            case .success(let upload, _ , _ ):
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                upload.responseJSON { response in
                    print("Result=====",response.result.value)
                    
                    if let dict = response.result.value as? NSDictionary{
                        let code = dict.value(forKey: "api_status") as? String ?? "1"
                        let messageStr = dict.value(forKey: "message") as? String ?? ""
                        if code == "1"{
                            print("True 200")
                            self.notificationBanner(messageStr)
                            self.obj?.updateProfilePhotoPro()
                        }else{
                            self.notificationBanner("Something went wrong please try again")
                        }
                        self.stopLoading()
                    }
                }
                
            case .failure(let encodingError):
                print(encodingError)
                self.view.isUserInteractionEnabled = true
                //                self.activityindicator.stopAnimating()
                //self.btnSave.isUserInteractionEnabled = true
                self.stopLoading()
                self.notificationBanner("Something went wrong please try again")
                
            }
        }
    }
}

extension MyProfileVC {
    
    func nurseProfileAPI(){
        
        var mdl = NurseProfileRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.role = "nurse"
        mdl.nurse_id = appDelegate.nurseProfile?.data?.nurse_id ?? ""
        
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
                            
                            print("profile_details:: \(appDelegate.nurseProfile?.data?.profile_details ?? "")")
                            
                            if appDelegate.nurseProfile?.data?.image ?? "" != ""{
                               
                            }else{
//                                self.profileImageView.image = UIImage(named: "profileDemo")
                                self.updateNurseProfileData()
                            }
                        }else{
                            print("falsee")
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        
                    }catch{
                        print("catch:: \(error)")
                        
                        self.notificationBanner(response["message"] as? String ?? "")
                    }
                    
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                self.updateNurseProfileData()
                self.stopLoading()
                self.profileInfoTableview.reloadData()
            }
        }
    }
}

extension MyProfileVC : UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
}
