//
//  FilterVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 20/04/23.
//

import UIKit
import DropDown
import RangeSeekSlider


class FilterVC: BaseVC {
    
    static let storyBoardIdentifier = "FilterVC"
    
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var filterTitleLable: UILabel!
    @IBOutlet weak var resetLable: UILabel!
    
    
    @IBOutlet weak var professionTitleLable: UILabel!
    @IBOutlet weak var typeOfProfessionLable: UILabel!
    @IBOutlet weak var professionBgView: UIView!
    @IBOutlet weak var professionShadow: UIView!
    @IBOutlet weak var professionDropButton: UIButton!
    
    
    @IBOutlet weak var specialtyTitleLable: UILabel!
    @IBOutlet weak var typeOfSpecialtyLable: UILabel!
    @IBOutlet weak var specialtyBgView: UIView!
    @IBOutlet weak var specialtyShadow: UIView!
    @IBOutlet weak var specialtyDropButton: UIButton!
    
    @IBOutlet weak var locationTitleLable: UILabel!
    @IBOutlet weak var typeOfLocationLable: UILabel!
    @IBOutlet weak var locationBgView: UIView!
    @IBOutlet weak var locationShadow: UIView!
    @IBOutlet weak var locationDropButton: UIButton!
    
    @IBOutlet weak var jobTypeLable: UILabel!
    @IBOutlet weak var jobTypesCollectionView: UICollectionView!
    
    @IBOutlet weak var shiftTypeLable: UILabel!
    @IBOutlet weak var shiftTypeCollectionView: UICollectionView!
    
    
    @IBOutlet weak var selectDateLable: UILabel!
    
    @IBOutlet weak var startDateLable: UILabel!
    @IBOutlet weak var startDateBgView: UIView!
    @IBOutlet weak var startDateShadow: UIView!
    
    
    @IBOutlet weak var endDateLable: UILabel!
    @IBOutlet weak var endDateBgView: UIView!
    @IBOutlet weak var endDateShadow: UIView!
    
    
    @IBOutlet weak var WeeklyPayTitleLable: UILabel!
    @IBOutlet weak var WeeklyPayStartAmountLable: UILabel!
    @IBOutlet weak var WeeklyPayMaxAmountLable: UILabel!
    
    @IBOutlet weak var hoursPerShiftLable: UILabel!
    @IBOutlet weak var hoursPerShiftStartAmountLable: UILabel!
    @IBOutlet weak var hoursPerShiftMaxAmountLable: UILabel!
    
    @IBOutlet weak var hoursPerWeekLable: UILabel!
    @IBOutlet weak var hoursPerWeekStartAmountLable: UILabel!
    @IBOutlet weak var hoursPerWeekMaxAmountLable: UILabel!
    
    @IBOutlet weak var assignmentLenghtLable: UILabel!
    @IBOutlet weak var assignmentLenghtStartLable: UILabel!
    @IBOutlet weak var assignmentLenghtMaxLable: UILabel!
    
    
    @IBOutlet weak var autoOfferImageView: UIImageView!
    @IBOutlet weak var autoOfferLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var autoOffersButton: UIButton!
    
    @IBOutlet weak var professionDropImg: UIImageView!
    @IBOutlet weak var specialitiesDropImg: UIImageView!
    @IBOutlet weak var locationDropImg: UIImageView!
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    //@IBOutlet weak var redDoubleSlider: DoubleSlider!
    
    @IBOutlet fileprivate weak var weeklyPaySlider: RangeSeekSlider!
    @IBOutlet fileprivate weak var hoursePerShiftSlider: RangeSeekSlider!
    @IBOutlet fileprivate weak var hoursePerWeekSlider: RangeSeekSlider!
    @IBOutlet fileprivate weak var assignMentLenghtSlider: RangeSeekSlider!
    
    
    var weeklyPayMin = 0.0
    var weeklyPayMax = 0.0
    
    var hoursePerShiftMin = 0.0
    var hoursePerShiftMax = 0.0
    
    var hoursePerWeekMin = 0.0
    var hoursePerWeekMax = 0.0
    
    var assignMentLenghtMin = 0.0
    var assignMentLenghtMax = 0.0
    
    private var jobTypeSelected = [String]()
    private var shiftTypeSelected = [String]()
    
    private var jobType = ""
    private var shiftType = ""
    
    let shiftTypesTagArray = ["Day", "Nights", "Mid", "Evening","Rotating","Variable"]
    
    var objExp : PassFilterData?
    
    var professionTypes : Certification?
    let professionTypeDropDown = DropDown()
    
    
    var nurseSpecialities : NurseSpecialities?
    let specialitiesTypeDropDown = DropDown()
    
    var nurseLocation : NurseWorkLocation?
    let nurseLocationTypeDropDown = DropDown()
    
    var nurseJobTypes : NurseJobTypes?
    
    var nurseShiftTypes : NurseShifts?
    
    private lazy var startDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    
    private lazy var endDatePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        
        //        dateFormater.dateFormat = "MM/dd/yyyy"
        return datePicker
    }()
    
    var isAutoOfferSelected = true
    
    var mdl = BrowseJobsRequest()
    
    var professionID = 0
    var specialityID = 0
    var workLocationID = 0
    var selectedJobTypeID = 0
    var selectedShiftTypeID = 0
    
    var labels: [String] = []
    //var doubleSlider: DoubleSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getCertificatTypesAPI()
        
        //        redDoubleSlider.labelDelegate = self
        //        redDoubleSlider.numberOfSteps = labels.count
        //        redDoubleSlider.labelsAreHidden = false
        //        redDoubleSlider.smoothStepping = true
        
        
        //        doubleSlider.lowerValueStepIndex = 0
        //        doubleSlider.upperValueStepIndex = labels.count - 1
        
        
        // You can use traditional notifications
        //doubleSlider.addTarget(self, action: #selector(printVal(_:)), for: .valueChanged)
        // Or Swifty delegates
        //doubleSlider.editingDidEndDelegate = self
        
        self.setupWeeklyPaySliderFilterView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.closeImageView.image = UIImage(named: "Close")
        self.filterTitleLable.addTitleColorAndFont(title: "Filters", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 24, tintColor: GoodWorkAppColor.appMirage)
        
        self.resetLable.addTitleColorAndFont(title: "RESET", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        
        
        self.professionBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.professionShadow.shadowWithRadiusAndColour(14,GoodWorkAppColor.appDavysGrey)
        self.professionTitleLable.addTitleColorAndFont(title: "Profession", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.typeOfProfessionLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.specialtyBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.specialtyShadow.shadowWithRadiusAndColour(14,GoodWorkAppColor.appDavysGrey)
        self.specialtyTitleLable.addTitleColorAndFont(title: "Specialty", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.typeOfSpecialtyLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        
        self.locationBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.locationShadow.shadowWithRadiusAndColour(14,GoodWorkAppColor.appDavysGrey)
        self.locationTitleLable.addTitleColorAndFont(title: "Location", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.typeOfLocationLable.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.jobTypeLable.addTitleColorAndFont(title: "Job type", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appMirage)
        self.shiftTypeLable.addTitleColorAndFont(title: "Shift type", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appMirage)
        
        self.startDateBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.startDateShadow.shadowWithRadiusAndColour(14,GoodWorkAppColor.appDavysGrey)
        self.startDateLable.addTitleColorAndFont(title: "Start Date", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.endDateBgView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 14)
        self.endDateShadow.shadowWithRadiusAndColour(14,GoodWorkAppColor.appDavysGrey)
        self.endDateLable.addTitleColorAndFont(title: "End Date", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.selectDateLable.addTitleColorAndFont(title: "Select Date", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.WeeklyPayTitleLable.addTitleColorAndFont(title: "Weekly pay", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.WeeklyPayStartAmountLable.addTitleColorAndFont(title: "$100/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        self.WeeklyPayMaxAmountLable.addTitleColorAndFont(title: "$350/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        
        self.hoursPerShiftLable.addTitleColorAndFont(title: "Hours per Shift", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.hoursPerShiftStartAmountLable.addTitleColorAndFont(title: "$100/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        self.hoursPerShiftMaxAmountLable.addTitleColorAndFont(title: "$350/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        
        
        self.hoursPerWeekLable.addTitleColorAndFont(title: "Hours per Week", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.hoursPerWeekStartAmountLable.addTitleColorAndFont(title: "$100/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        self.hoursPerWeekMaxAmountLable.addTitleColorAndFont(title: "$350/wk", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        
        
        self.assignmentLenghtLable.addTitleColorAndFont(title: "Assignment Length", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        self.assignmentLenghtStartLable.addTitleColorAndFont(title: "50", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        self.assignmentLenghtMaxLable.addTitleColorAndFont(title: "100", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appAuroMetalSaurus)
        
        self.autoOfferImageView.image = UIImage(named: "autoOffer")
        self.autoOfferLabel.addTitleColorAndFont(title: "Auto Offers", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.applyButton.addRadiusBGColorTitleColorFont(title: "Apply", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, radius: 26, bgColor: GoodWorkAppColor.appDarkPurple, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.loadCollectionview()
        self.buttonActions()
        self.setUPDatePicker()
    }
    
    
}

//MARK:- Button Actions
extension FilterVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.applyButton.addTarget(self, action: #selector(self.applyButtonPressed(_:)), for: .touchUpInside)
        self.resetButton.addTarget(self, action: #selector(self.resetButtonPressed(_:)), for: .touchUpInside)
        self.professionDropButton.addTarget(self, action: #selector(self.professionDropButtonPressed(_:)), for: .touchUpInside)
        self.specialtyDropButton.addTarget(self, action: #selector(self.specialitiesDropButtonPressed(_:)), for: .touchUpInside)
        self.locationDropButton.addTarget(self, action: #selector(self.locationDropButtonPressed(_:)), for: .touchUpInside)
        self.autoOffersButton.addTarget(self, action: #selector(self.autoOffersButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        
        let mdlNil = BrowseJobsRequest()
        self.objExp?.passFilterData(true, mdlNil)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func autoOffersButtonPressed(_ sender: UIButton){
        print("autoOffersButtonPressed")
        if self.isAutoOfferSelected{
            self.isAutoOfferSelected = false
            self.autoOfferImageView.image = UIImage(named: "unCheckRectangle")
        }else{
            self.isAutoOfferSelected = true
            self.autoOfferImageView.image = UIImage(named: "autoOffer")
        }
    }
    
    @IBAction func applyButtonPressed(_ sender: UIButton){
        print("applyButtonPressed")
        
        self.mdl.preferred_work_location = self.workLocationID
        self.mdl.specialty = self.specialityID
        self.mdl.daily_rate = ""
        self.mdl.profession = self.professionID
        self.mdl.work_location = self.typeOfLocationLable.text ?? ""
        self.mdl.job_type = self.selectedJobTypeID
        self.mdl.start_date = self.startDateLable.text ?? ""
        self.mdl.end_date = self.endDateLable.text ?? ""
        self.mdl.weekly_pay_from = "\(self.weeklyPayMin)"
        self.mdl.weekly_pay_to = "\(self.weeklyPayMax)"
        self.mdl.hourly_pay_from = "\(self.hoursePerShiftMin)"
        self.mdl.hourly_pay_to = "\(self.hoursePerShiftMax)"
        self.mdl.preferred_shift = self.selectedShiftTypeID
        self.mdl.hours_per_week_from = "\(self.hoursePerWeekMin)"
        self.mdl.hours_per_week_to = "\(self.hoursePerWeekMax)"
    
        if self.isAutoOfferSelected {
            self.mdl.auto_offers = "1"
        }else{
            self.mdl.auto_offers = "0"
        }
        
        self.objExp?.passFilterData(false, self.mdl)
        
        DispatchQueue.main.async {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func professionDropButtonPressed(_ sender: UIButton){
        print("professionDropButtonPressed")
        self.setUpDropDownProfessionType()
    }
    
    @IBAction func specialitiesDropButtonPressed(_ sender: UIButton){
        print("specialitiesDropButtonPressed")
        self.setUpDropDownNurseSpecialitiesType()
    }
    
    @IBAction func locationDropButtonPressed(_ sender: UIButton){
        print("locationDropButtonPressed")
        self.setUpDropDownNurseLocationType()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton){
        print("resetButtonPressed")
        let modelNil = BrowseJobsRequest()
        self.objExp?.passFilterData(false, modelNil)
        
        DispatchQueue.main.async {
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension FilterVC:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func loadCollectionview(){
        self.jobTypesCollectionView.register(UINib(nibName: TagCollectionViewCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: TagCollectionViewCell.reuseCellIdentifier)
        self.jobTypesCollectionView.delegate = self
        self.jobTypesCollectionView.dataSource = self
        
        self.shiftTypeCollectionView.register(UINib(nibName: TagCollectionViewCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: TagCollectionViewCell.reuseCellIdentifier)
        self.shiftTypeCollectionView.delegate = self
        self.shiftTypeCollectionView.dataSource = self
        
        
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 160, height: 50)
        
        self.jobTypesCollectionView.collectionViewLayout = layout
        
        let layout1 = TagFlowLayout()
        layout1.estimatedItemSize = CGSize(width: 160, height: 50)
        
        self.shiftTypeCollectionView.collectionViewLayout = layout1
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.jobTypesCollectionView == collectionView {
            return self.nurseJobTypes?.data?.count ?? 0
        }
        
        return self.nurseShiftTypes?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.reuseCellIdentifier,
                                                            for: indexPath) as? TagCollectionViewCell else {
            return TagCollectionViewCell()
        }
        
        if self.jobTypesCollectionView == collectionView{
            
            cell.tagLabel.text = self.nurseJobTypes?.data?[indexPath.row].name ?? ""
            //            if self.jobTypeSelected.contains(self.jobTypesTagArray[indexPath.row]) {
            //                cell.isTagSelected(isSelected: true)
            //            } else {
            //                cell.isTagSelected(isSelected: false)
            //            }
            
            if  self.jobType == self.nurseJobTypes?.data?[indexPath.row].name  {
                cell.isTagSelected(isSelected: true)
            } else {
                cell.isTagSelected(isSelected: false)
            }
            
            cell.tagLabel.preferredMaxLayoutWidth = collectionView.frame.width - 10
            
            return cell
        }else{
            cell.tagLabel.text = self.nurseShiftTypes?.data?[indexPath.row].name ?? ""
            //            if self.shiftTypeSelected.contains(self.shiftTypesTagArray[indexPath.row]) {
            //                cell.isTagSelected(isSelected: true)
            //            } else {
            //                cell.isTagSelected(isSelected: false)
            //            }
            
            if self.shiftType == self.nurseShiftTypes?.data?[indexPath.row].name ?? ""{
                cell.isTagSelected(isSelected: true)
            } else {
                cell.isTagSelected(isSelected: false)
            }
            
            cell.tagLabel.preferredMaxLayoutWidth = collectionView.frame.width - 10
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TagCollectionViewCell, let text = cell.tagLabel.text else {return}
        
        if self.jobTypesCollectionView == collectionView {
            //            if self.jobTypeSelected.contains(text) {
            //                self.jobTypeSelected = self.jobTypeSelected.filter{$0 != text}
            //            } else {
            //                self.jobTypeSelected.append(text)
            //            }
            
            if self.jobType == text {
                self.jobType = ""
                self.selectedJobTypeID = 0
            }else{
                self.jobType = text
                self.selectedJobTypeID = self.nurseJobTypes?.data?[indexPath.row].id ?? 0
            }
            
            self.jobTypesCollectionView.reloadData()
        }else{
            //            if self.shiftTypeSelected.contains(text) {
            //                self.shiftTypeSelected = self.shiftTypeSelected.filter{$0 != text}
            //            } else {
            //                self.shiftTypeSelected.append(text)
            //            }
            
            if self.shiftType == text {
                self.shiftType = ""
                self.selectedShiftTypeID = 0
            }else{
                self.shiftType = text
                self.selectedShiftTypeID = self.nurseShiftTypes?.data?[indexPath.row].id ?? 0
            }
            
            self.shiftTypeCollectionView.reloadData()
        }
    }
}

extension FilterVC {
    func getCertificatTypesAPI(){
        
        let mdl = CertificationTypeRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getCertificationTypeListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                // self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let licenseTypesResp = try JSONDecoder().decode(Certification.self, from: jsonData)
                        
                        self.professionTypes = licenseTypesResp
                        
                        if self.professionTypes?.data?.count != 0 {
                            self.typeOfProfessionLable.text = ""
                            self.professionID = 0
                        }
                        
                    }catch{
                        print("catch")
                    }
                }else{
                    print("False")
                }
                self.stopLoading()
                self.getNurseSpecialitiesAPI()
            }
            
        }
    }
    
    func getNurseSpecialitiesAPI(){
        
        let mdl = NurseSpecialitiesRequest()
        
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getNurseSpecialitiesListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                // self.notificationBanner(response["message"] as? String ?? "")
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseSpecialitiesResp = try JSONDecoder().decode(NurseSpecialities.self, from: jsonData)
                        
                        self.nurseSpecialities = nurseSpecialitiesResp
                        
                        if self.nurseSpecialities?.data?.count != 0 {
                            self.typeOfSpecialtyLable.text = ""
                            self.specialityID = 0
                        }
                        
                    }catch{
                        print("catch")
                    }
                }else{
                    print("False")
                    
                }
                self.stopLoading()
                self.getWorkLocationAPI()
            }
        }
    }
    
    func getWorkLocationAPI(){
        
        let mdl = WorkLocationRequest()
        
        print("getWorkLocationAPI mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getWorkLocationListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseWorkLocationResp = try JSONDecoder().decode(NurseWorkLocation.self, from: jsonData)
                        
                        self.nurseLocation = nurseWorkLocationResp
                        
                        if self.nurseLocation?.data?.count != 0 {
                            self.typeOfLocationLable.text = ""
                            self.workLocationID = 0
                        }
                        
                    }catch{
                        print("catch")
                    }
                    
                }else{
                    print("False")
                }
                self.stopLoading()
                self.getNurseJobTypesAPI()
            }
        }
    }
    
    func getNurseJobTypesAPI(){
        
        let mdl = JobTypesRequest()
        
        print("getWorkLocationAPI mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getNurseJobTypesListAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseWorkLocationResp = try JSONDecoder().decode(NurseJobTypes.self, from: jsonData)
                        
                        self.nurseJobTypes = nurseWorkLocationResp
                        
                        self.jobTypesCollectionView.reloadData()
                    }catch{
                        print("catch")
                    }
                }else{
                    print("False")
                    
                }
                self.stopLoading()
                self.getNurseShiftTypesAPI()
            }
        }
    }
    
    func getNurseShiftTypesAPI(){
        
        let mdl = ShiftTypesRequest()
        
        print("getWorkLocationAPI mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.getNurseShiftTypesAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let nurseWorkLocationResp = try JSONDecoder().decode(NurseShifts.self, from: jsonData)
                        
                        self.nurseShiftTypes = nurseWorkLocationResp
                        
                        self.shiftTypeCollectionView.reloadData()
                    }catch{
                        print("catch")
                    }
                }else{
                    print("False")
                    
                }
                self.stopLoading()
            }
        }
    }
}

extension FilterVC {
    
    func setUpDropDownProfessionType(){
        
        if self.professionTypes?.data?.count ?? 0 == 0 {
            return
        }
        var strName = [String]()
        
        self.professionTypeDropDown.anchorView = self.professionDropImg
        
        var indNo = 0
        
        for _ in 1...(self.professionTypes?.data?.count ?? 0){
            strName.append(self.professionTypes?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.professionTypeDropDown.direction = .bottom
        self.professionTypeDropDown.bottomOffset = CGPoint(x: -325, y: 22)
        self.professionTypeDropDown.dataSource = strName
        self.professionTypeDropDown.width = 370
        self.professionTypeDropDown.show()
        
        self.professionDropImg.transform =   self.professionDropImg.transform.rotated(by: .pi)
        
        self.professionTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.professionDropImg.transform =   (self?.professionDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.typeOfProfessionLable.text = item
        }
    }
    
    func setUpDropDownNurseSpecialitiesType(){
        
        if self.nurseSpecialities?.data?.count ?? 0 == 0 {
            return
        }
        var strName = [String]()
        
        self.specialitiesTypeDropDown.anchorView = self.specialitiesDropImg
        
        var indNo = 0
        
        for _ in 1...(self.nurseSpecialities?.data?.count ?? 0){
            strName.append(self.nurseSpecialities?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.specialitiesTypeDropDown.direction = .bottom
        self.specialitiesTypeDropDown.bottomOffset = CGPoint(x: -325, y: 22)
        self.specialitiesTypeDropDown.dataSource = strName
        self.specialitiesTypeDropDown.width = 370
        self.specialitiesTypeDropDown.show()
        
        self.specialitiesDropImg.transform =   self.specialitiesDropImg.transform.rotated(by: .pi)
        
        self.specialitiesTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.specialitiesDropImg.transform =   (self?.specialitiesDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.typeOfSpecialtyLable.text = item
        }
    }
    
    func setUpDropDownNurseLocationType(){
        
        if self.nurseLocation?.data?.count ?? 0 == 0 {
            return
        }
        
        var strName = [String]()
        
        self.nurseLocationTypeDropDown.anchorView = self.locationDropImg
        
        var indNo = 0
        
        for _ in 1...(self.nurseLocation?.data?.count ?? 0){
            strName.append(self.nurseLocation?.data?[indNo].name ?? "")
            indNo += 1
        }
        
        self.nurseLocationTypeDropDown.direction = .bottom
        self.nurseLocationTypeDropDown.bottomOffset = CGPoint(x: -325, y: 22)
        self.nurseLocationTypeDropDown.dataSource = strName
        self.nurseLocationTypeDropDown.width = 370
        self.nurseLocationTypeDropDown.show()
        
        self.locationDropImg.transform =   self.locationDropImg.transform.rotated(by: .pi)
        
        self.nurseLocationTypeDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.locationDropImg.transform =   (self?.locationDropImg.transform.rotated(by: .pi))!
            print("item \(item)")
            self?.typeOfLocationLable.text = item
        }
    }
}

extension FilterVC {
    func setUPDatePicker(){
        self.startDateTextField.inputView = self.startDatePicker
        
        if #available(iOS 14, *) {
            self.startDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.startDatePicker.addTarget(self, action: #selector(self.handleStartDatePicker(sender:)), for: .valueChanged)
        self.endDateTextField.inputView = self.endDatePicker
        
        if #available(iOS 14, *) {
            self.endDatePicker.preferredDatePickerStyle = .wheels
        }
        
        self.endDatePicker.addTarget(self, action: #selector(self.handleEndDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleStartDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.startDateLable.text = formatter.string(from: sender.date)
    }
    
    @objc func handleEndDatePicker(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterForPlayList = DateFormatter()
        formatterForPlayList.dateFormat = "yyyy-M-d"
        
        self.endDateLable.text = formatter.string(from: sender.date)
    }
}

// MARK: - RangeSeekSliderDelegate
extension FilterVC: RangeSeekSliderDelegate {
    
    func setupWeeklyPaySliderFilterView(){
        // custom number formatter range slider
        self.weeklyPaySlider.delegate = self
        self.weeklyPaySlider.minValue = 0.0
        self.weeklyPaySlider.maxValue = 100.0
        self.weeklyPaySlider.selectedMinValue = 40.0
        self.weeklyPaySlider.selectedMaxValue = 60.0
        self.weeklyPaySlider.handleImage = UIImage(named: "custom-handle")
        self.weeklyPaySlider.selectedHandleDiameterMultiplier = 1.0
        self.weeklyPaySlider.colorBetweenHandles = GoodWorkAppColor.appDarkPurple
        self.weeklyPaySlider.tintColor = GoodWorkAppColor.appSliderBg

        self.weeklyPaySlider.minLabelColor = GoodWorkAppColor.appAuroMetalSaurus
        self.weeklyPaySlider.maxLabelColor = GoodWorkAppColor.appAuroMetalSaurus

        self.weeklyPaySlider.minLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)
        self.weeklyPaySlider.maxLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)

        self.weeklyPaySlider.lineHeight = 6.0
        self.weeklyPaySlider.numberFormatter.positivePrefix = "$"
        self.weeklyPaySlider.numberFormatter.positiveSuffix = "/wk"
        self.setupHoursePerShiftSliderFilterView()
    }
  
    func setupHoursePerShiftSliderFilterView(){
        // custom number formatter range slider
        self.hoursePerShiftSlider.delegate = self
        self.hoursePerShiftSlider.minValue = 0.0
        self.hoursePerShiftSlider.maxValue = 100.0
        self.hoursePerShiftSlider.selectedMinValue = 40.0
        self.hoursePerShiftSlider.selectedMaxValue = 60.0
        self.hoursePerShiftSlider.handleImage = UIImage(named: "custom-handle")
        self.hoursePerShiftSlider.selectedHandleDiameterMultiplier = 1.0
        self.hoursePerShiftSlider.colorBetweenHandles = GoodWorkAppColor.appDarkPurple
        self.hoursePerShiftSlider.tintColor = GoodWorkAppColor.appSliderBg

        self.hoursePerShiftSlider.minLabelColor = GoodWorkAppColor.appAuroMetalSaurus
        self.hoursePerShiftSlider.maxLabelColor = GoodWorkAppColor.appAuroMetalSaurus

        self.hoursePerShiftSlider.minLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)
        self.hoursePerShiftSlider.maxLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)

        self.hoursePerShiftSlider.lineHeight = 6.0
        self.hoursePerShiftSlider.numberFormatter.positivePrefix = "$"
        self.hoursePerShiftSlider.numberFormatter.positiveSuffix = "/wk"
        self.setupHoursePerWeekSliderFilterView()
    }
    
    func setupHoursePerWeekSliderFilterView(){
        // custom number formatter range slider
        self.hoursePerWeekSlider.delegate = self
        self.hoursePerWeekSlider.minValue = 0.0
        self.hoursePerWeekSlider.maxValue = 100.0
        self.hoursePerWeekSlider.selectedMinValue = 40.0
        self.hoursePerWeekSlider.selectedMaxValue = 60.0
        self.hoursePerWeekSlider.handleImage = UIImage(named: "custom-handle")
        self.hoursePerWeekSlider.selectedHandleDiameterMultiplier = 1.0
        self.hoursePerWeekSlider.colorBetweenHandles = GoodWorkAppColor.appDarkPurple
        self.hoursePerWeekSlider.tintColor = GoodWorkAppColor.appSliderBg

        self.hoursePerWeekSlider.minLabelColor = GoodWorkAppColor.appAuroMetalSaurus
        self.hoursePerWeekSlider.maxLabelColor = GoodWorkAppColor.appAuroMetalSaurus

        self.hoursePerWeekSlider.minLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)
        self.hoursePerWeekSlider.maxLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)

        self.hoursePerWeekSlider.lineHeight = 6.0
        self.hoursePerWeekSlider.numberFormatter.positivePrefix = "$"
        self.hoursePerWeekSlider.numberFormatter.positiveSuffix = "/wk"
        self.setupassignMentLenghtSliderFilterView()
    }
    
    func setupassignMentLenghtSliderFilterView(){
        // custom number formatter range slider
        self.assignMentLenghtSlider.delegate = self
        self.assignMentLenghtSlider.minValue = 0.0
        self.assignMentLenghtSlider.maxValue = 100.0
        self.assignMentLenghtSlider.selectedMinValue = 40.0
        self.assignMentLenghtSlider.selectedMaxValue = 60.0
        self.assignMentLenghtSlider.handleImage = UIImage(named: "custom-handle")
        self.assignMentLenghtSlider.selectedHandleDiameterMultiplier = 1.0
        self.assignMentLenghtSlider.colorBetweenHandles = GoodWorkAppColor.appDarkPurple
        self.assignMentLenghtSlider.tintColor = GoodWorkAppColor.appSliderBg

        self.assignMentLenghtSlider.minLabelColor = GoodWorkAppColor.appAuroMetalSaurus
        self.assignMentLenghtSlider.maxLabelColor = GoodWorkAppColor.appAuroMetalSaurus

        self.assignMentLenghtSlider.minLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)
        self.assignMentLenghtSlider.maxLabelFont =  GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 16)

        self.assignMentLenghtSlider.lineHeight = 6.0
        self.assignMentLenghtSlider.numberFormatter.positivePrefix = ""
        self.assignMentLenghtSlider.numberFormatter.positiveSuffix = ""
    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
//        self.setupSliderFilterView(self.weeklyPaySlider)
//        self.setupSliderFilterView(self.hoursePerShiftSlider)
//        self.setupSliderFilterView(self.hoursePerWeekSlider)
//        self.setupSliderFilterView(self.assignMentLenghtSlider)
        
        if slider === self.weeklyPaySlider {
            print("Custom slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            self.weeklyPayMin = minValue
            self.weeklyPayMax = minValue
//            print("self.weeklyPayMin \(self.weeklyPayMin)")
//            print("self.weeklyPayMax \(self.weeklyPayMax)")
            print("newww \(String(format: "%.0f",self.weeklyPayMin))")
        }else if slider === self.hoursePerShiftSlider {
            print("Custom slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            self.hoursePerShiftMin = minValue
            self.hoursePerShiftMax = minValue
            print("hoursePerShiftMin \(self.hoursePerShiftMin)")
            print("hoursePerShiftMax \(self.hoursePerShiftMax)")
        }else if slider === self.hoursePerWeekSlider {
            print("Custom slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            self.hoursePerWeekMin = minValue
            self.hoursePerWeekMax = minValue
            print("hoursePerWeekMin \(self.hoursePerWeekMin)")
            print("hoursePerWeekMax \(self.hoursePerWeekMax)")
        }else if slider === self.assignMentLenghtSlider {
            print("Custom slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
            self.assignMentLenghtMin = minValue
            self.assignMentLenghtMax = minValue
            print("assignMentLenghtMin \(self.assignMentLenghtMin)")
            print("assignMentLenghtMax \(self.assignMentLenghtMax)")
        }
    }
    
    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }
    
    func didEndTouches(in slider: RangeSeekSlider) {
        print("did end touches")
    }
}

extension Array {
    func item(at index: Int) -> Element? {
        return (index < self.count && index >= 0) ? self[index] : nil
    }
}
