//
//  PrivacyPolicyRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 25/04/23.
//

import UIKit

class PrivacyPolicyRCVC: UIViewController {
    
    static let storyBoardIdentifier = "PrivacyPolicyRCVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonImageview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionData = "Lorem ipsum dolor sit amet consectetur. Sit malesuada bibendum quis suspendisse adipiscing. Nulla at bibendum morbi non lectus integer non ultrices. Sagittis ut blandit aliquet sed orci volutpat. Non est sit amet cras iaculis tortor semper elementum. Dictum eget sem vel aliquet. Sem tempor convallis interdum curabitur urna egestas bibendum nulla. Libero egestas donec nunc dapibus. Venenatis amet habitant ultrices diam id quisque consequat nascetur. Malesuada amet vel eu massa. Orci ullamcorper ut tincidunt risus semper scelerisque sed sed odio. Mattis at nullam volutpat bibendum at. Cursus eget eu in in. Facilisi aliquet praesent purus proin.Condimentum interdum fringilla magna dui sit quis sem. Hendrerit morbi viverra magna rutrum justo. Blandit pulvinar potenti hendrerit in facilisi egestas. Dolor justo hendrerit sit sollicitudin praesent id fermentum. Ac dictumst tempor id pellentesque vel. Mauris posuere magnis sit at in semper porta in sit. Pellentesque viverra in nulla non gravida suspendisse. Tellus nisl id tellus ultrices risus. Dui aliquam non enim aliquam integer dignissim eu\n\nendrerit morbi viverra magna rutrum justo. Blandit pulvinar potenti hendrerit in facilisi egestas. Dolor justo hendrerit sit sollicitudin praesent id fermentum. Ac dictumst tempor id pellentesque vel. Mauris posuere magnis sit at in semper porta in sit. Pellentesque viverra in nulla non gravida suspendisse. Tellus nisl id tellus ultrices ri"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.titleLabel.addTitleColorAndFont(title: "Privacy Policies", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        
        self.descriptionLabel.textColor = GoodWorkAppColor.appDarkPurple
        
        self.descriptionLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 15)
        
        self.backButtonImageview.image = UIImage(named: "Arrow")
        
        self.buttonActions()
        
    }
}

//MARK:- Button Actions
extension PrivacyPolicyRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
}
