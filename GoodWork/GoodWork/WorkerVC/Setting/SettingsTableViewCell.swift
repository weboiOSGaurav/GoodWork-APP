//
//  SettingsTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "SettingsTableViewCell"
    
    
    @IBOutlet weak var settingTitleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUPUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.selectionStyle = .none
        
    }
    
    func setUPUI(){
        
        self.settingTitleLable.addTitleColorAndFont(title: "Data", fontName: GoodWorkAppFontName.QuicksandBold, fontSize: 16, tintColor: GoodWorkAppColor.appThunder)
    }
    
}
