//
//  NewApplicationsRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 25/04/23.
//

import UIKit

class NewApplicationsRCVC: BaseVC {
    
    static let storyBoardIdentifier = "NewApplicationsRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var newAppLabel: UILabel!
    
    @IBOutlet weak var filterBGView: UIView!
    @IBOutlet weak var filterImageView: UIImageView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    
    
    @IBOutlet weak var applicationTableView: UITableView!
    
    
    
    var newAppList : Json4Swift_Base11?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.getNewApplicationsAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.newAppLabel.addTitleColorAndFont(title: "New Applications ", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.filterTitleLabel.addTitleColorAndFont(title: "Filters", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appLavender)
        
        self.filterBGView.addRadiusAndBGColour((self.filterBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        self.filterImageView.image = UIImage(named: "filterWhiteImg")
        
        self.loadTableView()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension NewApplicationsRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension NewApplicationsRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.applicationTableView.register(UINib(nibName: NewApplicationChatTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: NewApplicationChatTableViewCell.reuseCellIdentifier)
        self.applicationTableView.delegate = self
        self.applicationTableView.dataSource = self
        self.applicationTableView.backgroundColor = .clear
        
        self.applicationTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.newAppList?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewApplicationChatTableViewCell.reuseCellIdentifier, for: indexPath) as! NewApplicationChatTableViewCell
        
        cell.chatBgView.isHidden = true
        cell.jobIDRChatLabel.isHidden = true
        
        cell.chatImageView.isHidden = false
        cell.chatButton.isHidden = false
        cell.jobIDLabel.isHidden = false
        
        cell.updateNewApplicationData((self.newAppList?.data?[indexPath.row])!)
        
        cell.chatButton.tag = indexPath.row
        cell.chatButton.addTarget(self, action: #selector(self.chatButtonPress(sender:)), for: .touchUpInside)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ApplicationDetailsRCVC.storyBoardIdentifier) as? ApplicationDetailsRCVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
        print("didSelectRowAt \(indexPath.row)")
    }
    
    @objc func chatButtonPress(sender: UIButton){
        print("chatButtonPress \(sender.tag)")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ChatRCVC.storyBoardIdentifier) as? ChatRCVC else { return }
        vc.obj = (self.newAppList?.data?[sender.tag])!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
 
extension NewApplicationsRCVC{
    
    func getNewApplicationsAPI(){
        
        var mdl = GetNewApplicationsRequestRC()
        //        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        mdl.user_id = "f5a1104e-e2ae-4440-a7ad-01ecbf48af43"
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getNewApplicationsRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let exploreResp = try JSONDecoder().decode(Json4Swift_Base11.self, from: jsonData)
                        
                        self.newAppList = exploreResp
                        
                        print("do self.exploreNEW: \(self.newAppList)")
                        
                        if self.newAppList?.api_status == "1"{
                            print("if self.exploreNEW?.api_status")
                        }else{
                            print("falsee")
                        }
                        self.applicationTableView.reloadData()
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
