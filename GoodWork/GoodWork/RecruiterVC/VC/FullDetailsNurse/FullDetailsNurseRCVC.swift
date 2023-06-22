//
//  FullDetailsNurseRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/04/23.
//

import UIKit
import NotificationBannerSwift


class FullDetailsNurseRCVC: BaseVC {
    
    static let storyBoardIdentifier = "FullDetailsNurseRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var applDetailsTableView: UITableView!
    @IBOutlet weak var jobAppliedLabel: UILabel!
    
    @IBOutlet weak var certificatListTableView: UITableView!
    
    @IBOutlet weak var personalInfoTitleLabel: UILabel!
    @IBOutlet weak var personalInfoDetailsLabel: UILabel!
    
    @IBOutlet weak var socialTitleLabel: UILabel!
    @IBOutlet weak var socialNumberLabel: UILabel!
    
    @IBOutlet weak var driverLicenseTitleLabel: UILabel!
    @IBOutlet weak var driverLicenseDetailLabel: UILabel!
    
    @IBOutlet weak var resumeTitleLabel: UILabel!
    @IBOutlet weak var resumeTypeLabel: UILabel!
    @IBOutlet weak var resumeDownloadLabel: UILabel!
    
    @IBOutlet weak var licenseTitleLabel: UILabel!
    @IBOutlet weak var licenseNumberTitleLabel: UILabel!
    @IBOutlet weak var licenseNumberDesciptionLabel: UILabel!
    
    @IBOutlet weak var licenseTypeTitleLabel: UILabel!
    @IBOutlet weak var licenseTypeDesciptionLabel: UILabel!
    
    
    @IBOutlet weak var issuAuthorityTitleLabel: UILabel!
    @IBOutlet weak var issuAuthorityDesciptionLabel: UILabel!
    
    @IBOutlet weak var issuDateTitleLabel: UILabel!
    @IBOutlet weak var issuDateDesciptionLabel: UILabel!
    
    
    @IBOutlet weak var expDateTitleLabel: UILabel!
    @IBOutlet weak var expDateDesciptionLabel: UILabel!
    
    @IBOutlet weak var renewalDateTitleLabel: UILabel!
    @IBOutlet weak var renewalDateDesciptionLabel: UILabel!
    
    
    @IBOutlet weak var licenseStatusTitleLabel: UILabel!
    @IBOutlet weak var licenseStatusDesciptionLabel: UILabel!
    
    @IBOutlet weak var certificatinTitleLabel: UILabel!
    
    @IBOutlet weak var educationTitleLabel: UILabel!
    
    @IBOutlet weak var institutionNameTitleLabel: UILabel!
    @IBOutlet weak var institutionNameDescriptionLabel: UILabel!
    
    @IBOutlet weak var myDegreesTitleLabel: UILabel!
    @IBOutlet weak var myDegreesDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var areaOfStudyTitleLabel: UILabel!
    @IBOutlet weak var areaOfStudyDescriptionLabel: UILabel!
    
    @IBOutlet weak var graduationTitleLabel: UILabel!
    @IBOutlet weak var graduationDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var expTitleLabel: UILabel!
    @IBOutlet weak var expTypeLabel: UILabel!
    @IBOutlet weak var expTypeDescriptionLabel: UILabel!
    
    @IBOutlet weak var unitTitleLabel: UILabel!
    @IBOutlet weak var unitDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    
    @IBOutlet weak var startDateTitleLabel: UILabel!
    @IBOutlet weak var startDateDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var endDateTitleLabel: UILabel!
    @IBOutlet weak var endDateDescriptionLabel: UILabel!
    
    @IBOutlet weak var statusTitleLabel: UILabel!
    @IBOutlet weak var statusDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var moveToSubmittedButton: UIButton!
    
    @IBOutlet weak var appliedJobTableView: UITableView!
    
    @IBOutlet weak var appliedJobTableHeightConstrain: NSLayoutConstraint!
    
    var isFromChat = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
        if self.isFromChat {
            self.moveToSubmittedButton.isHidden = true
        }else{
            self.moveToSubmittedButton.isHidden = false
        }
        
        print("FullDetailsNurseRCVC")
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.personalInfoTitleLabel.addTitleColorAndFont(title: "Personal Information", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.personalInfoDetailsLabel.addTitleColorAndFont(title: "Mary Smith  Healthcare is seeking a CRNA Anesthesia Manager\nfor a job in Los Angeles, CA.", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
      
        self.socialTitleLabel.addTitleColorAndFont(title: "Social Security Number:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.socialNumberLabel.addTitleColorAndFont(title: "CRNA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.driverLicenseTitleLabel.addTitleColorAndFont(title: "Driver’s license:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.driverLicenseDetailLabel.addTitleColorAndFont(title: "Anesthesia", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.resumeTitleLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.resumeTypeLabel.addTitleColorAndFont(title: "Resume.pdf", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.resumeDownloadLabel.addTitleColorAndFont(title: "Download", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.licenseTitleLabel.addTitleColorAndFont(title: "Licenses", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.licenseNumberTitleLabel.addTitleColorAndFont(title: "License Number:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.licenseNumberDesciptionLabel.addTitleColorAndFont(title: "LN XXXX 1234", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.licenseTypeTitleLabel.addTitleColorAndFont(title: "License Type:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.licenseTypeDesciptionLabel.addTitleColorAndFont(title: "Licensed Practical Nurse (LPN)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.issuAuthorityTitleLabel.addTitleColorAndFont(title: "Issuing Authority:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.issuAuthorityDesciptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.issuDateTitleLabel.addTitleColorAndFont(title: "Issue Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.issuDateDesciptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.expDateTitleLabel.addTitleColorAndFont(title: "Expiration Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.expDateDesciptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.renewalDateTitleLabel.addTitleColorAndFont(title: "Renewal Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.renewalDateDesciptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.licenseStatusTitleLabel.addTitleColorAndFont(title: "License Status:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.licenseStatusDesciptionLabel.addTitleColorAndFont(title: "Active", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.certificatinTitleLabel.addTitleColorAndFont(title: "Certification(2)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        
        self.educationTitleLabel.addTitleColorAndFont(title: "Education", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.institutionNameTitleLabel.addTitleColorAndFont(title: "Institution Name:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.institutionNameDescriptionLabel.addTitleColorAndFont(title: "Lorem sum dummy", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.myDegreesTitleLabel.addTitleColorAndFont(title: "My Degrees:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.myDegreesDescriptionLabel.addTitleColorAndFont(title: "Associate Degree in Nursing (ADN)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.areaOfStudyTitleLabel.addTitleColorAndFont(title: "Area Of Study:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.areaOfStudyDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.graduationTitleLabel.addTitleColorAndFont(title: "Graduation Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.graduationDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        
        
        
        self.expTitleLabel.addTitleColorAndFont(title: "Experiences", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.expTypeLabel.addTitleColorAndFont(title: "Experience Type:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.expTypeDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.unitTitleLabel.addTitleColorAndFont(title: "Unit:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.unitDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.jobTitleLabel.addTitleColorAndFont(title: "Job Title:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.jobDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.startDateTitleLabel.addTitleColorAndFont(title: "Start Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.startDateDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.endDateTitleLabel.addTitleColorAndFont(title: "End Date:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.endDateDescriptionLabel.addTitleColorAndFont(title: "Lorem sum", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.statusTitleLabel.addTitleColorAndFont(title: "Status:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
    
        self.statusDescriptionLabel.addTitleColorAndFont(title: "Currently working", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.jobAppliedLabel.addTitleColorAndFont(title: "Jobs Applied(2)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.moveToSubmittedButton.addRadiusAndBGColour((self.moveToSubmittedButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        self.loadTableView()
        self.buttonActions()
        
        self.personalInfoDetailsLabel.addTitleColorAndFont(title: "Mary Smith  Healthcare is seeking a CRNA Anesthesia Manager\nfor a job in Los Angeles, CA.", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        let attributedString = NSMutableAttributedString(string: "Mary Smith  Healthcare is seeking a CRNA Anesthesia Manager for a job in Los Angeles, CA.")

        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()

        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 6 // Whatever line spacing you want in points

        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        // *** Set Attributed String to your label ***
        self.personalInfoDetailsLabel.attributedText = attributedString
    }
}

//MARK:- Button Actions
extension FullDetailsNurseRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.moveToSubmittedButton.addTarget(self, action: #selector(self.moveToSubmittedButtonPress(_:)), for: .touchUpInside)
        self.shareButton.addTarget(self, action: #selector(self.shareButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveToSubmittedButtonPress(_ sender: UIButton){
        print("moveToSubmittedButtonPress")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: MoveToSubmitRCVC.storyBoardIdentifier) as? MoveToSubmitRCVC else { return }
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton){
        print("notificationButtonPressed")
        self.notificationBanner(AlertMassage.comingSoon.rawValue)
    }
    
}

extension FullDetailsNurseRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.applDetailsTableView.register(UINib(nibName: ScreeningRCTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier)
        self.applDetailsTableView.delegate = self
        self.applDetailsTableView.dataSource = self
        
        self.applDetailsTableView.reloadData()
        
        self.appliedJobTableView.register(UINib(nibName: JobAppliedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: JobAppliedTableViewCell.reuseCellIdentifier)
        self.appliedJobTableView.delegate = self
        self.appliedJobTableView.dataSource = self
        
        self.appliedJobTableView.reloadData()
        
        
        self.certificatListTableView.register(UINib(nibName: CertListTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: CertListTableViewCell.reuseCellIdentifier)
        
        self.certificatListTableView.delegate = self
        self.certificatListTableView.dataSource = self
        
        self.certificatListTableView.reloadData()
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.appliedJobTableHeightConstrain.constant = self.appliedJobTableView.contentSize.height
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if self.appliedJobTableView == tableView{
            
            return 2
        }else if self.certificatListTableView == tableView{
            
            return 2
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.appliedJobTableView == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: JobAppliedTableViewCell.reuseCellIdentifier, for: indexPath) as! JobAppliedTableViewCell
            
            return cell
        }else if self.certificatListTableView == tableView{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CertListTableViewCell.reuseCellIdentifier, for: indexPath) as! CertListTableViewCell
            
            if indexPath.row == 0 {
                
                cell.certiTypeLabel.text = "BLS"
            }else if indexPath.row == 1 {
                cell.certiTypeLabel.text = "CCRN"
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreeningRCTableViewCell.reuseCellIdentifier, for: indexPath) as! ScreeningRCTableViewCell
        
        cell.chatBgView.isHidden = true
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
        
        if self.certificatListTableView == tableView {
            
            guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: CertificationRCVC.storyBoardIdentifier) as? CertificationRCVC else { return }
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
    }
}
