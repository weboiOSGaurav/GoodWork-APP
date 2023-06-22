//
//  WorkDetailsViewController.swift
//  GoodWork
//
//  Created by Gaurav Jani on 22/06/23.
//

import UIKit

class WorkDetailsVC: BaseVC {
    
    static let storyBoardIdentifier = "WorkDetailsVC"
    
    @IBOutlet weak var rightSideTopImageView: UIImageView!
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareBgView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var popularJobsTableView: UITableView!
    
    var obj : Popular_jobs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
        self.buttonActions()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.rightSideTopImageView.image = UIImage(named: "roundTopTwoColour")
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.shareImageView.image = UIImage(named: "share")
        
        self.shareBgView.addRadiusAndBGColour((self.shareBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        
        self.titleLable.addTitleColorAndFont(title: "Work Detail", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.loadTableView()
    }
}

//MARK:- Button Actions
extension WorkDetailsVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}

extension WorkDetailsVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.popularJobsTableView.register(UINib(nibName: PopularJobTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: PopularJobTableViewCell.reuseCellIdentifier)
        self.popularJobsTableView.delegate = self
        self.popularJobsTableView.dataSource = self
        
        self.popularJobsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularJobTableViewCell.reuseCellIdentifier, for: indexPath) as! PopularJobTableViewCell
        
        cell.updatePopularJobData(self.obj!)
        
        return cell
    }
}
