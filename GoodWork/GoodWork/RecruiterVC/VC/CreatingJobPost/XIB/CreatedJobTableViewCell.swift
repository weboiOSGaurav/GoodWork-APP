//
//  CreatedJobTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 27/04/23.
//

import UIKit

class CreatedJobTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "CreatedJobTableViewCell"
    
    
    @IBOutlet weak var mainBgViewHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var shadowBgViewHeightConstrain: NSLayoutConstraint!
    
    
    @IBOutlet weak var mainBgView: UIView!
    
   
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var jobYye: UILabel!
    @IBOutlet weak var appliedCount: UILabel!
    
    @IBOutlet weak var jobSaveImageView: UIImageView!
    
    @IBOutlet weak var jobTitleDetails: UILabel!
    @IBOutlet weak var jobDescription: UILabel!

    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var amountImageView: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var jobIDLabel: UILabel!
    
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setUPUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUPUI(){
        self.mainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 14)
        self.shadowBgView.shadowWithRadiusAndColour(14, GoodWorkAppColor.appDavysGrey)
      
        self.jobSaveImageView.image = UIImage(named: "unSave")
        
        self.jobYye.addTitleColorAndFont(title: "Local", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appliedCount.addTitleColorAndFont(title: "+50 Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.jobTitleDetails.addTitleColorAndFont(title: "Travel Worker RN - PICU", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.jobDescription.addTitleColorAndFont(title: "Memorial Hermann Memorial City Medical", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        
        self.locationImageView.image = UIImage(named: "Location1")
        self.timeImageView.image = UIImage(named: "calendar1")
        self.amountImageView.image = UIImage(named: "dollarcircle1")
        
        self.locationLabel.addTitleColorAndFont(title: "Houston, TX", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.timeLabel.addTitleColorAndFont(title: "12 Week", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountLabel.addTitleColorAndFont(title: "$250/wk", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobIDLabel.addTitleColorAndFont(title: "GWJ234065", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 11, tintColor: GoodWorkAppColor.appBlue)
        
        self.startDate.addTitleColorAndFont(title: "Start Date : 03 March 2023", fontName: GoodWorkAppFontName.NeueKabelItalic, fontSize: 11, tintColor: GoodWorkAppColor.appDateLightGray)
        
        self.endDate.addTitleColorAndFont(title: "End Date : 23 March 2023", fontName: GoodWorkAppFontName.NeueKabelItalic, fontSize: 11, tintColor: GoodWorkAppColor.appDateLightGray)
    }
    
    func updateDraftApplicationData(_ obj : DraftApplicationListData){
        self.appliedCount.isHidden = true
        
        self.jobYye.text = obj.job_title ?? ""
        self.jobTitleDetails.text = obj.job_name ?? ""
        self.jobDescription.text = obj.preferred_specialty_definition ?? ""
        self.locationLabel.text = obj.job_location ?? ""
        self.amountLabel.text = "$\(obj.preferred_hourly_pay_rate ?? "")/wk"
        self.timeLabel.text = obj.assignment_duration_definition ?? ""
    }
    
    func updatePublishedListData(_ obj : PublishedListData){
        
        if obj.workers_applied ?? 0 == 0 {
            self.appliedCount.text = "\(obj.workers_applied ?? 0) Workers Applied"
        }else{
            self.appliedCount.text = "\(obj.workers_applied ?? 0)+ Workers Applied"
        }
        
        self.appliedCount.isHidden = false
        
        self.jobYye.text = obj.job_title ?? "Local"
        self.jobTitleDetails.text = obj.job_name ?? ""
        self.jobDescription.text = obj.preferred_specialty_definition ?? ""
        self.locationLabel.text = obj.job_location ?? ""
        self.amountLabel.text = "$\(obj.preferred_hourly_pay_rate ?? "")/wk"
        self.timeLabel.text = obj.assignment_duration_definition ?? ""
    }
}
