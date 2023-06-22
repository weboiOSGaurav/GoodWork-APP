//
//  JobAppliedTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 26/04/23.
//

import UIKit

class JobAppliedTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "JobAppliedTableViewCell"
    
    @IBOutlet weak var jobAppMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationBgView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var jobExpImageView: UIImageView!
    @IBOutlet weak var jobExpBgView: UIView!
    @IBOutlet weak var jobExpLabel: UILabel!
    
    @IBOutlet weak var amountImageView: UIImageView!
    @IBOutlet weak var amountBgView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var jobDesignationLabel: UILabel!
    @IBOutlet weak var hospitalNameLabel: UILabel!
    
    @IBOutlet weak var appliedJobCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setUPUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUPUI(){
        self.jobAppMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.shadowBgView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        self.appliedJobCount.addTitleColorAndFont(title: "15+ Workers Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.jobTypeLabel.addTitleColorAndFont(title: "Travel", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.jobDesignationLabel.addTitleColorAndFont(title: "Manager CRNA - Anesthesia", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.hospitalNameLabel.addTitleColorAndFont(title: "Medical Solutions Recruiter", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
     
        self.locationImageView.image = UIImage(named: "location")
        self.locationBgView.addRadiusAndBGColour((self.locationBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.locationLabel.addTitleColorAndFont(title: "Los Angeles, CA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobExpImageView.image = UIImage(named: "calendar")
        self.jobExpBgView.addRadiusAndBGColour((self.jobExpBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.jobExpLabel.addTitleColorAndFont(title: "10 wks", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountImageView.image = UIImage(named: "dollarcircle")
        self.amountBgView.addRadiusAndBGColour((self.amountBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.amountLabel.addTitleColorAndFont(title: "2500/wk", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.appliedJobCount.isHidden = true
    }
}
