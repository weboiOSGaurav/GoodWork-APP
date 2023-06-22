//
//  NotificationTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 15/06/23.
//

import UIKit
import Foundation

class NotificationTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "NotificationTableViewCell"
    
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setUPUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUPUI(){
        
        self.typeLable.addTitleColorAndFont(title: "New", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 15, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.timeLable.addTitleColorAndFont(title: "2 min ago", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 13, tintColor: GoodWorkAppColor.appLightPink)
        
        self.descriptionLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        var str = "Your Application for  job GWJ234065 at Medical Solutions Recruiter was moved from New to Screening by Emma Watson from Employer name"
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.5
        
        let attrStri = NSMutableAttributedString.init(string: str)
        
        let nsRange = NSString(string: str)
            .range(of: "GWJ234065", options: String.CompareOptions.caseInsensitive)
        
        let nsRange2 = NSString(string: str)
            .range(of: "New to Screening", options: String.CompareOptions.caseInsensitive)
        
        attrStri.addAttributes([
            NSAttributedString.Key.foregroundColor :GoodWorkAppColor.appBlue,
            NSAttributedString.Key.font: GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16) as Any], range: nsRange)
        
        attrStri.addAttributes([
            NSAttributedString.Key.foregroundColor :GoodWorkAppColor.appDarkPurple,
            NSAttributedString.Key.font: GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16) as Any], range: nsRange2)
        
        attrStri.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrStri.length))

        self.descriptionLable.attributedText = attrStri
        
        self.bgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.shadowView.shadowWithRadiusAndColour(14,GoodWorkAppColor.appArsenic)
    }
}
