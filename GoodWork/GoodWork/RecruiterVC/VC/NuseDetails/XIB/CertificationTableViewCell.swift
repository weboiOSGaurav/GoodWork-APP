//
//  CertificationTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/04/23.
//

import UIKit

class CertificationTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "CertificationTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
   
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.titleLabel.addTitleColorAndFont(title: "Certification Number:", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 15, tintColor: GoodWorkAppColor.appLightPink)
        
        self.descriptionLabel.addTitleColorAndFont(title: "LN XXXX 1234", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
