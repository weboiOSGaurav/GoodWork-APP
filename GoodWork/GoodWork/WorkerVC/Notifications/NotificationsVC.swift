
import UIKit
import NotificationBannerSwift

class NotificationsVC: BaseVC {
    
    static let storyBoardIdentifier = "NotificationsVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var notificationListTableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "Notifications", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.backButtonImageview.image = UIImage(named: "backButton")
        
        self.loadTableView()
        self.buttonActions()
    }
}

extension NotificationsVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.notificationListTableview.register(UINib(nibName: NotificationTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: NotificationTableViewCell.reuseCellIdentifier)
        
        self.notificationListTableview.delegate = self
        self.notificationListTableview.dataSource = self
        
        self.notificationListTableview.rowHeight = UITableView.automaticDimension
        self.notificationListTableview.estimatedRowHeight = UITableView.automaticDimension
        
        //  self.settingListTableview.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.reuseCellIdentifier, for: indexPath) as! NotificationTableViewCell
        //
        //        cell.settingTitleLable.text = self.settingListAry[indexPath.row]
        //        print("Settings :: \(self.settingListAry[indexPath.row])")
        //
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Swift 4.2 onwards
        return UITableView.automaticDimension
    }
}

//MARK:- Button Actions
extension NotificationsVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}
