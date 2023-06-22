//
//  ScreeningRCTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 26/04/23.
//

import UIKit


class ScreeningRCTableViewCell: UITableViewCell {
    
    
    static let reuseCellIdentifier = "ScreeningRCTableViewCell"
    
    @IBOutlet weak var newAppMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var appTypeLabel: UILabel!
    
    
    @IBOutlet weak var locationBgView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var jobTypeBgView: UIView!
    @IBOutlet weak var jobTypeLabel: UILabel!
    
    @IBOutlet weak var expBgView: UIView!
    @IBOutlet weak var expLabel: UILabel!
    
    @IBOutlet weak var chatNowImageView: UIImageView!
    
    @IBOutlet weak var chatBgView: UIView!
    @IBOutlet weak var chatNowLabel: UILabel!
  
    
    @IBOutlet weak var accepteImageView: UIImageView!
    @IBOutlet weak var rejectImageView: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUPUI()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUPUI(){
        self.chatNowImageView.image = UIImage(named: "chatBlueBG")
        
        self.newAppMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        
        self.shadowBgView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        self.userImageView.image = UIImage(named: "ELA")
        
        self.professionLabel.addTitleColorAndFont(title: "Associate Degree in Nursing", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.userNameLabel.addTitleColorAndFont(title: "Mary Smith", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.appTypeLabel.addTitleColorAndFont(title: "BLS, CCRN", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.locationBgView.addRadiusAndBGColour((self.locationBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.locationLabel.addTitleColorAndFont(title: "Los Angeles, CA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobTypeBgView.addRadiusAndBGColour((self.jobTypeBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.jobTypeLabel.addTitleColorAndFont(title: "Permanent", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.expBgView.addRadiusAndBGColour((self.expBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.expLabel.addTitleColorAndFont(title: "Day Shift", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.chatBgView.addRadiusAndBGColour((self.chatBgView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.chatNowLabel.addTitleColorAndFont(title: "Chat Now", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.timeLabel.addTitleColorAndFont(title: "12 hours ago", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 11, tintColor: GoodWorkAppColor.appBlue)
        self.timeLabel.isHidden = true
        
        self.accepteImageView.image = UIImage(named: "accepet")
        self.rejectImageView.image = UIImage(named: "cancel")
        
        self.accepteImageView.isHidden = true
        self.rejectImageView.isHidden = true
    }
}
