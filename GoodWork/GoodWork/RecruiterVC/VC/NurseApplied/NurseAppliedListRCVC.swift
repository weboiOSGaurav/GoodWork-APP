//
//  NurseAppliedListRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/04/23.
//

import UIKit

class NurseAppliedListRCVC: UIViewController {
    
    static let storyBoardIdentifier = "NurseAppliedListRCVC"
    
    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var topLine: UIView!
    
    @IBOutlet weak var crossImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nurseTitleLabel: UILabel!
    
    @IBOutlet weak var nurseDetailsListTableview: UITableView!
    
    var pushOnHoldNurseVC : pushOnHoldNurseVC?
    var shoTabBarOBJ : shoTabBarVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func setUPUI(){
        
        self.view.backgroundColor = GoodWorkAppColor.appBlack.withAlphaComponent(0.55)
        self.mainBGView.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.mainBGView.layer.cornerRadius = 30
        self.mainBGView.clipsToBounds = true
        
        self.topLine.layer.cornerRadius = self.topLine.frame.height / 2
        self.topLine.clipsToBounds = true
        
        self.crossImageView.image = UIImage(named: "Close")
        
        self.nurseTitleLabel.addTitleColorAndFont(title: "Nurses Applied", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 24, tintColor: GoodWorkAppColor.appMirage)
        self.loadTableView()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension NurseAppliedListRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.closeButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.shoTabBarOBJ?.shoTabBarVC()
        self.dismiss(animated: true, completion: nil)
    }
}

extension NurseAppliedListRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.nurseDetailsListTableview.register(UINib(nibName: ScreeningRCTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier)
        self.nurseDetailsListTableview.delegate = self
        self.nurseDetailsListTableview.dataSource = self
        
        self.nurseDetailsListTableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier, for: indexPath) as! ScreeningRCTableViewCell
        cell.chatBgView.isHidden = true
        cell.chatNowImageView.isHidden = false
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.tabBarController?.tabBar.isHidden = false
        self.dismiss(animated: false, completion: nil)
        self.pushOnHoldNurseVC?.pushOnHoldNurseVC()
    }
}
