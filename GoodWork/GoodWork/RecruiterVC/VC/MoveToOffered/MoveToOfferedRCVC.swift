//
//  MoveToOfferedRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 26/04/23.
//

import UIKit

class MoveToOfferedRCVC: UIViewController {
    
    static let storyBoardIdentifier = "MoveToOfferedRCVC"
    
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
    
    @IBOutlet weak var moveToSubmittedButton: UIButton!
    
    @IBOutlet weak var appliedJobTableView: UITableView!
    
    @IBOutlet weak var appliedJobTableHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var employerTitleLabel: UILabel!
    @IBOutlet weak var employerDetailsLabel: UILabel!
    
    @IBOutlet weak var submittedDateTitleLabel: UILabel!
    @IBOutlet weak var submittedDateDetailsLabel: UILabel!
    
    
    
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
        
        
        self.educationDetailLabel.addTitleColorAndFont(title: "Associate Degree in Nursing", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.certificationLabel.addTitleColorAndFont(title: "Relevant Certifications:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        self.certificationDetailLabel.addTitleColorAndFont(title: "BLS,CCRN", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.salaryExpctationLabel.addTitleColorAndFont(title: "Salary Expectation:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.salaryAmountLabel.addTitleColorAndFont(title: "$2500/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.yearOfExpLabel.addTitleColorAndFont(title: "Years of Experience:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        self.yearOfExpDetailLabel.addTitleColorAndFont(title: "3+ Years", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.resumeTitleLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.resumeTypeLabel.addTitleColorAndFont(title: "Resume.pdf", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.resumeDownloadLabel.addTitleColorAndFont(title: "Download", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobAppliedLabel.addTitleColorAndFont(title: "Jobs Applied(2)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.moveToSubmittedButton.addRadiusAndBGColour((self.moveToSubmittedButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.employerTitleLabel.addTitleColorAndFont(title: "Employer", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.employerDetailsLabel.addTitleColorAndFont(title: "AGC Hospital", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.submittedDateTitleLabel.addTitleColorAndFont(title: "Submitted Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.submittedDateDetailsLabel.addTitleColorAndFont(title: "14th Feb, 2023", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.loadTableView()
        self.buttonActions()
    }
    
    
}

//MARK:- Button Actions
extension MoveToOfferedRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.moveToSubmittedButton.addTarget(self, action: #selector(self.moveToSubmittedButtonPress(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveToSubmittedButtonPress(_ sender: UIButton){
        print("moveToSubmittedButtonPress")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: MoveToSubmitRCVC.storyBoardIdentifier) as? MoveToSubmitRCVC else { return }
        vc.isFromSubmitted = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
}

extension MoveToOfferedRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.applDetailsTableView.register(UINib(nibName: ScreeningRCTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier, for: indexPath) as! ScreeningRCTableViewCell
        cell.chatNowImageView.isHidden = true
        cell.chatBgView.isHidden = false
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
}
