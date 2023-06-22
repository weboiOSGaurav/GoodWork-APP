//
//  AboutMeRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 12/05/23.
//

import UIKit

class AboutMeRCVC: BaseVC {
    
    static let storyBoardIdentifier = "AboutMeRCVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var aboutMerTitleLabel: UILabel!
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var hiImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var aboutMeTitleLabel: UILabel!
    @IBOutlet weak var aboutMeDescriptionLabel: UILabel!
    
    @IBOutlet weak var agencyNameTitleLabel: UILabel!
    @IBOutlet weak var agencyNameDescriptionLabel: UILabel!
    
    @IBOutlet weak var qualitiesLabel: UILabel!
    @IBOutlet weak var qualitiesCollectionView: UICollectionView!
    
    @IBOutlet weak var exploreUsLabel: UILabel!
    
    @IBOutlet weak var socialMedia1: UIImageView!
    @IBOutlet weak var socialMedia2: UIImageView!
    @IBOutlet weak var socialMedia3: UIImageView!
    @IBOutlet weak var socialMedia4: UIImageView!
    
    
    @IBOutlet weak var qualitiesCollectionHeight: NSLayoutConstraint!
    
    
    //     let qualitiesAry = ["Well Reputed", "Highly Professional", "Loremsum", "Worldwide accepted", "Loremsum"]
    //
    var aboutMe : AboutMe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let height = self.qualitiesCollectionView.collectionViewLayout.collectionViewContentSize.height
        self.qualitiesCollectionHeight.constant = height
        
        self.aboutMeAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        self.backButtonImageView.image = UIImage(named: "Arrow")
        
        self.aboutMerTitleLabel.addTitleColorAndFont(title: "About Me", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        self.userProfileImageView.image = UIImage(named: "placeHolderRect")
        self.userProfileImageView.layer.cornerRadius = 8
        self.userProfileImageView.clipsToBounds = true
        
        self.hiImageView.image = UIImage(named: "HiThere")
        
        self.userNameLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.aboutMeTitleLabel.addTitleColorAndFont(title: "About Me", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
        
        self.aboutMeDescriptionLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appOxfordBlue)
        
        
        self.agencyNameTitleLabel.addTitleColorAndFont(title: "Agency Name", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
        
        self.agencyNameDescriptionLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appOxfordBlue)
        
        
        self.qualitiesLabel.addTitleColorAndFont(title: "Qualities", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
        
        self.exploreUsLabel.addTitleColorAndFont(title: "Explore us on social media", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
        
        
        self.socialMedia1.image = UIImage(named: "Facebook")
        self.socialMedia2.image = UIImage(named: "Instra")
        self.socialMedia3.image = UIImage(named: "twitter")
        self.socialMedia4.image = UIImage(named: "linkedin")
        
        self.loadCollectionview()
        self.buttonActions()
        
        let attributedString = NSMutableAttributedString(string: "On the Screens, we need to have a profile edit button in the right-hand corner and the left-hand corner would be the hamburger menu on the edit profile option")
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 6 // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        // *** Set Attributed String to your label ***
        self.aboutMeDescriptionLabel.attributedText = attributedString
    }
    
    func updateAboutMeData(){
        if self.aboutMe?.data?.count != 0 {
            self.userNameLabel.text = "Myself \(self.aboutMe?.data?[0].first_name?.capitalized ?? "") \(self.aboutMe?.data?[0].last_name?.capitalized ?? "")."
            
            self.agencyNameDescriptionLabel.text = self.aboutMe?.data?[0].agency_name ?? ""
            
            guard let imgUrlString = self.aboutMe?.data?[0].image ?? "".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
            
            self.self.userProfileImageView.sd_setImage(with: URL(string: imgUrlString), placeholderImage: UIImage(named: "placeHolderRect"))
            
            self.aboutMeDescriptionLabel.text =  self.aboutMe?.data?[0].about_me ?? ""
            self.qualitiesCollectionView.reloadData()
            self.qualitiesCollectionView.reloadSections(IndexSet(integer:0))
            
            if self.aboutMe?.data?[0].qualities?.count ?? 0 != 0 {
                let height = self.qualitiesCollectionView.collectionViewLayout.collectionViewContentSize.height
                self.qualitiesCollectionHeight.constant = height
            }
        }
    }
}

//MARK:- Button Actions
extension AboutMeRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AboutMeRCVC:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func loadCollectionview(){
        self.qualitiesCollectionView.register(UINib(nibName: TagCollectionViewCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: TagCollectionViewCell.reuseCellIdentifier)
        self.qualitiesCollectionView.delegate = self
        self.qualitiesCollectionView.dataSource = self
        
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 160, height: 50)

        self.qualitiesCollectionView.collectionViewLayout = layout
        self.qualitiesCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.aboutMe?.data?.count == 0 {
            
            return 0
        }
        print("ct: \(self.aboutMe?.data?[0].qualities?.count ?? 0)")
        
        return self.aboutMe?.data?[0].qualities?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("cellForItemAt")
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseCellIdentifier,
                                                            for: indexPath) as? TagCollectionViewCell else {
            return TagCollectionViewCell()
        }
        print(" return TagCollectionViewCell()")
        cell.tagLabel.text = self.aboutMe?.data?[0].qualities?[indexPath.row]
        cell.tagLabel.textColor = GoodWorkAppColor.appDarkPurple
        cell.backgroundColor = GoodWorkAppColor.appOffWhite
        cell.tagLabel.preferredMaxLayoutWidth = collectionView.frame.width - 10
        
        return cell
    }
}

extension AboutMeRCVC {
    
    func aboutMeAPI(){
        
        var mdl = AboutMeRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.user_id = "f5a1104e-e2ae-4440-a7ad-01ecbf48af43"
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.aboutMeRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let homeResp = try JSONDecoder().decode(AboutMe.self, from: jsonData)
                        
                        self.aboutMe = homeResp
                        
                        if self.aboutMe?.api_status == "1"{
                            self.updateAboutMeData()
                        }else{
                            print("falsee")
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                    }catch{
                        print("catch:: \(error)")
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                self.stopLoading()
            }
        }
    }
}
