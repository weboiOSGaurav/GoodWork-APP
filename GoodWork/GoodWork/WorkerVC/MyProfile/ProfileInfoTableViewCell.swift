//
//  ProfileInfoTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 03/04/23.
//

import UIKit

class ProfileInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var profileDataBgView: UIView!
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var rightArrowImageView: UIImageView!
    
    @IBOutlet weak var profileInfoLabel: UILabel!
    
    static let reuseCellIdentifier = "ProfileInfoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    func setUpUI(){
        self.profileImageView.image = UIImage(named: "user")
        self.rightArrowImageView.image = UIImage(named: "rightArrow")
        
        self.profileInfoLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.profileDataBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 8)
        
        self.shadowView.addRadiusAndBGColour(8, GoodWorkAppColor.appArsenic)
    }
    
    
    func updateProfileData(_ indNo : Int, txt : String){
        
        self.profileInfoLabel.text = txt
        
        self.rightArrowImageView.image = UIImage(named: "rightArrow")

        switch  indNo{
        case 0:
            print("0")
            if appDelegate.nurseProfile?.data?.profile_details ?? "" == "true" {
                self.rightArrowImageView.image = UIImage(named: "tickcircleGreen")
            }
        case 1:
            print("1")
            if appDelegate.nurseProfile?.data?.resume_details ?? "" == "true" {
                self.rightArrowImageView.image = UIImage(named: "tickcircleGreen")
            }
        case 2:
            print("2")
            if appDelegate.nurseProfile?.data?.license_details ?? "" == "true" {
                self.rightArrowImageView.image = UIImage(named: "tickcircleGreen")
            }
        case 3:
            print("3")
            if appDelegate.nurseProfile?.data?.certificate_details ?? "" == "true" {
                self.rightArrowImageView.image = UIImage(named: "tickcircleGreen")
            }
        case 4:
            print("4")
            if appDelegate.nurseProfile?.data?.qualification_details ?? "" == "true" {
                self.rightArrowImageView.image = UIImage(named: "tickcircleGreen")
            }
        case 5:
            print("5")
            if appDelegate.nurseProfile?.data?.experience_details ?? "" == "true" {
                self.rightArrowImageView.image = UIImage(named: "tickcircleGreen")
            }
        default:
            print("default")
        }
        
    }
    
}
