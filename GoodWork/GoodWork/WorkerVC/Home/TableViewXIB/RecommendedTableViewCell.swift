//
//  RecommendedTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 30/03/23.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell {
    
    static let reuseCellIdentifier = "RecommendedTableViewCell"
    
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
    
 //   @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var applyNewButton: UIButton!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var appliedButton: UIButton!
    
    @IBOutlet weak var saveJobButton: UIButton!
    
    
    @IBOutlet weak var offeredMainBgView: UIView!
    @IBOutlet weak var acceptImageview: UIImageView!
    @IBOutlet weak var cancelImageview: UIImageView!
    @IBOutlet weak var acceptJobButton: UIButton!
    @IBOutlet weak var cancelJobButton: UIButton!
    
    @IBOutlet weak var messageMainBgView: UIView!
    @IBOutlet weak var messageNotificationImageview: UIImageView!
    @IBOutlet weak var messageNotificationButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.setUPUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUPUI(){
        
        self.popularJobMainBgView.addBorderWidthColour(2, GoodWorkAppColor.appDarkPurple, 16)
        self.shadowBgView.shadowWithRadiusAndColour(16,GoodWorkAppColor.appColour)
        
        
        self.jobTypeLable.addTitleColorAndFont(title: "Travel", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appLightPink)
        
        self.appliedNumberLable.addTitleColorAndFont(title: "+50 Applied", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 10, tintColor: GoodWorkAppColor.appBlue)
        
        self.saveJobImageView.image = UIImage(named: "saveJob")
        
        self.jobTitleLable.addTitleColorAndFont(title: "Manager CRNA - Anesthesia", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appLightBlack)
        
        self.jobDescriptionLable.addTitleColorAndFont(title: "Medical Solutions Recruiter", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 12, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.jobLocationBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.locationImageView.image = UIImage(named: "location")
        self.jobLocationLable.addTitleColorAndFont(title: "Los Angeles, CA", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.calendarBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.calendarImageView.image = UIImage(named: "calendar")
        self.jobCalanderWksLable.addTitleColorAndFont(title: "10 wks", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.amountBgView.cornerRadiusWithBgColour(14, bgColour: GoodWorkAppColor.appOffWhite)
        self.dollarImageView.image = UIImage(named: "dollarcircle")
        self.jobAmountLable.addTitleColorAndFont(title: "2500/wk", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 12, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.recentlyAddedLable.addTitleColorAndFont(title: "Recently Added", fontName: GoodWorkAppFontName.NeueKabelItalic, fontSize: 10, tintColor: GoodWorkAppColor.appColour)
        
       //self.applyButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        self.applyNewButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        self.learnMoreButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        self.appliedButton.addRadiusAndBGColour(21,  GoodWorkAppColor.appColour)
        
        
        self.offeredMainBgView.isHidden = true
        self.acceptImageview.image = UIImage(named: "accepet")
        self.cancelImageview.image = UIImage(named: "cancel")
        
        self.messageMainBgView.isHidden = true
        self.messageNotificationImageview.image = UIImage(named: "messageNotification")
        self.learnMoreButton.isHidden = true
        self.applyNewButton.isHidden = true
        self.appliedButton.isHidden = true
    }
    
    func selectedJobType(_ typeNo : Int){
        self.offeredMainBgView.isHidden = true
        self.applyNewButton.isHidden = true
        self.messageMainBgView.isHidden = true
        
        if typeNo == 0 {
            //self.applyNewButton.setTitle("Apply Now", for: .normal)
            self.applyNewButton.isHidden = false
        }else if typeNo == 1 {
            //self.applyNewButton.setTitle("Applied", for: .normal)
            self.applyNewButton.isHidden = false
        }else if typeNo == 2 {
            self.applyNewButton.isHidden = true
            self.offeredMainBgView.isHidden = false
        }else if typeNo == 3 {
            self.messageMainBgView.isHidden = false
        }else if typeNo == 4 {
           // self.applyNewButton.setTitle("Apply Now", for: .normal)
            self.applyNewButton.isHidden = false
        }
    }
    
    func updateCellPopularJobHomeData(_ objNEW : Popular_jobs?){
        
        if objNEW?.job_title ?? "" == "" {
            self.jobTypeLable.text = "Travel"
        }else{
            self.jobTypeLable.text = objNEW?.job_title ?? ""
        }
        
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        self.appliedNumberLable.isHidden = true
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
      //  print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? "0" == "1"{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    
    func updateCellRecentlyJobData(_ objNEW : Recently_added?){
        
        if objNEW?.keyword_title ?? "" == "" {
            self.jobTypeLable.text = "Travel"
        }else{
            self.jobTypeLable.text = objNEW?.keyword_title ?? ""
        }
        
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        self.appliedNumberLable.isHidden = true
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
      //  print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? "0" == "1"{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    func updateCellRecommendedJobData(_ objNEW : Recommended_jobs?){
        
        if objNEW?.keyword_title ?? "" == "" {
            self.jobTypeLable.text = "Travel"
        }else{
            self.jobTypeLable.text = objNEW?.keyword_title ?? ""
        }
        
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        self.appliedNumberLable.isHidden = true
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
        //print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? "0" == "1"{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    func updateCellData(_ objNEW : BrowseJobsData?){
        
        if objNEW?.keyword_title ?? "" == "" {
            self.jobTypeLable.text = "Travel"
        }else{
            self.jobTypeLable.text = objNEW?.keyword_title ?? ""
        }
        
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
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    func updateCellDataMySavedJobListJobs(_ objNEW : MySavedJobListData?){
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        self.jobDescriptionLable.text = objNEW?.name ?? ""

        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
//        self.jobLocationLable.text = "Pending from API"

        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? 0) wks"

        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"

        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? ""

        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")

        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    func updateCellDataMyAppliedJobs(_ objNEW : MyAppliedJobListData?){
        
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
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? 0)/wks"
        
        self.recentlyAddedLable.text = "Applied On: \(objNEW?.updated_at ?? "")"
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
    }
    
    func updateCellDataMyHiredJobs(_ objNEW : MyHiredJobsData?){
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        
        if objNEW?.name == "" {
            self.jobDescriptionLable.text = "Medical Solutions Recruiter"
        }else{
            self.jobDescriptionLable.text = objNEW?.name ?? ""
        }
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? "0") wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? "0")/wks"
        
        self.recentlyAddedLable.text = "Start Date: \(objNEW?.updated_at ?? "")"
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        
        self.recentlyAddedLable.text = "Start Date: \(objNEW?.start_date ?? "")"
    }
    
    func updateCellDataMyPastJobs(_ objNEW : MyPastJobsData?){
//        self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        self.jobTitleLable.text = objNEW?.job_name ?? ""
        
        if objNEW?.applied_nurses ?? "" == "0"{
            self.appliedNumberLable.text = "\(objNEW?.applied_nurses ?? "") Applied"
        }else{
            self.appliedNumberLable.text = "+\(objNEW?.applied_nurses ?? "") Applied"
        }
        if objNEW?.name == "" {
            self.jobDescriptionLable.text = "Medical Solutions Recruiter"
        }else{
            self.jobDescriptionLable.text = objNEW?.name ?? ""
        }
        
        self.jobLocationLable.text = objNEW?.job_location ?? ""
        
        self.jobCalanderWksLable.text = "\(objNEW?.hours_per_week ?? "0") wks"
        
        self.jobAmountLable.text = "\(objNEW?.weekly_pay ?? "0")/wks"
        
//        self.recentlyAddedLable.text = objNEW?.created_at_definition ?? "
        
        print("objNEW?.is_saved:: \(objNEW?.is_saved ?? 0)")
        
        if objNEW?.is_saved ?? 0 == 1{
            self.saveJobImageView.image = UIImage(named: "saveJob")
            print("saveJob image")
        }else{
            self.saveJobImageView.image = UIImage(named: "unSaveJob")
            print("unSaveJob")
        }
        
        self.recentlyAddedLable.text = "Start Date: \(objNEW?.start_date ?? "")   End Date: \(objNEW?.end_date ?? "")"
    }
}
