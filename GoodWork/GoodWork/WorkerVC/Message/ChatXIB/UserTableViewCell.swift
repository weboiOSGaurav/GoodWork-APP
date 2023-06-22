//
//  UserTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 17/04/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "UserTableViewCell"
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBgView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUPUI()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        
        self.messageBgView.layer.cornerRadius = 12

        self.messageBgView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
//        yourView.layer.maskedCorners = [, ]

        let rectShape = CAShapeLayer()
        rectShape.bounds = self.messageBgView.frame
        rectShape.position = self.messageBgView.center
        rectShape.path = UIBezierPath(roundedRect: self.messageBgView.bounds, byRoundingCorners: [.bottomLeft , .bottomRight , .topRight], cornerRadii: CGSize(width: 12, height: 12)).cgPath

        self.messageBgView.layer.backgroundColor = GoodWorkAppColor.appDarkPurple.cgColor
        //Here I'm masking the textView's layer with rectShape layer
        self.messageBgView.layer.mask = rectShape
        
        self.messageBgView.clipsToBounds = true
    }
    
    func setUPUI(){
        
        self.messageBgView.backgroundColor = GoodWorkAppColor.appDarkPurple
        
        self.userNameLabel.addTitleColorAndFont(title: "James Bond", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.messageLabel.addTitleColorAndFont(title: "Have a great working week!!", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appWhite)
        
        self.timeLabel.addTitleColorAndFont(title: "09:25 AM", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appGrayHTML)
        
    }
}
