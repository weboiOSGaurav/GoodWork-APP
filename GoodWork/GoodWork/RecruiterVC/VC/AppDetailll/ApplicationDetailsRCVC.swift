//
//  ApplicationDetailsRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 26/04/23.
//

import UIKit

class ApplicationDetailsRCVC: UIViewController {

    static let storyBoardIdentifier = "ApplicationDetailsRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var appDetailsLabel: UILabel!
    
    @IBOutlet weak var shareImageView: UIImageView!
    
    @IBOutlet weak var applDetailsTableView: UITableView!
    
    
    @IBOutlet weak var changeAppStatusLabel: UILabel!
    
    @IBOutlet weak var statusBGView: UIView!
    @IBOutlet weak var statusArrow: UIImageView!
    @IBOutlet weak var selectStatusLabel: UILabel!
    
    
    @IBOutlet weak var aboutNurseLabel: UILabel!
    @IBOutlet weak var educationLevelLabel: UILabel!
    @IBOutlet weak var educationDetailLabel: UILabel!
    
    @IBOutlet weak var yearOfExpLabel: UILabel!
    @IBOutlet weak var yearOfExpDetailLabel: UILabel!
    
    @IBOutlet weak var certificationLabel: UILabel!
    @IBOutlet weak var certificationDetailLabel: UILabel!
    
    
    @IBOutlet weak var salaryExpctationLabel: UILabel!
    @IBOutlet weak var salaryAmountLabel: UILabel!
    
    
    @IBOutlet weak var resumeTitleLabel: UILabel!
    @IBOutlet weak var resumeTypeLabel: UILabel!
    
    @IBOutlet weak var resumeDownloadLabel: UILabel!
    
    @IBOutlet weak var jobAppliedLabel: UILabel!
    
    @IBOutlet weak var chatNowButton: UIButton!
    
    @IBOutlet weak var appliedJobTableView: UITableView!
    
    @IBOutlet weak var appliedJobTableHeightConstrain: NSLayoutConstraint!
    
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
        
        self.appDetailsLabel.addTitleColorAndFont(title: "Applicant Details", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.changeAppStatusLabel.addTitleColorAndFont(title: "Change Application Status", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.statusBGView.addBorderAndCorner(2, 12, GoodWorkAppColor.appDarkPurple)

        self.selectStatusLabel.addTitleColorAndFont(title: "Select Status", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        self.selectStatusLabel.backgroundColor =  GoodWorkAppColor.appWhite
        self.statusArrow.image = UIImage(named: "Stroke11")
        
        
        self.aboutNurseLabel.addTitleColorAndFont(title: "About Worker", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.educationLevelLabel.addTitleColorAndFont(title: "Education Level:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.educationDetailLabel.addTitleColorAndFont(title: "Master of Science in Nursing", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
       
        
        self.certificationLabel.addTitleColorAndFont(title: "Relevant Certifications:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        self.certificationDetailLabel.addTitleColorAndFont(title: "ACLS, PALS", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.salaryExpctationLabel.addTitleColorAndFont(title: "Salary Expectation:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.salaryAmountLabel.addTitleColorAndFont(title: "$2500/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.yearOfExpLabel.addTitleColorAndFont(title: "Years of Experience:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        self.yearOfExpDetailLabel.addTitleColorAndFont(title: "8+ Years", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        

        self.resumeTitleLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.resumeTypeLabel.addTitleColorAndFont(title: "Resume.pdf", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.resumeDownloadLabel.addTitleColorAndFont(title: "Download", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobAppliedLabel.addTitleColorAndFont(title: "Jobs Applied(2)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.chatNowButton.addRadiusAndBGColour((self.chatNowButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        self.loadTableView()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension ApplicationDetailsRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}

extension ApplicationDetailsRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.applDetailsTableView.register(UINib(nibName: NewApplicationChatTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: NewApplicationChatTableViewCell.reuseCellIdentifier)
        self.applDetailsTableView.delegate = self
        self.applDetailsTableView.dataSource = self
        
        self.applDetailsTableView.reloadData()
        
        self.appliedJobTableView.register(UINib(nibName: JobAppliedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: JobAppliedTableViewCell.reuseCellIdentifier)
        self.appliedJobTableView.delegate = self
        self.appliedJobTableView.dataSource = self
        
        self.appliedJobTableView.reloadData()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.appliedJobTableHeightConstrain.constant = self.appliedJobTableView.contentSize.height
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if self.appliedJobTableView == tableView{
            
            return 2
        }
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.appliedJobTableView == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: JobAppliedTableViewCell.reuseCellIdentifier, for: indexPath) as! JobAppliedTableViewCell
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewApplicationChatTableViewCell.reuseCellIdentifier, for: indexPath) as! NewApplicationChatTableViewCell
        
            cell.chatBgView.isHidden = true
            cell.jobIDRChatLabel.isHidden = true
            
            cell.chatImageView.isHidden = false
            cell.jobIDLabel.isHidden = false
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
}
