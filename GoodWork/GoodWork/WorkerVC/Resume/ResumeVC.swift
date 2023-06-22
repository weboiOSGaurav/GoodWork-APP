//
//  ResumeVC.swift
//  GoodWork
//
//  Created by Gaurav Jani on 05/04/23.
//

import UIKit
import Foundation
import SwiftyAttributes
import MobileCoreServices
import Alamofire

class ResumeVC: BaseVC {
    
    static let storyBoardIdentifier = "ResumeVC"
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var leftSideTopImageView: UIImageView!
    
    @IBOutlet weak var backButtonImageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var uploadResumeButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var resumeTitleLabel: UILabel!
    
    @IBOutlet weak var addResumeTitleLabel: UILabel!
    
    @IBOutlet weak var resumeDescriptionLabel: UILabel!
    
    @IBOutlet weak var selectFileToUploadLabel: UILabel!
    
    @IBOutlet weak var uploadFileBGView: UIView!
    @IBOutlet weak var uploadFileShadowView: UIView!
    
    @IBOutlet weak var uploadFile: UILabel!
    @IBOutlet weak var noFileChosen: UILabel!
    
    var resumeStr = ""
    
    var resumeData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
        self.addResumeTitleLabel.text = ""
        
        let log = "Add".withAttributes([
            .textColor(GoodWorkAppColor.appDarkPurple),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 32))
        ])
        
        let inn = " your resume".withAttributes([
            .textColor(GoodWorkAppColor.appLightPink),
            .font(GoodWorkApp.goodWorkAppFont(GoodWorkAppFontName.NeueKabelMedium, 32))
        ])
        
        let finalString = (log + inn)
        
        self.addResumeTitleLabel.attributedText = finalString
        self.progressView.progress = updateProfileProgress()
        
        if self.resumeStr != ""{
            let lastPathOfResume = URL(string: self.resumeStr)?.lastPathComponent
            
            self.uploadFile.text = "\(lastPathOfResume ?? "")"
            
            if "\(lastPathOfResume ?? "")" != nil{
                self.noFileChosen.isHidden = true
            }
        }
        
    }
    
    func setUPUI(){
        
        self.view.backgroundColor =  GoodWorkAppColor.appBGPink
        
        self.backButtonImageView.image = UIImage(named: "backRC")
        
        self.skipButton.addBorderCornerRadius(23, 1, GoodWorkAppColor.appDarkPurple)
        
        self.saveButton.addRadiusAndBGColour(23, GoodWorkAppColor.appDarkPurple)
        
        self.resumeTitleLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appRaisin)
        
        self.selectFileToUploadLabel.addTitleColorAndFont(title: "Select  a file to upload", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 18, tintColor: GoodWorkAppColor.appEerieBlack)
        
        self.uploadFile.addTitleColorAndFont(title: "Upload a file", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.noFileChosen.addTitleColorAndFont(title: "No file chosen", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
        
        self.uploadFileBGView.addBorderWidthColour(2, GoodWorkAppColor.appColour, 12)
        self.uploadFileShadowView.shadowWithRadiusAndColour(12,GoodWorkAppColor.appArsenic)
        
        self.buttonActions()
    }
}

//MARK:- Button Actions
extension ResumeVC {
    
    func buttonActions(){
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: .touchUpInside)
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        self.saveButton.addTarget(self, action: #selector(self.saveButtonPressed(_:)), for: .touchUpInside)
        self.uploadResumeButton.addTarget(self, action: #selector(self.uploadResumeButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        print("backButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton){
        print("skipButtonPressed")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton){
        print("saveButtonPressed")
        self.uploadLogoImage()
    }
    
    @IBAction func uploadResumeButtonPressed(_ sender: UIButton){
        print("uploadResumeButtonPressed")
        self.attachDocument()
    }
}

extension ResumeVC {
    
    func attachDocument() {
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
        let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)
        
        if #available(iOS 11.0, *) {
            importMenu.allowsMultipleSelection = true
        }
        
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        
        present(importMenu, animated: true)
    }
}

extension ResumeVC: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let myURL = urls.first else {
            return
        }
        
        var urlM = myURL.absoluteString
        
        print("urlM:: \(urlM)")
        var newURL = URL(string: urlM)
        
        let lastPathOfResume = newURL?.lastPathComponent
        
     
        self.uploadFile.text = "\(lastPathOfResume ?? "")"
        
        if "\(lastPathOfResume ?? "")" != nil{
            self.noFileChosen.isHidden = true
        }
        
        print("\(lastPathOfResume ?? "").pdf")
        
        do{
            let imageData: Data = try Data(contentsOf: newURL!)
            self.resumeData = imageData
            print("imageData \(imageData)")
        }catch{
            print("error \(error)")
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ResumeVC {
    
    func uploadLogoImage(){
        
        self.startLoading()
        var userName = _userDefault.string(forKey: UserDefaultKeys.user_id.rawValue) ?? ""
        
     
        //Optional for extra parameter
        let header = ["Authorization": "Bearer" + " " + APIDataHandler.shared.getSessionToken()]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(self.resumeData, withName: "resume",fileName: "resume", mimeType: "")
        },
                         to:"https://goodwork.jobpazi.in/api/nurse-resume?user_id=\(userName)&api_key=goodwork@123",headers: header)
        { (result) in
            switch result {
            case .success(let upload, _ , _ ):
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                upload.responseJSON { response in
                    print("Result=====",response.result.value)
                    
                    if response.result.value == nil{
                        
                        self.stopLoading()
                        self.navigationController?.popViewController(animated: true)
                        self.notificationBanner("Something went wrong please try again")
                        
                        return
                    }
                    
                    if let dict = response.result.value as? NSDictionary{
                        let code = dict.value(forKey: "api_status") as? String ?? "1"
                        let messageStr = dict.value(forKey: "message") as? String ?? ""
                        if code == "1"{
                          print("True 200")
                            self.notificationBanner(messageStr)
                            self.navigationController?.popViewController(animated: true)
                        }else{
                            self.notificationBanner("Something went wrong please try again")
                        }
                        self.stopLoading()
                    }
                }
                
            case .failure(let encodingError):
                print(encodingError)
                self.view.isUserInteractionEnabled = true
//                self.activityindicator.stopAnimating()
                //self.btnSave.isUserInteractionEnabled = true
                self.stopLoading()
                self.notificationBanner("Something went wrong please try again")
             }
          }
    }
}
