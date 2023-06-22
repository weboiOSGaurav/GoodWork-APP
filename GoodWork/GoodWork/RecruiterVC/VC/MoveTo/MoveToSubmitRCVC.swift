//
//  MoveToSubmitRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 26/04/23.
//

import UIKit

class MoveToSubmitRCVC: UIViewController {
    
    static let storyBoardIdentifier = "MoveToSubmitRCVC"
    
    @IBOutlet weak var mainBGView: UIView!
    
    @IBOutlet weak var lineBGView: UIView!
    @IBOutlet weak var crossImageview: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resetLabel: UILabel!
    
    @IBOutlet weak var employerLabel: UILabel!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var dropDownArrow: UIImageView!
    
    @IBOutlet weak var employerBgView: UIView!
    @IBOutlet weak var employerShadoView: UIView!
    
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var dateImageview: UIImageView!
    
    @IBOutlet weak var dateBgView: UIView!
    @IBOutlet weak var dateShadoView: UIView!
    
    @IBOutlet weak var endDateBgView: UIView!
    @IBOutlet weak var endDateShadoView: UIView!
    
    @IBOutlet weak var endDateTitleLabel: UILabel!
    @IBOutlet weak var endSelectedDateLabel: UILabel!
    @IBOutlet weak var endDateImageview: UIImageView!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var endDateBGView: UIView!
    
    var isFromSubmitted = false
    var isFromOnboarding = false
    var isFromWorking = false
    var isDone = false
    var isFromEmployer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.endDateBGView.isHidden = true

        if self.isFromSubmitted{
            self.titleLabel.text = "Move To Offered"
            self.dateTitleLabel.text = "Offer Date"
            self.dropDownArrow.isHidden = true
        }else if isFromOnboarding{
            self.titleLabel.text = "Move To On Boarding"
            self.dateTitleLabel.text = "On Board Date"
        }else if self.isFromWorking{
            self.titleLabel.text = "Move To Working"
            self.dateTitleLabel.text = "Start Date"
            self.dropDownArrow.isHidden = true
        }else if self.isDone{
            self.titleLabel.text = "Move To Done"
            self.dateTitleLabel.text = "Start Date"
            self.endDateBGView.isHidden = false
            self.dropDownArrow.isHidden = true
            self.dateImageview.isHidden = true
        }
    }
    
    func setUPUI(){
        self.view.backgroundColor = GoodWorkAppColor.appBlack.withAlphaComponent(0.55)
        self.mainBGView.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.mainBGView.layer.cornerRadius = 30
        self.mainBGView.clipsToBounds = true
        
        self.employerBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.employerShadoView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        self.dateBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        
        self.dateShadoView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        self.endDateBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        
        self.endDateShadoView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        
        self.lineBGView.layer.cornerRadius = 1
        self.lineBGView.clipsToBounds = true
        
        self.crossImageview.image = UIImage(named: "Close")
        
        self.titleLabel.addTitleColorAndFont(title: "Move To Submitted", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 24, tintColor: GoodWorkAppColor.appMirage)
        
        self.resetLabel.addTitleColorAndFont(title: "RESET", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        
        
        self.employerLabel.addTitleColorAndFont(title: "Employer", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.hospitalNameLabel.addTitleColorAndFont(title: "AGC Hospital", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        self.dropDownArrow.image = UIImage(named: "Stroke11")
        
        
        self.dateTitleLabel.addTitleColorAndFont(title: "Submission Date", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.selectedDateLabel.addTitleColorAndFont(title: "14th Feb, 2023", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.dateImageview.image = UIImage(named: "calendar1")
        
        self.endDateTitleLabel.addTitleColorAndFont(title: "End Date", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.endSelectedDateLabel.addTitleColorAndFont(title: "14th Feb, 2023", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.endDateImageview.image = UIImage(named: "calendar1")
        
        self.submitButton.addRadiusAndBGColour((self.submitButton.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension MoveToSubmitRCVC {
    
    func buttonActions(){
        self.closeButton.addTarget(self, action: #selector(self.closeButtonPressed(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        self.dismiss(animated: true, completion: nil)
        
    }
}
