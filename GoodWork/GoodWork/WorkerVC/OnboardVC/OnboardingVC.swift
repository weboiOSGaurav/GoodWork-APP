//
//  OnboardingVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/03/23.
//

import UIKit

class OnboardingVC: UIViewController {
    
    static let storyBoardIdentifier = "OnboardingVC"
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var onboardingImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        if _userDefault.bool(forKey: UserDefaultKeys.isUserLogin.rawValue){
        //            let navigationBar = navigationController?.navigationBar
        //            navigationBar?.isHidden = true
        //            let tabBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarCV") as! TabBarCV
        //            tabBarVC.selectedIndex = 0
        //            self.navigationController?.pushViewController(tabBarVC, animated: true)
        //            return
        //        }
        
        //        let navigationBar = navigationController?.navigationBar
        //        navigationBar?.isHidden = true
        //        let tabBarVC = UIStoryboard(name: "RecruitersStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TabBarRCVCViewController") as! TabBarRCVCViewController
        //        tabBarVC.selectedIndex = 0
        //        self.navigationController?.pushViewController(tabBarVC, animated: true)
        
        self.uiSetUP()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func uiSetUP(){
        
        self.onboardingImageView.image = UIImage(named: "Onboarding")
        self.buttonActions()
    }
}

extension OnboardingVC{
    
    func buttonActions(){
        self.nextButton.addTarget(self, action: #selector(self.nextButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func roleTypeButtonPressed(_ sender: UIButton){
        print("roleTypeButtonPressed")
        switch sender.tag {
        case 0:
            
            if _userDefault.bool(forKey: UserDefaultKeys.isUserLogin.rawValue){
                let vc = self.storyboard?.instantiateViewController(withIdentifier: TabBarCV.storyBoardIdentifier) as! TabBarCV
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: LoginVC.storyBoardIdentifier) as? LoginVC else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        case 1:
            
            if _userDefault.bool(forKey: UserDefaultKeys.isRecruiterUserLogin.rawValue){
                let vc = recruiterStoryboard.instantiateViewController(withIdentifier: TabBarRCVCViewController.storyBoardIdentifier) as! TabBarRCVCViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: LoginRCVC.storyBoardIdentifier) as? LoginRCVC else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 2:
            print("Employer")
        case 3:
            print("AboutUS")
        default:
            print("default")
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton){
        print("nextButtonPressed")
    }
}

////
////  LoginVC.swift
////  GoodWork
////
////  Created by Gaurav Jani on 27/03/23.
////
//
//import UIKit
//
//class LoginVC: UIViewController {
//
//    static let storyBoardIdentifier = "LoginVC"
//
//    let redView: UIView = {
//
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
//        return view
//    }()
//
//    @IBOutlet weak var demoo: UIView!
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //        self.titleLbl.text = "WELCOME"
//        //        self.titleLbl.font = OneLinkFont.OneLinkFontFont(.MontserratSemiBold, 14)
//        //        self.titleLbl.textColor = OneLinkColor.appBlack
//        //        self.titleLbl.addCharactersSpacing(spacing: 2, text: "WELCOME")
//
//        redView.translatesAutoresizingMaskIntoConstraints = false
////        self.demoo.addSubview(redView)
//
//        self.demoo.addSubview(redView)
//
//        self.demoo.sendSubviewToBack(self.redView)
//
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        setupViews()
//        setupAutoLayout()
//
//
//        redView.backgroundColor = .red
//
//    }
//
//    func setupViews() {
//
//        view.backgroundColor = .white
//
//    }
//
//    func setupAutoLayout() {
//
//        self.redView.leftAnchor.constraint(equalTo: self.demoo.leftAnchor, constant: 20).isActive = true
////        self.redView.rightAnchor.constraint(equalTo: self.demoo.rightAnchor, constant: -20).isActive = true
//
////        self.redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//         redView.topAnchor.constraint(equalTo: self.demoo.topAnchor, constant: 0).isActive = true
//
//
//        self.redView.heightAnchor.constraint(equalToConstant: (self.demoo.frame.height + 20)).isActive = true
//
//        self.redView.widthAnchor.constraint(equalToConstant: (self.demoo.frame.width + 10)).isActive = true
//        self.demoo.sendSubviewToBack(self.redView)
//
//        demoo.bringSubviewToFront(self.demoo)
//    }
//}
//
//
////MARK:- Button Actions
//extension LoginVC {
//
//
//}
//
//extension UIView {
//
//    func addShadowView(){
//
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = .zero
//        self.layer.shadowRadius = 10
//    }
//
//}

let recruiterStoryboard = UIStoryboard(name: "RecruitersStoryboard", bundle: nil)
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
