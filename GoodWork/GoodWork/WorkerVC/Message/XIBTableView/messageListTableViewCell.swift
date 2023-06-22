//
//  messageListTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 16/04/23.
//

import UIKit

class messageListTableViewCell: UITableViewCell {

    static let reuseCellIdentifier = "messageListTableViewCell"
    
    @IBOutlet weak var messageBGView: UIView!
    @IBOutlet weak var shadowBGView: UIView!
    
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var isUserOnlineBGView: UIView!
    
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var jobTypeDescription: UILabel!
    
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var messageCount: UILabel!
    @IBOutlet weak var messageCountBGView: UIView!
    
   
    
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
        
        self.messageBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        
        self.shadowBGView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
        
        self.userProfilePic.image = UIImage(named: "Rectangle1")
        
        self.userProfilePic.addRadiusAndBGColour(0, .lightText)
        
        self.jobTypeLabel.addTitleColorAndFont(title: "Recruiter #01", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobTypeDescription.addTitleColorAndFont(title: "Check the prescription", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.timeLable.addTitleColorAndFont(title: "2 min ago", fontName: GoodWorkAppFontName.PoppinsRegular, fontSize: 12, tintColor: GoodWorkAppColor.appLightPink)
        
        self.messageCount.addTitleColorAndFont(title: "2 ", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 12, tintColor: GoodWorkAppColor.appWhite)
        
        self.messageCountBGView.addRadiusAndBGColour(self.messageCountBGView.frame.height / 2,GoodWorkAppColor.appBlue)
        
        self.isUserOnlineBGView.addRadiusAndBGColour(self.isUserOnlineBGView.frame.height / 2,GoodWorkAppColor.appMalachite)
        
        
    }
}
