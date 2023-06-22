//
//  HomeRCVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 24/04/23.
//

import UIKit
import NotificationBannerSwift
import SwiftyAttributes
import Charts

class HomeRCVC: DemoBaseViewController {
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationBGView: UIView!
    
    @IBOutlet weak var startPostingBGView: UIView!
    @IBOutlet weak var startPostLabel: UILabel!
    @IBOutlet weak var jobRequestLabel: UILabel!
    @IBOutlet weak var startPostingImageView: UIImageView!
    @IBOutlet weak var pluseBgView: UIView!
    
    @IBOutlet weak var jobTypeCollectionView: UICollectionView!
    
    @IBOutlet weak var latestNotiesTableView: UITableView!
    @IBOutlet weak var latestNotiesLabel: UILabel!
    
    @IBOutlet weak var notiesBgView: UIView!
    @IBOutlet weak var notiesShadowView: UIView!
    
    @IBOutlet weak var jobStatusBgView: UIView!
    @IBOutlet weak var jobStatusShadowView: UIView!
    @IBOutlet weak var jobStatusTitleLabel: UILabel!
    
    @IBOutlet var chartView: BarChartView!
    
    @IBOutlet weak var jobStatusBgViewHeightCons: NSLayoutConstraint!
    @IBOutlet weak var jobStatusShadowViewHeightCons: NSLayoutConstraint!
    
    @IBOutlet weak var createPostBgView: UIView!
    @IBOutlet weak var postAnotherJob: UILabel!
    @IBOutlet weak var createPostBgViewTopCons: NSLayoutConstraint!
    
    @IBOutlet weak var createPostButton: UIButton!
    
    var jobTypeArray = [String]()
    var jobTypeCountArray = [Int]()
    
    var isNewUserLogin = false
    
    var homeJobDetails : Home?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GoodWorkAppColor.appBGPink
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.graphInit()
        self.homeScreenAPI()
        self.isNewUserLogin = true
        
        if self.isNewUserLogin == false {
            self.createPostBgViewTopCons.constant = -20
            self.jobStatusBgViewHeightCons.constant = 0
            self.jobStatusShadowViewHeightCons.constant = 0
        }else{
            self.createPostBgViewTopCons.constant = 10
            self.jobStatusBgViewHeightCons.constant = 300
            self.jobStatusShadowViewHeightCons.constant = 300
        }
        self.aboutMeAPI()
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
      
        self.profileImageView.image = UIImage(named: "profileDemo")
        self.profileImageView.addBorderCornerRadius(Int(self.profileImageView.frame.height) / 2, 0, .clear)
        
        
        self.postAnotherJob.addTitleColorAndFont(title: "Post Another Job +", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 16, tintColor: GoodWorkAppColor.appOffWhite)
        
        self.userNameLabel.addTitleColorAndFont(title: "", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.notificationImageView.image = UIImage(named: "notification")
        self.notificationBGView.addRadiusAndBGColour((self.notificationBGView.frame.height / 2), GoodWorkAppColor.appDarkPurple)
        
        self.startPostingBGView.cornerRadiusWithBgColour(18, bgColour: GoodWorkAppColor.appRaisinBlack)
        
        self.startPostLabel.addTitleColorAndFont(title: "Start Posting", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 24, tintColor: GoodWorkAppColor.appWhite)
        
        self.jobRequestLabel.addTitleColorAndFont(title: "Your Job Request", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 24, tintColor: GoodWorkAppColor.appWhite)
        
        self.latestNotiesLabel.addTitleColorAndFont(title: "Latest Noties", fontName: GoodWorkAppFontName.NeueKabelRegular, fontSize: 14, tintColor: GoodWorkAppColor.appCharade)
        
        
        self.pluseBgView.addRadiusAndBGColour((self.pluseBgView.frame.height / 2), GoodWorkAppColor.appGre)
        self.startPostingImageView.image = UIImage(named: "pluseDark")
        
        
        self.notiesBgView.addBorderWidthColour(1, GoodWorkAppColor.appDarkPurple, 6)
        
        self.notiesShadowView.shadowWithRadiusAndColour(6, GoodWorkAppColor.appDavysGrey)
        
        
        self.createPostBgView.addRadiusAndBGColour(30,GoodWorkAppColor.appDarkPurple)
        
        self.jobStatusBgView.addBorderWidthColour(1, GoodWorkAppColor.appDarkPurple, 6)
        
        self.jobStatusShadowView.shadowWithRadiusAndColour(6, GoodWorkAppColor.appDavysGrey)
        
        self.jobStatusTitleLabel.addTitleColorAndFont(title: "Job Status", fontName: GoodWorkAppFontName.NeueKabelBold, fontSize: 20, tintColor: GoodWorkAppColor.appLightPink)
        
        self.loadCollectionview()
        self.loadTableView()
        self.buttonActions()
    }
    
    func updateProfileData(){
        if appDelegate.recruiterProfile?.data?.count != 0 {
            
            
            self.userNameLabel.text = (appDelegate.recruiterProfile?.data?[0].first_name?.capitalized ?? "") + " " + (appDelegate.recruiterProfile?.data?[0].last_name?.capitalized ?? "")
            
            guard let imgUrlString = appDelegate.recruiterProfile?.data?[0].image ?? "".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
            
            self.profileImageView.sd_setImage(with: URL(string: imgUrlString), placeholderImage: UIImage(named: "profileDemo"))
        }
    }
    
    func updateHomeData(){
        self.jobTypeArray = ["Permanent", "Travel", "Per Diem", "Local"]
        self.jobTypeCountArray.append(self.homeJobDetails?.data?.permanent_jobs ?? 0)
        self.jobTypeCountArray.append(self.homeJobDetails?.data?.travel_jobs ?? 0)
        self.jobTypeCountArray.append(self.homeJobDetails?.data?.perdiem_jobs ?? 0)
        self.jobTypeCountArray.append(self.homeJobDetails?.data?.local_jobs ?? 0)
        
        self.jobTypeCollectionView.reloadData()
        self.latestNotiesTableView.reloadData()
        self.graphInit()
    }
}

extension HomeRCVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func loadCollectionview(){
        self.jobTypeCollectionView.register(UINib(nibName: JobTypeCollectionViewCell.reuseCellIdentifier, bundle: nil), forCellWithReuseIdentifier: JobTypeCollectionViewCell.reuseCellIdentifier)
        self.jobTypeCollectionView.delegate = self
        self.jobTypeCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.jobTypeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobTypeCollectionViewCell.reuseCellIdentifier, for: indexPath) as! JobTypeCollectionViewCell
       
        cell.jobTypeLable.text = self.jobTypeArray[indexPath.row]
        cell.jobTypeDescriptionLable.text = "\(self.jobTypeCountArray[indexPath.row])+ Workers Available"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftAndRightPaddings: CGFloat = 0
        let numberOfItemsPerRow: CGFloat = 2.0
        
        let width = (collectionView.frame.width - leftAndRightPaddings)/numberOfItemsPerRow
        
        return CGSize(width: width , height: 140)
    }
}

//MARK:- Button Actions
extension HomeRCVC {
    
    func buttonActions(){
        self.profileButton.addTarget(self, action: #selector(self.profileButtonPressed(_:)), for: .touchUpInside)
        
        self.notificationButton.addTarget(self, action: #selector(self.notificationButtonPressed(_:)), for: .touchUpInside)
        self.createPostButton.addTarget(self, action: #selector(self.createPostButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton){
        print("profileButtonPressed")
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: ProfileRCVC.storyBoardIdentifier) as? ProfileRCVC else { return }
        vc.obj = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func notificationButtonPressed(_ sender: UIButton){
        print("notificationButtonPressed")
        guard let vc = mainStoryboard.instantiateViewController(withIdentifier: NotificationsVC.storyBoardIdentifier) as? NotificationsVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createPostButtonPressed(_ sender: UIButton){
        print("createPostButtonPressed")
        
        guard let vc = recruiterStoryboard.instantiateViewController(withIdentifier: CreatJobRequestRCVC.storyBoardIdentifier) as? CreatJobRequestRCVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeRCVC : shoTabBarVC{
    
    func shoTabBarVC() {
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension HomeRCVC : UITableViewDelegate, UITableViewDataSource {
    
    func loadTableView(){
        
        self.latestNotiesTableView.register(UINib(nibName: LatestNotiesTableViewCell.reuseCellIdentifier, bundle: nil), forCellReuseIdentifier: LatestNotiesTableViewCell.reuseCellIdentifier)
        
        self.latestNotiesTableView.delegate = self
        self.latestNotiesTableView.dataSource = self
        
        
        self.latestNotiesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.homeJobDetails?.data?.notification?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LatestNotiesTableViewCell.reuseCellIdentifier, for: indexPath) as! LatestNotiesTableViewCell
        cell.dotLineView.isHidden = false
        
        
        
        if self.homeJobDetails?.data?.notification?[indexPath.row].status == 4{
            cell.dateLable.text = self.homeJobDetails?.data?.notification?[indexPath.row].created_at_definition ?? ""
            cell.descriptionLable.text = self.homeJobDetails?.data?.notification?[indexPath.row].text ?? ""
            cell.statusBGView.backgroundColor = GoodWorkAppColor.appDeYork
            cell.statusLable.text = "Accepted"
            
            cell.alertImageView.image = UIImage(named: "Approval")
            cell.alertImgHeightConstrain.constant = 24
            cell.statusLable.addTitleColorAndFont(title: "Accepted", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 11, tintColor: GoodWorkAppColor.appDarkPurple)
        }else if self.homeJobDetails?.data?.notification?[indexPath.row].status == 2{
            cell.dateLable.text = self.homeJobDetails?.data?.notification?[indexPath.row].created_at_definition ?? ""
            cell.descriptionLable.text = self.homeJobDetails?.data?.notification?[indexPath.row].text ?? ""
            cell.statusBGView.backgroundColor =  GoodWorkAppColor.appRed
            cell.statusLable.addTitleColorAndFont(title: "Pending", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 11, tintColor: GoodWorkAppColor.appWhite)
            
            cell.alertImageView.image = UIImage(named: "redAlert")
            cell.alertImgHeightConstrain.constant = 17
        }else if self.homeJobDetails?.data?.notification?[indexPath.row].status == 1{
            cell.dateLable.text = self.homeJobDetails?.data?.notification?[indexPath.row].created_at_definition ?? ""
            cell.descriptionLable.text = self.homeJobDetails?.data?.notification?[indexPath.row].text ?? ""
            cell.statusBGView.backgroundColor = GoodWorkAppColor.appPorcelain
            cell.dotLineView.isHidden = true
            cell.statusLable.addTitleColorAndFont(title: "New Application", fontName: GoodWorkAppFontName.PoppinsSemiBold, fontSize: 11, tintColor: GoodWorkAppColor.appCharade)
            
            cell.alertImageView.image = UIImage(named: "Terms")
            cell.alertImgHeightConstrain.constant = 24
        }
        
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("didSelectRowAt \(indexPath.row)")
        
    }
}

extension HomeRCVC {
    
    
    func graphInit(){
        
        self.setup(barLineChartView: chartView)
        
        chartView.delegate = self
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        
        chartView.maxVisibleCount = 60
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = 7
        xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1
        leftAxisFormatter.negativeSuffix = ""
        leftAxisFormatter.positiveSuffix = ""
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 6
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = true
        rightAxis.labelFont = .systemFont(ofSize: 10)
        rightAxis.labelCount = 6
        rightAxis.valueFormatter = leftAxis.valueFormatter
        rightAxis.spaceTop = 0.15
        rightAxis.axisMinimum = 0
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
        l.font = UIFont(name: GoodWorkAppFontName.PoppinsRegular.rawValue, size: 12)!
        l.xEntrySpace = 4
        
        self.setDataCount(4, range: 20)
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let start = 0
        
        var vly = [Int]()
        
        
        vly.append(self.homeJobDetails?.data?.new ?? 0)
        vly.append(self.homeJobDetails?.data?.offered ?? 0)
        vly.append(self.homeJobDetails?.data?.onboard ?? 0)
        vly.append(self.homeJobDetails?.data?.working ?? 0)
        vly.append(self.homeJobDetails?.data?.done ?? 0)
        
        let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
            
            //            let mult = range + 1
            
            //            let val = Double(arc4random_uniform(mult))
            
            if arc4random_uniform(100) < 25 {
                return BarChartDataEntry(x: Double(i), y: Double(vly[Int(i)]), icon: UIImage(named: "icon"))
            } else {
                return BarChartDataEntry(x: Double(i), y: Double(vly[Int(i)]))
            }
        }
        
        var set1: BarChartDataSet! = nil
        
        if let set = chartView.data?.first as? BarChartDataSet {
            set1 = set
            set1.replaceEntries(yVals)
            chartView.data?.notifyDataChanged()
            chartView.notifyDataSetChanged()
        } else {
            set1 = BarChartDataSet(entries: yVals, label: "")
            set1.colors = [GoodWorkAppColor.appBlizzardBlue,GoodWorkAppColor.appSail,GoodWorkAppColor.appBlue,GoodWorkAppColor.appHalfBaked,GoodWorkAppColor.appMalibu]
            
            set1.drawValuesEnabled = false
            
            let data = BarChartData(dataSet: set1)
            data.setValueFont(UIFont(name: GoodWorkAppFontName.PoppinsRegular.rawValue, size: 12)!)
            data.barWidth = 0.5
            
            chartView.rightAxis.enabled = false
            chartView.legend.enabled = false
            chartView.xAxis.gridColor = .clear
            
            chartView.data = data
        }
    }
}

extension HomeRCVC{
    
    func homeScreenAPI(){
        
        var mdl = HomeInfoRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        mdl.user_id = "f5a1104e-e2ae-4440-a7ad-01ecbf48af43"
        print("mdl: \(mdl)")
        
        self.startLoading()
        
        LoginDataManager.shared.homeInfoRequestRequestRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let homeResp = try JSONDecoder().decode(Home.self, from: jsonData)
                        
                        self.homeJobDetails = homeResp
                        
                        if self.homeJobDetails?.api_status == "1"{
                            self.updateHomeData()
                        }else{
                            print("falsee")
                            self.notificationBanner(response["message"] as? String ?? "")
                        }
                    }catch{
                        print("catch:: \(error)")
                        
                    }
                }else{
                    print("False")
                    self.notificationBanner(response["message"] as? String ?? "")
                }
                self.stopLoading()
            }
        }
    }
    
    func aboutMeAPI(){
        
        var mdl = AboutMeRequestRC()
        mdl.user_id = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
      //  mdl.user_id = "f5a1104e-e2ae-4440-a7ad-01ecbf48af43"
        print("mdl: \(mdl)")
        
        LoginDataManager.shared.aboutMeRCAPI(rqst: mdl) { (dict, error) in
            
            DispatchQueue.main.async {
                
                let response = dict as? [String : Any] ??  [String : Any]()
                
                if response["api_status"] as? String ?? "" == "1" {
                    print("response:: \(response)")
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                        
                        let homeResp = try JSONDecoder().decode(AboutMe.self, from: jsonData)
                        
                        appDelegate.recruiterProfile = homeResp
                        self.updateProfileData()
                    }catch{
                        print("catch:: \(error)")
                        
                       // self.notificationBanner(response["message"] as? String ?? "")
                    }
                }else{
                    print("False")
                   // self.notificationBanner(response["message"] as? String ?? "")
                }
              //  self.stopLoading()
            }
        }
    }
}

extension HomeRCVC : updateProfilePhotoPro{
    
    func updateProfilePhotoPro(){
        //self.nurseProfileAPI()
        print("HomeRCVC  updateProfilePhotoPro")
    }
}
