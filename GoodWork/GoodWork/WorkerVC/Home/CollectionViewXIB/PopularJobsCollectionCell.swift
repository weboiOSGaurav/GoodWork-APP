//
//  PopularJobsCollectionCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 30/03/23.
//

import UIKit

class PopularJobsCollectionCell: UICollectionViewCell {
    
    static let reuseCellIdentifier = "PopularJobsCollectionCell"
    
    @IBOutlet weak var popularJobMainBgView: UIView!
    @IBOutlet weak var shadowBgView: UIView!
    
    @IBOutlet weak var jobTypeLable: UILabel!
    @IBOutlet weak var appliedNumberLable: UILabel!
    @IBOutlet weak var saveJobImageView: UIImageView!
    @IBOutlet weak var jobTitleLable: UILabel!
    @IBOutlet weak var jobDescriptionLable: UILabel!
    
    @IBOutlet weak var jobLocationBgView: UIView!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var jobLocationLable: UILabel!
    
    @IBOutlet weak var calendarBgView: UIView!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var jobCalanderWksLable: UILabel!
    
    @IBOutlet weak var amountBgView: UIView!
    @IBOutlet weak var dollarImageView: UIImageView!
    @IBOutlet weak var jobAmountLable: UILabel!
    
    @IBOutlet weak var recentlyAddedLable: UILabel!
    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var saveJobButton: UIButton!
   
    
    let popular_jobs : Popular_jobs? = nil
    
    let myAppliedPopularJobList : MyAppliedPopular_jobs? = nil
    
    var isFromAppliedJob = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUPUI()
    }
    
    func setUPUI(){
        
        self.popularJobMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 22)
        self.shadowBgView.shadow(22)
        
        self.jobTypeLable.addTitleColorAndFont(title: "Local", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appliedNumberLable.addTitleColorAndFont(title: "+50 Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.saveJobImageView.image = UIImage(named: "unSaveJob")
        
        self.jobTitleLable.addTitleColorAndFont(title: "Manager CRNA - Anesthesia", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.jobDescriptionLable.addTitleColorAndFont(title: "Medical Solutions Recruiter", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.jobLocationBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.locationImageView.image = UIImage(named: "location")
        self.jobLocationLable.addTitleColorAndFont(title: "Fredericksburg, VA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.calendarBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.calendarImageView.image = UIImage(named: "calendar")
        self.jobCalanderWksLable.addTitleColorAndFont(title: "10 wks", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.dollarImageView.image = UIImage(named: "dollarcircle")
        self.jobAmountLable.addTitleColorAndFont(title: "2500/wk", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.recentlyAddedLable.addTitleColorAndFont(title: "Recently Added", fontName: GoodWorkAppFontName.NeueKabelItalic, fontSize: 10, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.applyButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        self.moreButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        self.moreButton.isHidden = true
        self.applyButton.isHidden = true
    }
    
    func updateCellData(_ objNEW : Popular_jobs?){
        
        print("job_title:: \(objNEW?.job_title ?? "")")
        
       
        if objNEW?.job_title ?? "" != "" {
            self.jobTypeLable.text = objNEW?.job_title ?? ""
        }else{
            self.jobTypeLable.text = "Travel"
        }
        
//        self.jobTypeLable.text = objNEW?.job_title ?? "Travel"
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0) wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
        print("1 \(objNEW?.created_at_definition ?? "")")
        print("2 \(objNEW?.job_id ?? "")")
        
      //  print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 1)")
        
        if objNEW?.is_saved ?? "0" == "1"{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    func updateAppliedJobCellData(_ objNEW : PopularJobListData?){
        
        self.jobTypeLable.text = "Travel"
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""

        self.jobLocationLable.text = objNEW?.job_location ?? ""

        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"

        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0) wks"

        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""

        if objNEW?.is_saved ?? "0" == "1"{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
}

extension Encodable {
    func hasKey(for path: String) -> Bool {
        return Mirror(reflecting: self).children.contains { $0.label == path }
    }
    func value(for path: String) -> Any? {
        return Mirror(reflecting: self).children.first { $0.label == path }?.value
    }
}
