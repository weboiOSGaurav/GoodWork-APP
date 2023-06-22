//
//  WorkingEmployeesRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/04/23.
//

import UIKit

class WorkingEmployeesRCVC: UIViewController {
    
    static let storyBoardIdentifier = "WorkingEmployeesRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var appDetailsLabel: UILabel!
    
    @IBOutlet weak var screeningTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.appDetailsLabel.addTitleColorAndFont(title: "Working Employees ", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.loadTableView()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension WorkingEmployeesRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}


extension WorkingEmployeesRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.screeningTableView.register(UINib(nibName: ScreeningRCTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier)
        self.screeningTableView.delegate = self
        self.screeningTableView.dataSource = self
        
        self.screeningTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier, for: indexPath) as! ScreeningRCTableViewCell
        
        cell.chatBgView.isHidden = true
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: MoveToDoneRCVC.storyBoardIdentifier) as? MoveToDoneRCVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
//        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: WorkingRCVC.storyBoardIdentifier) as? WorkingRCVC else { return }
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
