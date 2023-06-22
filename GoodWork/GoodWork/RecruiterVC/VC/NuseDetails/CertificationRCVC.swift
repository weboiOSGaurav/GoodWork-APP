//
//  CertificationRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/04/23.
//

import UIKit


class CertificationRCVC: UIViewController {
    
    static let storyBoardIdentifier = "CertificationRCVC"
    
    @IBOutlet weak var mainBGView: UIView!
    @IBOutlet weak var topLine: UIView!
    
    @IBOutlet weak var crossImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var certiFicatTitleLabel: UILabel!
    
    @IBOutlet weak var certiFicatDetailsListTableview: UITableView!
    
    
    
    var titleAry = ["Certification Number:", "Certification Type:","Certification Organization:","Issue Date:","Expiration Date:","Renewal Date:"]
    
    var descriptionAry = ["LN XXXX 1234","Basic Life Support (BLS)","Lorem sum","Lorem sum","Lorem sum","Lorem sum"]
    
    var shoTabBarOBJ : shoTabBarVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func setUPUI(){
        
        self.view.backgroundColor = GoodWorkAppColor.appBlack.withAlphaComponent(0.55)
        self.mainBGView.backgroundColor =  GoodWorkAppColor.appDarkPink
        
        self.mainBGView.layer.cornerRadius = 16
        self.mainBGView.clipsToBounds = true
        
        self.topLine.layer.cornerRadius = self.topLine.frame.height / 2
        self.topLine.clipsToBounds = true
        
        self.crossImageView.image = UIImage(named: "Close")
        
        self.certiFicatTitleLabel.addTitleColorAndFont(title: "BLS", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 20, tintColor: GoodWorkAppColor.appMirage)
        self.loadTableView()
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension CertificationRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.closeButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.shoTabBarOBJ?.shoTabBarVC()
        self.dismiss(animated: true, completion: nil)
    }
}

extension CertificationRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.certiFicatDetailsListTableview.register(UINib(nibName: CertificationTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: CertificationTableViewCell.reuseCellIdentifier)
        self.certiFicatDetailsListTableview.delegate = self
        self.certiFicatDetailsListTableview.dataSource = self
        
        self.certiFicatDetailsListTableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.titleAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CertificationTableViewCell.reuseCellIdentifier, for: indexPath) as! CertificationTableViewCell
        
        cell.titleLabel.text = self.titleAry[indexPath.row]
        cell.descriptionLabel.text = self.descriptionAry[indexPath.row]
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
}
