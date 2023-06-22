//
//  SettingsVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit
import NotificationBannerSwift

class SettingsVC: BaseVC {
    
    static let storyBoardIdentifier = "SettingsVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var settingListTableview: UITableView!
    
    @IBOutlet weak var logOutMainBGView: UIView!
    @IBOutlet weak var logOutView: UIView!
    @IBOutlet weak var crossImageView: UIImageView!
    @IBOutlet weak var yesLogOutButton: UIButton!
    
    @IBOutlet weak var closeLogOutButton: UIButton!
    @IBOutlet weak var logOutFromAppLabel: UILabel!
    @IBOutlet weak var areYouSureLabel: UILabel!
    
    let settingListAry = ["Account Info","About Us","Help & Support","Delete Account", "Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.logOutMainBGView.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "Settings", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.backButtonImageview.image = UIImage(named: "backButton")
        self.crossImageView.image = UIImage(named: "Close")
        
        self.logOutFromAppLabel.addTitleColorAndFont(title: "Logout from Application", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 24, tintColor: GoodWorkAppColor.appMirage)
        
        
        self.areYouSureLabel.addTitleColorAndFont(title: "Are you sure want \n\nto Log out?", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appBlack)
        
        
        self.yesLogOutButton.addRadiusBGColorTitleColorFont(title: "Yes, Logout", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, radius: self.yesLogOutButton.frame.height / 2, bgColor: GoodWorkAppColor.appDarkPurple, tintColor: GoodWorkAppColor.appOffWhite)
        
        
        self.logOutView.addRadiusAndBGColour(12, GoodWorkAppColor.appBGPink)
        self.logOutMainBGView.backgroundColor = GoodWorkAppColor.appBlack.withAlphaComponent(0.50)
        
        self.loadTableView()
        self.buttonActions()
    }
}

extension SettingsVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.settingListTableview.register(UINib(nibName: SettingsTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: SettingsTableViewCell.reuseCellIdentifier)
        
        self.settingListTableview.delegate = self
        self.settingListTableview.dataSource = self
        
        
        self.settingListTableview.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.settingListAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseCellIdentifier, for: indexPath) as! SettingsTableViewCell
        
        cell.settingTitleLable.text = self.settingListAry[indexPath.row]
        print("Settings :: \(self.settingListAry[indexPath.row])")
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
        
        self.openProfileDetailsVC(indexPath.row)
    }
}

extension SettingsVC {
    func openProfileDetailsVC(_ indexNo : Int){
        
        switch  indexNo{
        case 0:
            print("0")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: AccountInfoVC.storyBoardIdentifier) as? AccountInfoVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("1")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: AboutUS.storyBoardIdentifier) as? AboutUS else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("2")
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: HelpAndSupportVC.storyBoardIdentifier) as? HelpAndSupportVC else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            print("3")
//            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: PrivacyPoliciesVC.storyBoardIdentifier) as? PrivacyPoliciesVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
            self.alertDeleteAccount()
        case 4:
            
            
//            self.alertDeleteAccount()
            //            self.notificationBanner(AlertMassage.comingSoon.rawValue)
            _userDefault.set(false, forKey: UserDefaultKeys.isUserLogin.rawValue)
            _userDefault.synchronize()
            
            let destVC = self.storyboard?.instantiateViewController(withIdentifier: OnboardingVC.storyBoardIdentifier)
            let rootViewController = UINavigationController(rootViewController: destVC!)
            UIApplication.key?.rootViewController = rootViewController
        case 5:
            print("4")
            //            self.logOutMainBGView.isHidden = false
//            _userDefault.set(false, forKey: UserDefaultKeys.isUserLogin.rawValue)
//            _userDefault.synchronize()
//
//            let destVC = self.storyboard?.instantiateViewController(withIdentifier: OnboardingVC.storyBoardIdentifier)
//            let rootViewController = UINavigationController(rootViewController: destVC!)
//            UIApplication.key?.rootViewController = rootViewController
        default:
            print("default")
        }
    }
    
    func alertDeleteAccount(){
        
        
        let alertController = UIAlertController(title: "Are you sure?", message: "Want to delete your account", preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            print("OK")
            self.deleteNurseAccount()
         
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Cancel")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        
        self.present(alertController, animated: true, completion: nil)
    }
}

//MARK:- Button Actions
extension SettingsVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.yesLogOutButton.addTarget(self, action: #selector(self.yesLogOutButtonPressed(_:)), for: .touchUpInside)
        self.closeLogOutButton.addTarget(self, action: #selector(self.closeLogOutButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func closeLogOutButtonPressed(_ sender: UIButton){
        print("closeLogOutButtonPressed")
        
        self.logOutMainBGView.isHidden = true
    }
    
    @IBAction func yesLogOutButtonPressed(_ sender: UIButton){
        print("yesLogOutButtonPressed")
        
        //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //        let destVC = self.storyboard?.instantiateViewController(withIdentifier: OnboardingVC.storyBoardIdentifier)
        ////
        //
        //        let rootViewController = UINavigationController(rootViewController: destVC!)
        //        UIApplication.key?.rootViewController = rootViewController
    }
}

extension SettingsVC {

    func deleteNurseAccount(){
        
        var mdl = DeleteNurseAccountRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.deleteNurseAccountAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                self.stopLoading()
                if response["api_status"] as? String ?? "" == "1" {
                    
                    DispatchQueue.main.async {
                        _userDefault.set(false, forKey: UserDefaultKeys.isUserLogin.rawValue)
                        _userDefault.synchronize()
                        let destVC = self.storyboard?.instantiateViewController(withIdentifier: OnboardingVC.storyBoardIdentifier)
                        let rootViewController = UINavigationController(rootViewController: destVC!)
                        UIApplication.key?.rootViewController = rootViewController
                        
                        self.notificationBanner(response["message"] as? String ?? "")
                    }
                 }else{
                    
                    self.notificationBanner(response["message"] as? String ?? "")
                }
            }
        }
    }
}
    