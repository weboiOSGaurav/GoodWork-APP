//
//  TagCollectionViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 21/04/23.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let reuseCellIdentifier = "TagCollectionViewCell"
    
    @IBOutlet var tagLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUPUI()
    }
    
    func setUPUI(){
        self.layer.cornerRadius = 18
        self.backgroundColor = .lightGray
        self.tagLabel.textColor = .white
        self.tagLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 16, tintColor: GoodWorkAppColor.appLightPink)
    }
    
    func isTagSelected(isSelected : Bool){
        if isSelected {
            
            self.backgroundColor = GoodWorkAppColor.appDarkPurple
            self.tagLabel.textColor = GoodWorkAppColor.appOffWhite
        }else{
            self.backgroundColor = GoodWorkAppColor.appWhite
            self.tagLabel.textColor = GoodWorkAppColor.appDarkPurple
        }
    }
}
