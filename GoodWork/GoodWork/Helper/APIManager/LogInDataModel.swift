//
//  LogInDataModel.swift
//  Scout
//
//  Created by Annu Priya on 24/03/21.
//

import Foundation
import UIKit
import Alamofire


struct SignUpRequest {
    var first_name = ""
    var last_name = ""
    var email = ""
    var mobile = ""
    var fcm_token = "123456789"
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject] {
        var obj = [String:AnyObject]()
        obj["first_name"] = self.first_name as AnyObject
        obj["last_name"] = self.last_name as AnyObject
        obj["email"] = self.email as AnyObject
        obj["mobile"] = self.mobile as AnyObject
        obj["fcm_token"] = self.fcm_token as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct RCSignUpRequest {
    var first_name = ""
    var last_name = ""
    var email = ""
    var mobile = ""
    var fcm_token = "123456789"
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject] {
        var obj = [String:AnyObject]()
        obj["first_name"] = self.first_name as AnyObject
        obj["last_name"] = self.last_name as AnyObject
        obj["email"] = self.email as AnyObject
        obj["mobile"] = self.mobile as AnyObject
        obj["fcm_token"] = self.fcm_token as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct SignInRequest {
    var email = ""
    var password = "ios"
    var deviceTkn = ""
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["email"] = self.email as AnyObject
        obj["password"] = self.password as AnyObject
        obj["deviceToken"] = self.deviceTkn as AnyObject
        return obj
    }
}

struct SendOTPRequest {
    var id = ""
    var api_key = "goodwork@123"
    var role = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["id"] = self.id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["role"] = self.role as AnyObject
        
        return obj
    }
}

struct ConfirmOTPRequest {
    var user_id = ""
    var otp = ""
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["otp"] = self.otp as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        return obj
    }
}

struct NurseProfileRequest {
    var user_id = ""
    var role = ""
    var nurse_id = ""
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["nurse_id"] = self.nurse_id as AnyObject
        obj["role"] = self.role as AnyObject
        
        return obj
    }
}

struct UpdateAccountInfoRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    var first_name = ""
    var last_name = ""
    var user_name = ""
    var mobile = ""
    var email = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["first_name"] = self.first_name as AnyObject
        obj["last_name"] = self.last_name as AnyObject
        obj["user_name"] = self.user_name as AnyObject
        obj["mobile"] = self.mobile as AnyObject
        obj["email"] = self.email as AnyObject
        return obj
    }
}



struct JobDetailsRequest {
    var id = ""
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["id"] = self.id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}

struct HomeRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        return obj
    }
}

struct PopularJobRequest {
    var job_id = ""
    var api_key = "goodwork@123"
    var user_id = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["job_id"] = self.job_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}


struct BrowseJobsRequest {
    
    var api_key = "goodwork@123"
    var user_id = ""
    var preferred_work_location = 0
    var specialty = 0
    var daily_rate = ""
    var profession = 0
    var work_location = ""
    var job_type = 0
    var start_date = ""
    var end_date = ""
    var weekly_pay_from = ""
    var weekly_pay_to = ""
    var hourly_pay_from = ""
    var hourly_pay_to = ""
    var preferred_shift = 0
    var hours_per_week_from = ""
    var hours_per_week_to = ""
    var auto_offers = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        
        obj["hours_per_week_to"] = self.hours_per_week_to as AnyObject
        obj["hours_per_week_from"] = self.hours_per_week_from as AnyObject
        obj["preferred_shift"] = self.preferred_shift as AnyObject
        obj["hourly_pay_to"] = self.hourly_pay_to as AnyObject
        obj["hourly_pay_from"] = self.hourly_pay_from as AnyObject
        obj["weekly_pay_to"] = self.weekly_pay_to as AnyObject
        obj["weekly_pay_from"] = self.weekly_pay_from as AnyObject
        obj["end_date"] = self.end_date as AnyObject
        obj["start_date"] = self.start_date as AnyObject
        obj["job_type"] = self.job_type as AnyObject
        obj["work_location"] = self.work_location as AnyObject
        obj["profession"] = self.profession as AnyObject
        obj["daily_rate"] = self.daily_rate as AnyObject
        obj["specialty"] = self.specialty as AnyObject
        obj["preferred_work_location"] = self.preferred_work_location as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["auto_offers"] = self.auto_offers as AnyObject
        
        
        return obj
    }
}

struct MySavedJobsRequest {
    var user_id = ""
    var nurse_id = ""
    var api_key = "goodwork@123"
    var role = "role"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["nurse_id"] = self.nurse_id as AnyObject
        obj["role"] = self.role as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        return obj
    }
}

struct MyAppliedJobRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        return obj
    }
}

struct JobAcceptRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    var offer_id = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["offer_id"] = self.offer_id as AnyObject
        
        return obj
    }
}

struct JobRejectRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    var offer_id = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["offer_id"] = self.offer_id as AnyObject
        
        return obj
    }
}

struct MyHiredJobsRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct MyPastJobsRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}


struct MyOfferedJobsRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        
        
        return obj
    }
}

struct SaveJobRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    var job_id = "goodwork@123"
    var like = "1"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["job_id"] = self.job_id as AnyObject
        obj["like"] = self.like as AnyObject
        return obj
    }
}

struct SaveNewJobRequest {
    var nurse_id = ""
    var api_key = "goodwork@123"
    var job_id = "goodwork@123"
    var role = "nurse"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["nurse_id"] = self.nurse_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["job_id"] = self.job_id as AnyObject
        obj["role"] = self.role as AnyObject
        
        return obj
    }
}

struct likeJobRequest {
    var job_id = ""
    var api_key = "goodwork@123"
    var user_id = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["job_id"] = self.job_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}


struct DeleteNurseAccountRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        
        
        return obj
    }
}

struct UpdatePersonalInfoRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    var date_of_birth = "goodwork@123"
    var driving_license = "1"
    var security_number = "1"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["date_of_birth"] = self.date_of_birth as AnyObject
        obj["driving_license"] = self.driving_license as AnyObject
        obj["security_number"] = self.security_number as AnyObject
        return obj
    }
}

struct LicenseTypesRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct ExperienceTypesRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct PrivacyPoliciesRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct HelpSupportRequest {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var subject = 0
    var issue = "issue"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["subject"] = self.subject as AnyObject
        obj["issue"] = self.issue as AnyObject
        
        return obj
    }
}

struct SubjectTypesRequest {
    
    var api_key = "goodwork@123"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}


struct LicenseStatusRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct CertificationTypeRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct NurseSpecialitiesRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct CreateJobPostRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}



struct WorkLocationRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}


struct JobTypesRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct ShiftTypesRequest {
    
    var api_key = "goodwork@123"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        return obj
    }
}

struct NurseLicenseDetailRequest {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var nursing_license_number = "nursing_license_number"
    var license_type = ""
    var nursing_license_state = "nursing_license_state"
    var license_expiry_date = "license_expiry_date"
    var license_issue_date = "license_issue_date"
    var license_renewal_date = "license_renewal_date"
    var license_status = ""
    var authority_Issue = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["nursing_license_number"] = self.nursing_license_number as AnyObject
        obj["license_type"] = self.license_type as AnyObject
        obj["nursing_license_state"] = self.nursing_license_state as AnyObject
        obj["license_expiry_date"] = self.license_expiry_date as AnyObject
        obj["license_issue_date"] = self.license_issue_date as AnyObject
        obj["license_renewal_date"] = self.license_renewal_date as AnyObject
        obj["license_status"] = self.license_status as AnyObject
        obj["authority_Issue"] = self.authority_Issue as AnyObject
        
        return obj
    }
}

struct NurseEditCertificationRequest {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var certificate_id = "certificate_id"
    var type = 0
    var effective_date = "license_type"
    var expiration_date = "nursing_license_state"
    var renewal_date = "license_expiry_date"
    var license_number = "license_issue_date"
    var organization = "license_renewal_date"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["type"] = self.type as AnyObject
        obj["effective_date"] = self.effective_date as AnyObject
        obj["expiration_date"] = self.expiration_date as AnyObject
        obj["renewal_date"] = self.renewal_date as AnyObject
        obj["license_number"] = self.license_number as AnyObject
        obj["organization"] = self.organization as AnyObject
        obj["certificate_id"] = self.certificate_id as AnyObject
        
        return obj
    }
}

struct AddNurseCertificationRequest {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var type = 0
    var effective_date = "license_type"
    var expiration_date = "nursing_license_state"
    var renewal_date = "license_expiry_date"
    var license_number = "license_issue_date"
    var organization = "license_renewal_date"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["type"] = self.type as AnyObject
        obj["effective_date"] = self.effective_date as AnyObject
        obj["expiration_date"] = self.expiration_date as AnyObject
        obj["renewal_date"] = self.renewal_date as AnyObject
        obj["license_number"] = self.license_number as AnyObject
        obj["organization"] = self.organization as AnyObject
        
        
        return obj
    }
}

struct NurseExpRequest {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var type = 0
    var unit = "unit"
    var position_title = "position_title"
    var start_date = "start_date"
    var end_date = "end_date"
    var is_current_job = 0
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["type"] = self.type as AnyObject
        obj["unit"] = self.unit as AnyObject
        obj["position_title"] = self.position_title as AnyObject
        obj["start_date"] = self.start_date as AnyObject
        obj["end_date"] = self.end_date as AnyObject
        obj["is_current_job"] = self.is_current_job as AnyObject
        
        return obj
    }
}

struct EducationDetailRequest {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var college_uni_name = "college_uni_name"
    var graduation_date = "graduation_date"
    var study_area = "study_area"
    var highest_nursing_degree = "highest_nursing_degree"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        obj["college_uni_name"] = self.college_uni_name as AnyObject
        obj["graduation_date"] = self.graduation_date as AnyObject
        obj["study_area"] = self.study_area as AnyObject
        obj["highest_nursing_degree"] = self.highest_nursing_degree as AnyObject
        
        
        return obj
    }
}



struct UploadResumeRequest {
    var user_id = ""
    var api_key = "goodwork@123"
    var resume =  Data()
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["user_id"] = self.user_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["resume"] = self.resume as AnyObject
        return obj
    }
}

struct ApplyJobRequest {
    
    var api_key = "goodwork@123"
    var nurse_id = ""
    var job_id = ""
    var start_date = ""
    var user_id = ""
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["nurse_id"] = self.nurse_id as AnyObject
        obj["api_key"] = self.api_key as AnyObject
        obj["job_id"] = self.job_id as AnyObject
        obj["start_date"] = self.start_date as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}

//MARK:- RC FLOW
struct AccountInfoRequestRC {
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}

struct HomeInfoRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}

struct AboutMeRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}

struct GetEmployersRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}




struct GetNewApplicationsRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        
        return obj
    }
}

struct CreateJobPostRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var job_name = "job_name"
    var preferred_specialty = "preferred_specialty"
    var preferred_work_location = "preferred_work_location"
    var preferred_assignment_duration = "preferred_assignment_duration"
    var preferred_hourly_pay_rate = "preferred_hourly_pay_rate"
    var description = "description"
    var job_type = "job_type"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["job_name"] = self.job_name as AnyObject
        obj["preferred_specialty"] = self.preferred_specialty as AnyObject
        obj["preferred_work_location"] = self.preferred_work_location as AnyObject
        obj["preferred_assignment_duration"] = self.preferred_assignment_duration as AnyObject
        obj["preferred_hourly_pay_rate"] = self.preferred_hourly_pay_rate as AnyObject
        obj["description"] = self.description as AnyObject
        obj["job_type"] = self.job_type as AnyObject
        
        return obj
    }
}

struct UpdateJobPostRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    var job_name = "job_name"
    var preferred_specialty = "preferred_specialty"
    var preferred_work_location = "preferred_work_location"
    var preferred_assignment_duration = "preferred_assignment_duration"
    var preferred_hourly_pay_rate = "preferred_hourly_pay_rate"
    var description = "description"
    var job_type = "job_type"
    var job_id = "job_id"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        obj["job_name"] = self.job_name as AnyObject
        obj["preferred_specialty"] = self.preferred_specialty as AnyObject
        obj["preferred_work_location"] = self.preferred_work_location as AnyObject
        obj["preferred_assignment_duration"] = self.preferred_assignment_duration as AnyObject
        obj["preferred_hourly_pay_rate"] = self.preferred_hourly_pay_rate as AnyObject
        obj["description"] = self.description as AnyObject
        obj["job_type"] = self.job_type as AnyObject
        obj["job_id"] = self.job_id as AnyObject
        
        return obj
    }
}



struct GetDraftJobPostRequestRC{
    
    var api_key = "goodwork@123"
    var user_id = "user_id"
    
    func jsonObject()-> [String:AnyObject]{
        var obj = [String:AnyObject]()
        obj["api_key"] = self.api_key as AnyObject
        obj["user_id"] = self.user_id as AnyObject
        return obj
    }
}

class LoginDataManager{
    
    // MARK: BASE URL DEV
    let kBaseURL = "\(baseURLV1Constant.bseURL)"
    
    
    //MARK:- Base Url Keys
    let kLoginUrl      = "api/register"
    let kRegisterUrl   = "register"
    let kSendOTP       = "send-otp"
    let kConfirmOTP    = "confirm-otp"
    let kExplore       = "explore"
    let kJobLike       = "job-like"
    let kNurseProfile  = "get-nurse-profile"
    let kViewjob      = "view-job"
    let kApplyJob     = "apply"
    let kUpdatePersonalInfo = "nurse-personal-detail"
    let kGetLicenseTypes = "get-license-types"
    let kGetLicenseStatus = "get-license-status"
    let kNurseLicenseDetail = "nurse-license-detail"
    let knurseEducationDetail = "nurse-education-detail"
    let kCertificationTypeList = "certification-type-list"
    
    let kExperienceTypesList = "experience-type-list"
    let kAddExperienceDetail = "add-experience-detail"
    let kNurseResume = "nurse-resume"
    let kPrivacyPolicies = "privacy-policy"
    let kAboutUS = "about-app"
    let kHelpSupport = "help-support"
    let kSubjectTypes = "get-subject-types"
    let KGetSpecialities = "get-specialities"
    let KWorkLocation = "get-work-location"
    let KNurseJobTypes = "get-job-types"
    let KNurseShiftTypes = "preferred-shifts"
    let KBrowseJob = "browse-jobs"
    let KSaveJob = "save-job"
    let KMySavedJobList = "my-saved-jobs"
    let KMyAppliedJobList = "my-applied-jobs"
    let KJobAccept = "job-accept"
    let KJobReject = "job-reject"
    let KMyOfferedJobs = "my-offered-jobs"
    let KMyHiredJobs = "my-hired-jobs"
    let KMyPastJobs = "my-past-jobs"
    let KEditCertification = "edit-certification"
    let KAddCertification = "add-certification"
    let KDeleteNurseAccount = "delete-nurse"
    let KUpdateAccountInfo = "update_account-info"
    let KJobLike = "job-like"
    let KNurseSavedJobs = "nurse-saved-jobs"
    let KPopularJob = "job-popular"
    
    
    let KRegisterRC = "recruiter-register"
    let KAccountInfoRC = "account-info"
    let KHomeInfoRC = "home-screen"
    let KGetNewApplicationsRC = "get-new-applications"
    let KAssignmentDurationRC = "assignment-duration"
    let KjobCreateRC = "job-create"
    let kUpdateJobPostRC = "job-update"
    
    let aboutMeRC = "user-recruiter"
    let getEmployersRC = "get-employers"
    let applicationTypeListRC = "get-applications"
    let kAddJobOnDraftRC = "draft-job"
    let kGetDraftApplicationRC = "get-draft-applications"
    let kPublishedJobListRC = "get-published-applications"
    let kHiddenPostListRC = "get-hidden-applications"
    let kClosedPostListRC = "get-closed-applications"
    
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    static let shared = LoginDataManager()
    
    func getSessionToken() -> String {
        var sessionID = ""
        if let id = UserDefaults.standard.value(forKey: "access_token") as? String {
            sessionID = id
        }
        return sessionID
    }
    
    func getTokenType() -> String {
        var sessionID = ""
        if let id = UserDefaults.standard.value(forKey: "tokenType") as? String {
            sessionID = id
        }
        return sessionID
    }
    
    func registerNewUser(rqst:SignUpRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kRegisterUrl)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func rcRegisterNewUser(rqst:RCSignUpRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KRegisterRC)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func loginUser(rqst:SignInRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kLoginUrl)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }
            else {
                completionHandler(nil,error ?? "")
            }
        }
    }
    
    func sendOTP(rqst: SendOTPRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kSendOTP)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func confirmOTP(rqst: ConfirmOTPRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kConfirmOTP)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func nurseProfileDetails(rqst: NurseProfileRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kNurseProfile)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func updateAccountInfo(rqst: UpdateAccountInfoRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KUpdateAccountInfo)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func explore(rqst: HomeRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kExplore)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func popularJob(rqst: PopularJobRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KPopularJob)"
        
        print("signUp URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func browseJobAPI(rqst: BrowseJobsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KBrowseJob)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func mySavedJobListAPI(rqst: MySavedJobsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KMySavedJobList)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func nurseSavedJobListAPI(rqst: MySavedJobsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KNurseSavedJobs)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func  myAppliedJobListAPI(rqst: MyAppliedJobRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KMyAppliedJobList)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func JobAcceptAPI(rqst: JobAcceptRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KJobAccept)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func jobRejectAPI(rqst: JobRejectRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KJobReject)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func myHiredJobsAPI(rqst: MyHiredJobsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KMyHiredJobs)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func myPastJobAPI(rqst: MyPastJobsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KMyPastJobs)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func myOfferedJobsAPI(rqst: MyOfferedJobsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KMyOfferedJobs)"
        
        print("KBrowseJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    //    func saveJob(rqst: SaveJobRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
    //        let kUrl = "\(self.kBaseURL)\(self.kJobLike)"
    //
    //        print("saveJob URL :: \(kUrl)")
    //        print( rqst.jsonObject())
    //
    //        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
    //
    //            print( "PrintJsonData",JSONData ?? "")
    //            if JSONData != nil{
    //                let resultDict = JSONData as! Dictionary<String, AnyObject>
    //                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
    //                    if resultDict["statusCode"] as! Int == 200 {
    //
    //                        completionHandler(resultDict as NSDictionary, error)
    //                    }else{
    //                        completionHandler(resultDict as NSDictionary,error)
    //                    }
    //                }else{
    //                    completionHandler(resultDict as NSDictionary,error)
    //                }
    //            }else{
    //                completionHandler(nil, error ?? "")
    //            }
    //        }
    //    }
    
    
    func saveNewJob(rqst: SaveNewJobRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KSaveJob)"
        
        print("saveNewJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func likeJob(rqst: likeJobRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.KJobLike)"
        
        print("saveNewJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func deleteNurseAccountAPI(rqst: DeleteNurseAccountRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        //        let kUrl = "\(self.kBaseURL)\(self.KDeleteNurseAccount)"
        
        let kUrl = "\(self.kBaseURL)" + KDeleteNurseAccount + "?api_key=goodwork@123" + "user_id=\(rqst.user_id)"
        
        print("kUrl delete nurse account: \(kUrl)")
        
        APIDataHandler.shared.DeleteAccountDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func jobDetails(rqst: JobDetailsRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kViewjob)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func applyJob(rqst: ApplyJobRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        let kUrl = "\(self.kBaseURL)\(self.kApplyJob)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func updatePersonalInfoAPI(rqst: UpdatePersonalInfoRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kUpdatePersonalInfo)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func updateNurseResumeAPI(rqst: UploadResumeRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kNurseResume)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getLicenseTypesAPI(rqst: LicenseTypesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kGetLicenseTypes)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getExperienceTypesAPI(rqst: ExperienceTypesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kExperienceTypesList)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getPrivacyPoliciesAPI(rqst: PrivacyPoliciesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kPrivacyPolicies)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getAboutUSAPI(rqst: PrivacyPoliciesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kAboutUS)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getHelpSupportAPI(rqst: HelpSupportRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kHelpSupport)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getSubjectTypesAPI(rqst: SubjectTypesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kSubjectTypes)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func getLicenseStatusAPI(rqst: LicenseStatusRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kGetLicenseStatus)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getCertificationTypeListAPI(rqst: CertificationTypeRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kCertificationTypeList)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getNurseSpecialitiesListAPI(rqst: NurseSpecialitiesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KGetSpecialities)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getWorkLocationListAPI(rqst: WorkLocationRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KWorkLocation)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getNurseJobTypesListAPI(rqst: JobTypesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KNurseJobTypes)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getNurseShiftTypesAPI(rqst: ShiftTypesRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KNurseShiftTypes)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func nurseLicenseDetailAPI(rqst: NurseLicenseDetailRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kNurseLicenseDetail)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func educationDetailAPI(rqst: EducationDetailRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.knurseEducationDetail)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func nurseEditCertificationAPI(rqst: NurseEditCertificationRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KEditCertification)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func addNurseCertificationAPI(rqst: AddNurseCertificationRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KAddCertification)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func addNurseExperienceAPI(rqst: NurseExpRequest, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kAddExperienceDetail)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    //MARK:- RC FLOW
    func accountInfoRequestRCAPI(rqst: AccountInfoRequestRC, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KAccountInfoRC)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func homeInfoRequestRequestRCAPI(rqst: HomeInfoRequestRC, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KHomeInfoRC)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func aboutMeRCAPI(rqst: AboutMeRequestRC, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.aboutMeRC)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func applicationTypeListRCAPI(rqst: AboutMeRequestRC, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.applicationTypeListRC)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getEmployersRCAPI(rqst: GetEmployersRequestRC, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.getEmployersRC)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    
    func getNewApplicationsRCAPI(rqst: GetNewApplicationsRequestRC, completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KGetNewApplicationsRC)"
        
        print("saveJob URL :: \(kUrl)")
        print( rqst.jsonObject())
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getAssignmentDurationRCAPI(completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KAssignmentDurationRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: nil) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func creatNewjobPostRCAPI(rqst: CreateJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.KjobCreateRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
   
    func updateJobPostRCAPI(rqst: UpdateJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kUpdateJobPostRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func addJobOnDraftRCAPI(rqst: CreateJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kAddJobOnDraftRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getDraftApplicationRCAPI(rqst: GetDraftJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kGetDraftApplicationRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getPublishedRCAPI(rqst: GetDraftJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kPublishedJobListRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getHiddenRCAPI(rqst: GetDraftJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kHiddenPostListRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
    func getClosePostListRCAPI(rqst: GetDraftJobPostRequestRC,completionHandler: @escaping (_ dict:NSDictionary?, _ error: String?) -> Void){
        
        let kUrl = "\(self.kBaseURL)\(self.kClosedPostListRC)"
        
        print("saveJob URL :: \(kUrl)")
        
        
        APIDataHandler.shared.PostDataOfType(type: .signup, url: kUrl, withPostDataIn: rqst.jsonObject()) { (JSONData, error) in
            
            print( "PrintJsonData",JSONData ?? "")
            if JSONData != nil{
                let resultDict = JSONData as! Dictionary<String, AnyObject>
                if let result = resultDict["result"] as? Dictionary<String, AnyObject> {
                    if resultDict["statusCode"] as! Int == 200 {
                        
                        completionHandler(resultDict as NSDictionary, error)
                    }else{
                        completionHandler(resultDict as NSDictionary,error)
                    }
                }else{
                    completionHandler(resultDict as NSDictionary,error)
                }
            }else{
                completionHandler(nil, error ?? "")
            }
        }
    }
    
}
