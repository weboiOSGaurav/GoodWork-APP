//
//  JobTypeCollectionViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 24/04/23.
//

import UIKit

class JobTypeCollectionViewCell: UICollectionViewCell {
    
    static let reuseCellIdentifier = "JobTypeCollectionViewCell"
    
    @IBOutlet weak var jobTypeMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var jobTypeLable: UILabel!
    @IBOutlet weak var jobTypeDescriptionLable: UILabel!
    
    @IBOutlet weak var jobTypeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setUPUI()
    }
    
    func setUPUI(){
        self.jobTypeMainBgView.addBorderWidthColour(2.5, GoodWorkAppColor.appDarkPurple, 6)
        
        self.shadowBgView.shadowWithRadiusAndColour(8, GoodWorkAppColor.appDavysGrey)
        
        self.jobTypeImageView.image = UIImage(named: "CarDemo")
        
        self.jobTypeLable.addTitleColorAndFont(title: "Permanent", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
        
        
        self.jobTypeDescriptionLable.addTitleColorAndFont(title: "15+ Workers Available", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
    }
}

