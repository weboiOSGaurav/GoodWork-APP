//
//  NewApplicationChatTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 25/04/23.
//

import UIKit

class NewApplicationChatTableViewCell: UITableViewCell {
    
    
    static let reuseCellIdentifier = "NewApplicationChatTableViewCell"
    
    @IBOutlet weak var newAppMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var appTypeLabel: UILabel!
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var chatButton: UIButton!
    
    @IBOutlet weak var locationBgView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var jobTypeBgView: UIView!
    @IBOutlet weak var jobTypeLabel: UILabel!
    
    @IBOutlet weak var expBgView: UIView!
    @IBOutlet weak var expLabel: UILabel!
    
    @IBOutlet weak var amountBgView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var jobIDLabel: UILabel!
    
    @IBOutlet weak var jobIDRChatLabel: UILabel!
    @IBOutlet weak var chatBgView: UIView!
    @IBOutlet weak var chatNowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUPUI()
        self.chatButton.isHidden = true
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUPUI(){
        self.newAppMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        
        self.shadowBgView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
        
        self.userImageView.image = UIImage(named: "Rectangle5")
        
        self.userImageView.addRadiusAndBGColour(8, GoodWorkAppColor.appLightGray.withAlphaComponent(0.40))
        
        self.professionLabel.addTitleColorAndFont(title: "Profession", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.userNameLabel.addTitleColorAndFont(title: "David Lee", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.appTypeLabel.addTitleColorAndFont(title: "Facility", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.chatImageView.image = UIImage(named: "chatBlueBG")
        
        self.locationBgView.addRadiusAndBGColour((self.locationBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.locationLabel.addTitleColorAndFont(title: "Los Angeles, CA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobTypeBgView.addRadiusAndBGColour((self.jobTypeBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.jobTypeLabel.addTitleColorAndFont(title: "Permanent", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.expBgView.addRadiusAndBGColour((self.expBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.expLabel.addTitleColorAndFont(title: "8+ Exp", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountBgView.addRadiusAndBGColour((self.amountBgView.frame.height / 2), GoodWorkAppColor.appOffWhite)
        self.amountLabel.addTitleColorAndFont(title: "$2500/wk", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobIDLabel.addTitleColorAndFont(title: "GWJ234065", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.jobIDRChatLabel.addTitleColorAndFont(title: "GWJ234065", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.chatBgView.addRadiusAndBGColour((self.chatBgView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.chatNowLabel.addTitleColorAndFont(title: "Chat Now", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appOffWhite)
    }
    
    
    func updateNewApplicationData(_ obj : Data11){
        
        if obj.image ?? "" != ""{
            
            self.userImageView.sd_setImage(with: URL(string: obj.image ?? ""), placeholderImage: UIImage(named: ""))
        }
        
        self.professionLabel.text = obj.role ?? "Profession"
        self.userNameLabel.text = obj.fullName ?? "David Lee"
        
        if obj.specialty?.count ?? 0 > 0 {
            self.appTypeLabel.text = obj.specialty?[0].name ??  ""
        }
        
        self.locationLabel.text = obj.address ?? ""
        self.jobIDLabel.text = obj.nurse_id ?? ""
        
        self.expLabel.text = "8+ Exp"
        
        self.amountLabel.text = "$" + (obj.hourly_pay_rate ?? "") + "/wk"
        
    }
}
