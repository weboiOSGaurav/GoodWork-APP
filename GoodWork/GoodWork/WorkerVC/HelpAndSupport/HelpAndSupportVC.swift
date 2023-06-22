//
//  HelpAndSupportVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 11/04/23.
//

import UIKit
import DropDown

class HelpAndSupportVC: BaseVC {
    
    static let storyBoardIdentifier = "HelpAndSupportVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var subjectTypeLabel: UILabel!
    @IBOutlet weak var dropDownImageView: UIImageView!
    
    @IBOutlet weak var subjectBGView: UIView!
    @IBOutlet weak var subjectShadowView: UIView!
    
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var issueDescriptionTextView: UITextView!
    @IBOutlet weak var issueBGView: UIView!
    @IBOutlet weak var issueShadowView: UIView!
    
    @IBOutlet weak var sendNowButton: UIButton!
    
   
    
    var subjectTypes : SubjectTypesList?
    
    var issueTypeID = 0
    
    let issueTypeDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.getSubjectTypesAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "Help & Support", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.subjectTypeLabel.addTitleColorAndFont(title: "Login", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.backButtonImageview.image = UIImage(named: "Arrow")
        
        
        self.dropDownImageView.image = UIImage(named: "dropArrow")
        
        self.subjectLabel.addTitleColorAndFont(title: "Subject", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.subjectBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.subjectShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.issueLabel.addTitleColorAndFont(title: "Issue", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.issueBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.issueShadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.sendNowButton.addRadiusBGColorTitleColorFont(title: "Send Now", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 16, radius: 28, bgColor: GoodWorkAppColor.appColour, tintColor: GoodWorkAppColor.appWhite)
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension HelpAndSupportVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.sendNowButton.addTarget(self, action: #selector(self.sendNowButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendNowButtonPressed(_ sender: UIButton){
        print("sendNowButtonPressed")
        
        if self.issueDescriptionTextView.text.isEmpty {
            self.notificationBanner(AlertMassage.helpIssue.rawValue)
            return
        }else{
            self.helpAndSupportAPI()
        }
    }
    
    @IBAction func selectIssueTypeButtonPressed(_ sender: UIButton){
        print("selectIssueTypeButtonPressed")
        self.setUpDropDownType()
    }
}

extension HelpAndSupportVC {
    
    func helpAndSupportAPI(){
        
        var mdl = HelpSupportRequest()
        mdl.user_id  = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.subject =  self.issueTypeID ?? 0
        mdl.issue = self.issueDescriptionTextView.text ?? ""
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getHelpSupportAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                self.stopLoading()
                if response["api_status"] as? String ?? "" == "1" {
                    self.navigationController?.popViewController(animated: true)
                }else{
                    print("False")
                }
                
                self.notificationBanner(response["message"] as? String ?? "")
            }
        }
    }
    
    func getSubjectTypesAPI(){
        
        var mdl = SubjectTypesRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getSubjectTypesAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                self.stopLoading()
                if response["api_status"] as? String ?? "" == "1" {
                    
                    DispatchQueue.main.async {
                        
                        let response = dict as? [String : Any] ??  [String : Any]()
                        
                        if response["api_status"] as? String ?? "" == "1" {
                            
                            do {
                                let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                                
                                let subjectResp = try JSONDecoder().decode(SubjectTypesList.self, from: jsonData)
                                
                                self.subjectTypes = subjectResp
                                
                                if self.subjectTypes?.api_status == "1"{
                                    print("if self.exploreNEW?.api_status")
                                }else{
                                    print("falsee")
                                }
                            }catch{
                                print("error \(error)")
                                print("catch \(error.localizedDescription)")
                            }
                        }else{
                            print("False")
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.stopLoading()
                        }
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
            }
        }
    }
}

extension HelpAndSupportVC {
    func setUpDropDownType(){
        
        if self.subjectTypes?.data?.count ?? 0 == 0 {
            return
        }
        
        var strName = [String]()
        
        self.issueTypeDropDown.anchorView = self.dropDownImageView
        
        var indNo = 0
        
        for _ in 1...(self.subjectTypes?.data?.count ?? 0){
            strName.append(self.subjectTypes?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.issueTypeDropDown.direction = .bottom
        self.issueTypeDropDown.bottomOffset = CGPoint(x: -115, y: 22)
        self.issueTypeDropDown.dataSource = strName
        self.issueTypeDropDown.width = 150
        self.issueTypeDropDown.show()
        
        self.dropDownImageView.transform =   self.dropDownImageView.transform.rotated(by: .pi)
        
        self.issueTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.dropDownImageView.transform =   (self?.dropDownImageView.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.subjectTypeLabel.text = item
            self?.issueTypeID = self?.subjectTypes?.data?[index].id ?? 0
        }
    }
}
