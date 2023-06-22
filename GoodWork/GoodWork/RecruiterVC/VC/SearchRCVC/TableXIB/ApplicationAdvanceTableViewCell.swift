//
//  ApplicationAdvanceTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 12/05/23.
//


import UIKit

class ApplicationAdvanceTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var profileDataBgView: UIView!
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var rightArrowImageView: UIImageView!
    
    @IBOutlet weak var appTitlefoLabel: UILabel!
    @IBOutlet weak var appDescriptionInfoLabel: UILabel!
    
    static let reuseCellIdentifier = "ApplicationAdvanceTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    func setUpUI(){
        self.profileImageView.image = UIImage(named: "PinkRound")
        self.rightArrowImageView.image = UIImage(named: "rightArrow")
        
        self.appTitlefoLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appDescriptionInfoLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.profileDataBgView.addBorderWidthColour(2, GoodWorkAppColor.appDavysGrey, 8)
        
        
        self.shadowView.addRadiusAndBGColour(8, GoodWorkAppColor.appArsenic)
    }
    
    
    
}
