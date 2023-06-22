//
//  ApplicationAdvanceCollectionViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 25/04/23.
//

import UIKit

class ApplicationAdvanceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ApplicationMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var applicationLabel: UILabel!
    @IBOutlet weak var applicationCount: UILabel!
    
    static let reuseCellIdentifier = "ApplicationAdvanceCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setUPUI()
    }
    
    func setUPUI(){
        self.ApplicationMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 6)
        
        self.shadowBgView.shadowWithRadiusAndColour(8, GoodWorkAppColor.appDavysGrey)
        
        self.applicationLabel.addTitleColorAndFont(title: "Permanent", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appLightPink)
        
        self.applicationCount.addTitleColorAndFont(title: "Permanent", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 11, tintColor: GoodWorkAppColor.appDarkPurple)
    }
    
}
