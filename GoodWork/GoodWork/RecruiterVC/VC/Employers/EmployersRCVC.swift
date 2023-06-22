//
//  EmployersRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 24/04/23.
//

import UIKit

class EmployersRCVC: BaseVC {
    
    static let storyBoardIdentifier = "EmployersRCVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var empoloyerTitleLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var noDataLabel: UILabel!
    
    @IBOutlet weak var employerListTableView: UITableView!
    
    var employerListArray = ["Mary Washington Healthcare", "Medical Solutions"]
    
    var employersList : EmployersList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.nameTitleLabel.isHidden = true
        self.noDataLabel.isHidden = true
        self.employersAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "Arrow")
        
        self.empoloyerTitleLabel.addTitleColorAndFont(title: "Employers", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.nameTitleLabel.addTitleColorAndFont(title: "Name", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.noDataLabel.addTitleColorAndFont(title: "No data", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        self.buttonActions()
        self.loadTableView()
    }
}

//MARK:- Button Actions
extension EmployersRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension EmployersRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.employerListTableView.register(UINib(nibName: PersonalInfoDetailsTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: PersonalInfoDetailsTableViewCell.reuseCellIdentifier)
        self.employerListTableView.delegate = self
        self.employerListTableView.dataSource = self
        
        self.employerListTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return self.employersList?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoDetailsTableViewCell.reuseCellIdentifier, for: indexPath) as! PersonalInfoDetailsTableViewCell
        
        cell.profileInfoLabel.text = self.employersList?.data?[indexPath.row] ?? ""
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
}

extension EmployersRCVC {
    
    func employersAPI(){
        
        var mdl = GetEmployersRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getEmployersRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let homeResp = try JSONDecoder().decode(EmployersList.self, from: jsonData)
                        
                        self.employersList = homeResp
                        
                        if self.employersList?.api_status == "1"{
                            
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
                
                if self.employersList?.data?.count == 0 {
                    self.nameTitleLabel.isHidden = true
                    self.noDataLabel.isHidden = false
                }else{
                    self.nameTitleLabel.isHidden = false
                    self.noDataLabel.isHidden = true
                }
                
                self.employerListTableView.reloadData()
                self.stopLoading()
            }
        }
    }
}
