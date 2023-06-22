//
//  AboutUS.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit

class AboutUS: BaseVC {

    static let storyBoardIdentifier = "AboutUS"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var datsSTR = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
        self.descriptionLabel.isHidden = true
        self.getAboutUSAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "About Us", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.backButtonImageview.image = UIImage(named: "backButton")
        self.descriptionLabel.textColor = GoodWorkAppColor.appDarkPurple
        
        self.descriptionLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 15)
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension AboutUS {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}

extension AboutUS {
    
    func getAboutUSAPI(){
        
        var mdl = PrivacyPoliciesRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getAboutUSAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                  
                    self.datsSTR = response["data"] as? String ?? ""
                    self.descriptionLabel.text = self.datsSTR
                    self.descriptionLabel.isHidden = false
                }else{
                    print("False")
                    
                }
                
                self.stopLoading()
            }
        }
    }
}
