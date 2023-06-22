//
//  CertListTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 28/04/23.
//

import UIKit

class CertListTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "CertListTableViewCell"
    
    @IBOutlet weak var certiTypeLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        self.certiTypeLabel.addTitleColorAndFont(title: "BLS", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.viewLabel.addTitleColorAndFont(title: "View", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
