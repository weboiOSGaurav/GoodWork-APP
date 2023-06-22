//
//  MessageVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 29/03/23.
//

import UIKit

class MessageVC: UIViewController {
    
    static let storyBoardIdentifier = "BookMarkVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationBGView: UIView!
    
    @IBOutlet weak var messageListTableView: UITableView!
    @IBOutlet weak var notificationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
        self.profileImageView.image = UIImage(named: "profileDemo")
        
        if appDelegate.nurseProfile?.data?.image ?? "" != ""{
            
            self.profileImageView.sd_setImage(with: URL(string: appDelegate.nurseProfile?.data?.image ?? ""), placeholderImage: UIImage(named: "profileDemo"))
        }else{
            self.profileImageView.image = UIImage(named: "profileDemo")
        }
        
        self.userNameLabel.text = "\(appDelegate.nurseProfile?.data?.first_name ?? "")"
        
     
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "homeRightSideTop")
        self.profileImageView.image = UIImage(named: "drProfile")
        
        self.userNameLabel.addTitleColorAndFont(title: "James", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.notificationImageView.image = UIImage(named: "notification")
        self.notificationBGView.addRadiusAndBGColour((self.notificationBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.loadTableView()
        self.buttonActions()
    }
}

extension MessageVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.messageListTableView.register(UINib(nibName: messageListTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: messageListTableViewCell.reuseCellIdentifier)
        self.messageListTableView.delegate = self
        self.messageListTableView.dataSource = self
        
        self.messageListTableView.reloadData()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: messageListTableViewCell.reuseCellIdentifier, for: indexPath) as! messageListTableViewCell
            return  cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ChatVC.storyBoardIdentifier) as? ChatVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- Button Actions
extension MessageVC {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        self.notificationButton.addTarget(self, action: #selector(self.notificationButtonPressed(_:)), for: .touchUpInside)
      
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
}
