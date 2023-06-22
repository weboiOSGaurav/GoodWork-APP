//
//  EducationVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit

class EducationVC: BaseVC {
    
    static let storyBoardIdentifier = "EducationVC"
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var educationTitleLabel: UILabel!
    
    
    @IBOutlet weak var institutionNameBGView: UIView!
    @IBOutlet weak var institutionNameShadowView: UIView!
    @IBOutlet weak var institutionNameTextField: UITextField!
    
    @IBOutlet weak var myDegreesBGView: UIView!
    @IBOutlet weak var myDegreesShadowView: UIView!
    @IBOutlet weak var myDegreesTextField: UITextField!
    
    @IBOutlet weak var associateImageView: UIImageView!
    @IBOutlet weak var associateDegreeLabel: UILabel!
    
    @IBOutlet weak var bachelorImageView: UIImageView!
    @IBOutlet weak var bachelorOfScieceLabel: UILabel!
    
    @IBOutlet weak var masterImageView: UIImageView!
    @IBOutlet weak var masterOfScieceLabel: UILabel!
    
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorOfNursingLabel: UILabel!
    
    
    @IBOutlet weak var areaOfStudyBGView: UIView!
    @IBOutlet weak var areaOfStudyShadowView: UIView!
    @IBOutlet weak var areaOfStudyTextField: UITextField!
    
    @IBOutlet weak var graduationDateBGView: UIView!
    @IBOutlet weak var graduationDateShadowView: UIView!
    @IBOutlet weak var graduationDateTextField: UITextField!
    
    private lazy var grdDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
        self.progressView.progress = updateProfileProgress()
        self.institutionNameTextField.text = appDelegate.nurseProfile?.data?.college_uni_name ?? ""
        
        self.institutionNameTextField.text = appDelegate.nurseProfile?.data?.college_uni_name ?? ""
        
        self.myDegreesTextField.text =  appDelegate.nurseProfile?.data?.highest_nursing_degree_definition ?? ""
        
        self.areaOfStudyTextField.text =  appDelegate.nurseProfile?.data?.study_area ?? ""
        
        self.graduationDateTextField.text =  appDelegate.nurseProfile?.data?.graduation_date ?? ""
        
        switch appDelegate.nurseProfile?.data?.highest_nursing_degree_definition ?? "" {
            
        case "Associate Degree in Nursing (ADN)":
            self.updateDegreeCheckBox(0)
            
        case "Bachelor of Science in Nursing (BSN)":
            self.updateDegreeCheckBox(1)
            
        case "Master of Science in Nursing (MSN)":
            self.updateDegreeCheckBox(2)
            
        case "Doctor of Nursing Practice (DNP)":
            self.updateDegreeCheckBox(2)
            
        default:
            print("default")
        }
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.educationTitleLabel.addTitleColorAndFont(title: "Education", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.institutionNameBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.institutionNameShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.institutionNameTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.institutionNameTextField.placeholder = "Institution name"
        self.institutionNameTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.myDegreesBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.myDegreesShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.myDegreesTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.myDegreesTextField.placeholder = "My degrees"
        self.myDegreesTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.areaOfStudyBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.areaOfStudyShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.areaOfStudyTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.areaOfStudyTextField.placeholder = "Area of study"
        self.areaOfStudyTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.graduationDateBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.graduationDateShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.graduationDateTextField.textColor = GoodWorkAppColor.appDarkPurple
        self.graduationDateTextField.placeholder = "Graduation date"
        self.graduationDateTextField.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 16)
        
        self.associateImageView.image = UIImage(named: "unCheckRectangle")
        self.bachelorImageView.image = UIImage(named: "unCheckRectangle")
        self.masterImageView.image = UIImage(named: "unCheckRectangle")
        self.doctorImageView.image = UIImage(named: "unCheckRectangle")
        
        self.associateDegreeLabel.addTitleColorAndFont(title: "Associate Degree in Nursing (ADN)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.bachelorOfScieceLabel.addTitleColorAndFont(title:"Bachelor of Science in Nursing (BSN)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.masterOfScieceLabel.addTitleColorAndFont(title: "Master of Science in Nursing (MSN)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.doctorOfNursingLabel.addTitleColorAndFont(title: "Doctor of Nursing Practice (DNP)", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.institutionNameTextField.updateCursorColour()
        self.myDegreesTextField.updateCursorColour()
        self.areaOfStudyTextField.updateCursorColour()
        self.graduationDateTextField.updateCursorColour()
        
        self.buttonActions()
        self.setUPDatePicker()
    }
    
    func setUPDatePicker(){
        self.graduationDateTextField.inputView = self.grdDatePicker
        
        if #available(iOS 14, *) {
            self.grdDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.grdDatePicker.addTarget(self, action: #selector(self.handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.graduationDateTextField.text = formatter.string(from: sender.date)
    }
}

//MARK:- Button Actions
extension EducationVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton){
        print("skipButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton){
        print("saveButtonPressed")
        if self.validate() {
            self.uploadNurseEducationDetailAPI()
        }
    }
    
    @IBAction func degreeTypeButtonPressed(_ sender: UIButton){
        print("degreeTypeButtonPressed")
        self.updateDegreeCheckBox(sender.tag)
    }
 
    func updateDegreeCheckBox(_ tag : Int){
        self.associateImageView.image = UIImage(named: "unCheckRectangle")
        self.bachelorImageView.image = UIImage(named: "unCheckRectangle")
        self.masterImageView.image = UIImage(named: "unCheckRectangle")
        self.doctorImageView.image = UIImage(named: "unCheckRectangle")
        
        switch tag{
        case 0:
            print("0")
            self.myDegreesTextField.text = self.associateDegreeLabel.text ?? ""
            self.associateImageView.image = UIImage(named: "checkRectangle")
        case 1:
            print("1")
            self.myDegreesTextField.text = self.bachelorOfScieceLabel.text ?? ""
            self.bachelorImageView.image = UIImage(named: "checkRectangle")
        case 2:
            print("2")
            self.myDegreesTextField.text = self.masterOfScieceLabel.text ?? ""
            self.masterImageView.image = UIImage(named: "checkRectangle")
        case 3:
            print("3")
            self.myDegreesTextField.text = self.doctorOfNursingLabel.text ?? ""
            self.doctorImageView.image = UIImage(named: "checkRectangle")
        default:
            print("default")
        }
    }
}

extension EducationVC {
    func validate() -> Bool{
        if self.institutionNameTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.instName.rawValue)
            return false
        }else if self.myDegreesTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.myDegree.rawValue)
            return false
        }else if self.areaOfStudyTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.areaOfStudy.rawValue)
            return false
        }else if self.graduationDateTextField.text!.isEmpty{
            self.notificationBanner(AlertMassage.graduationDate.rawValue)
            return false
        }else{
            return true
        }
    }
}

extension EducationVC {
    
    
    func uploadNurseEducationDetailAPI(){
        
        var mdl = EducationDetailRequest()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
        mdl.college_uni_name = self.institutionNameTextField.text ?? ""
        mdl.graduation_date = self.graduationDateTextField.text ?? ""
        mdl.study_area = self.areaOfStudyTextField.text ?? ""
        mdl.highest_nursing_degree = self.myDegreesTextField.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.educationDetailAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    self.navigationController?.popViewController(animated: true)
                    self.notificationBanner(response["message"] as? String ?? "")
                }else{
                    print("False")
                }
                
                self.stopLoading()
            }
        }
    }
}
