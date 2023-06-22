//
//  UpdateJobStatusViewController.swift
//  GoodWork
//
//  Created by Gaurav Jani on 15/05/23.
//

import UIKit

class UpdateJobStatusViewController: UIViewController {
    
    static let storyBoardIdentifier = "UpdateJobStatusViewController"
    
    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var topLine: UIView!
    
    @IBOutlet weak var updateJobStatusTitle: UILabel!
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var updateJobStatusTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    
    private let ststusArray = ["Submitted","Offered","Onboarding","Working","Done"]
    
    private var selectedType = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setUPUI(){
        
        self.view.backgroundColor = GoodWorkAppColor.appBlack.withAlphaComponent(0.55)
        self.mainBGView.backgroundColor =  GoodWorkAppColor.appDarkPink
        
        self.mainBGView.layer.cornerRadius = 16
        self.mainBGView.clipsToBounds = true
        
        self.topLine.layer.cornerRadius = self.topLine.frame.height / 2
        self.topLine.clipsToBounds = true
        
        self.closeImageView.image = UIImage(named: "Close")
        
        self.updateJobStatusTitle.addTitleColorAndFont(title: "Update Job Status", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 20, tintColor: GoodWorkAppColor.appMirage)
        self.loadTableView()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension UpdateJobStatusViewController {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.closeButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension UpdateJobStatusViewController : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.updateJobStatusTableView.register(UINib(nibName: UpdateJobStatusTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: UpdateJobStatusTableViewCell.reuseCellIdentifier)
        self.updateJobStatusTableView.delegate = self
        self.updateJobStatusTableView.dataSource = self
        
       
        self.updateJobStatusTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ststusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UpdateJobStatusTableViewCell.reuseCellIdentifier, for: indexPath) as! UpdateJobStatusTableViewCell
        cell.jobStatusTitleLabel.text = self.ststusArray[indexPath.row]
        if self.selectedType == indexPath.row{
            cell.selectedJobImage.image = UIImage(named: "checkJobStatus")
        }else{
            cell.selectedJobImage.image = UIImage(named: "unCheckJobStatus")
        }
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("indexPath.row \(indexPath.row)")
        self.selectedType = indexPath.row
        self.updateJobStatusTableView.reloadData()
    }
}
