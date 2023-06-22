//
//  HoldAndPublishedRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/04/23.
//

import UIKit
import ExpandableLabel

class HoldAndPublishedRCVC: UIViewController, ExpandableLabelDelegate {
    
    static let storyBoardIdentifier = "HoldAndPublishedRCVC"
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var moveToButton: UIButton!
    @IBOutlet weak var moveHoldToButton: UIButton!
    
    
    @IBOutlet weak var shareImageView: UIImageView!
    
    @IBOutlet weak var appliedJobTableView: UITableView!
    
    @IBOutlet weak var jobDetailsLabel: ExpandableLabel!
    
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    
    @IBOutlet weak var aboutJobTitleLabel: UILabel!
    @IBOutlet weak var shiftTitleLabel: UILabel!
    @IBOutlet weak var shiftTypeLabel: UILabel!
    
    @IBOutlet weak var expTitleLabel: UILabel!
    @IBOutlet weak var expDetailLabel: UILabel!
    
    @IBOutlet weak var emrTitleLabel: UILabel!
    @IBOutlet weak var emrDetailLabel: UILabel!
    
    @IBOutlet weak var meditechTitleLabel: UILabel!
    @IBOutlet weak var meditechDetailLabel: UILabel!
    
    @IBOutlet weak var epicTitleLabel: UILabel!
    @IBOutlet weak var epicDetailLabel: UILabel!
    
    var states = true
    
    var isFromHoldApp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
        if self.isFromHoldApp{
            self.moveHoldToButton.isHidden = false
            self.moveToButton.isHidden = true
        }else{
            self.moveHoldToButton.isHidden = true
            self.moveToButton.isHidden = false
        }
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backButton")
        
        self.jobDetailsLabel.delegate = self
        
        self.descriptionTitleLabel.addTitleColorAndFont(title: "Description", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.aboutJobTitleLabel.addTitleColorAndFont(title: "About job", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlue)
        
        self.shiftTitleLabel.addTitleColorAndFont(title: "Preferred shift:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.shiftTypeLabel.addTitleColorAndFont(title: "Day Shift", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.expTitleLabel.addTitleColorAndFont(title: "Relevant experience:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.expDetailLabel.addTitleColorAndFont(title: "3 Years", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.emrTitleLabel.addTitleColorAndFont(title: "EMR:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.emrDetailLabel.addTitleColorAndFont(title: "MedTech (< 2 experience)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
    
        self.meditechTitleLabel.addTitleColorAndFont(title: "Meditech:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.meditechDetailLabel.addTitleColorAndFont(title: "Beginner(1 years experience)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.epicTitleLabel.addTitleColorAndFont(title: "Epic:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.epicDetailLabel.addTitleColorAndFont(title: "Advanced (5+ year's experience)", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.moveToButton.addRadiusAndBGColour((self.moveToButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.moveHoldToButton.addRadiusAndBGColour((self.moveToButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        
        self.readMore()
        self.loadTableView()
        self.buttonActions()
    }
    
    func readMore(){
        let currentSource = preparedSources()[0]
        
        self.jobDetailsLabel.setLessLinkWith(lessLink: "Read Less", attributes: [.foregroundColor: GoodWorkAppColor.appDarkPurple], position: currentSource.textAlignment)
        
        self.jobDetailsLabel.shouldCollapse = true
        self.jobDetailsLabel.textReplacementType = currentSource.textReplacementType
        self.jobDetailsLabel.numberOfLines = currentSource.numberOfLines
        self.jobDetailsLabel.collapsed = states
        self.jobDetailsLabel.text = currentSource.text
        
        self.jobDetailsLabel.font = GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelRegular, 13)
    }
    
    func preparedSources() -> [(text: String, textReplacementType: ExpandableLabel.TextReplacementType, numberOfLines: Int, textAlignment: NSTextAlignment)] {
        
        return [(loremIpsumText(), .word, 5, .left)]
    }
    
    func loremIpsumText() -> String {
        return "This position is accountable and responsible for nursing care administered under the direction of a Registered Nurse (Nurse Manager, Charge Nurse, and/or Staff Nurse). Nurse interns must utilize personal protective equipment such as gloves, gown, mask.this line of code) if you're leveraging Storyboard. this line of code) if you're leveraging Storyboard. this line of code) if you're leveraging Storyboard. "
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        self.states = false
        readMore()
    }
    
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        self.states = true
        readMore()
    }
    
    func willExpandLabel(_ label: ExpandableLabel) {
        
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        
    }
}

//MARK:- Button Actions
extension HoldAndPublishedRCVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.moveToButton.addTarget(self, action: #selector(self.moveToButtonPress(_:)), for: .touchUpInside)
        
        self.moveHoldToButton.addTarget(self, action: #selector(self.moveHoldToButton(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moveToButtonPress(_ sender: UIButton){
        print("moveToButtonPress")
        
    }
    
    @IBAction func moveHoldToButton(_ sender: UIButton){
        print("moveHoldToButton")
        
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: NurseAppliedListRCVC.storyBoardIdentifier) as? NurseAppliedListRCVC else { return }
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension HoldAndPublishedRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.appliedJobTableView.register(UINib(nibName: JobAppliedTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: JobAppliedTableViewCell.reuseCellIdentifier)
        self.appliedJobTableView.delegate = self
        self.appliedJobTableView.dataSource = self
        
        self.appliedJobTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: JobAppliedTableViewCell.reuseCellIdentifier, for: indexPath) as! JobAppliedTableViewCell
        cell.appliedJobCount.isHidden = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
    }
}
