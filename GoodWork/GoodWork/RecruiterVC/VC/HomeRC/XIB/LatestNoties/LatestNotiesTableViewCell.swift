//
//  LatestNotiesTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 17/05/23.
//

import UIKit

class LatestNotiesTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "LatestNotiesTableViewCell"
    
    @IBOutlet weak var alertBgView: UIView!
    @IBOutlet weak var alertImageView: UIImageView!
    
    @IBOutlet weak var dotLineView: DashedLineView!
    
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var statusBGView: UIView!
    
    
    @IBOutlet weak var alertImgHeightConstrain: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setUPUI()
    }
    
    func setUPUI(){
        
        self.alertBgView.addRadiusAndBGColour(self.alertBgView.frame.height / 2, GoodWorkAppColor.appWhite)
        self.alertBgView.addShadow(shadowOpacity: 1, shadowRadius: 1)
        self.alertImageView.image = UIImage(named: "redAlert")
        
        self.dateLable.addTitleColorAndFont(title: "Monday, 6th April 2023", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 14, tintColor: GoodWorkAppColor.appBlack)
        
        self.descriptionLable.addTitleColorAndFont(title: "Alex Beth has successfully accepted job request", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDescLight)
        
        self.statusBGView.addRadiusAndBGColour(5, GoodWorkAppColor.appDeYork)
        
        self.statusLable.text = "Accepted"
        
//        self.statusLable.addTitleColorAndFont(title: "Accepted", fontName: GoodWorkAppFontName.DMSansMedium, fontSize: 11, tintColor: GoodWorkAppColor.appWhite)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
