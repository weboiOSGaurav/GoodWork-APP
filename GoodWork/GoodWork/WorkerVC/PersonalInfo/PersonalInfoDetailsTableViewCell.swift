//
//  PersonalInfoDetailsTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 03/04/23.
//

import UIKit

class PersonalInfoDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var profileDataBgView: UIView!
    
    
    @IBOutlet weak var profileInfoLabel: UILabel!
    
    static let reuseCellIdentifier = "PersonalInfoDetailsTableViewCell"
    
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
       
        
        self.profileInfoLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.profileDataBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 10)
        
        self.shadowView.addRadiusAndBGColour(10, GoodWorkAppColor.appArsenic)
    }
    
}
