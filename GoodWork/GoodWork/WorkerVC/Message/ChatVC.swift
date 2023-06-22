//
//  ChatVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 17/04/23.
//

import UIKit

class ChatVC: UIViewController {
    
    static let storyBoardIdentifier = "ChatVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
  
    
    @IBOutlet weak var userProfilePicImageView: UIImageView!
    @IBOutlet weak var isUserOnlineImageView: UIImageView!
    
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var typeDescription: UILabel!
    
    
    @IBOutlet weak var messageTextBGView: UIView!
    @IBOutlet weak var messageTextShadowBGView: UIView!
    
    
    @IBOutlet weak var shareMediaImageView: UIImageView!
    @IBOutlet weak var shareMediaButton: UIButton!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.userProfilePicImageView.image = UIImage(named: "Shape")
        
        self.userType.addTitleColorAndFont(title: "Recruiter #01", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        self.typeDescription.addTitleColorAndFont(title: "Travel Nurse CRNA/.....", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 10, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.messageTextBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 16)
        self.messageTextShadowBGView.shadowWithRadiusAndColour(16,GoodWorkAppColor.appArsenic)
        
        self.shareMediaImageView.image = UIImage(named: "shareMedia")
        
        self.loadTableView()
        
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension ChatVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.shareMediaButton.addTarget(self, action: #selector(self.shareMediaButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func shareMediaButtonPressed(_ sender: UIButton){
        print("shareMediaButtonPressed")
    }
}

extension ChatVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.chatTableView.register(UINib(nibName: LoginUserTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: LoginUserTableViewCell.reuseCellIdentifier)
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        
        self.chatTableView.register(UINib(nibName: UserTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.reuseCellIdentifier)
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        
        self.chatTableView.rowHeight = UITableView.automaticDimension
        self.chatTableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        self.chatTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 100))
        
        headerView.backgroundColor = .clear
        
        let  headerTitleLabel = UILabel()
        headerTitleLabel.frame = CGRect.init(x: 5, y: 0, width: headerView.frame.width-10, height: 50)
        
        headerTitleLabel.addTitleColorAndFont(title: "Today", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        headerTitleLabel.textAlignment = .center
        
        headerView.addSubview(headerTitleLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoginUserTableViewCell.reuseCellIdentifier, for: indexPath) as! LoginUserTableViewCell
            cell.messageLabel.text = "Hello! Jhon abraham"
            return  cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseCellIdentifier, for: indexPath) as! UserTableViewCell
            return  cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
