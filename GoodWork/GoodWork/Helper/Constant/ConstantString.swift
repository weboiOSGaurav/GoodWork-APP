//
//  File.swift
//  Education
//
//  Created by Gaurav on 13/01/21.
//

import Foundation
import UIKit
import AVFoundation

enum UserDefaultKeys : String {
    case isUserLogin = "isUserLogin"
    case isRecruiterUserLogin = "isRecruiterUserLogin"
    case access_token = "access_token"
    case remind_token = "remind_token"
    case get_share_link = "get_share_link"
    case user_id = "user_id"
    case user_Name = "user_Name"
}

enum AlertMassage : String {
    case somethingWrong = "Something went wrong please try again"
    case emailAddressBlank = "Please enter an email address."
    case emailAddressWrong = "Please enter a valid email address."
    case passwordBlank = "Please enter a password."
    case firstNameBlank = "Please enter a first name."
    case lastNameBlank = "Please enter a last name."
    case phoneNumberBlank = "Please enter a phone number."
    case phoneNumberWrong = "Please enter a valid phone number."
    case otpNumberBlank = "Please enter a otp number."
    case phoneEmailValidation = "Please enter either valid phone or email."
    case dateOfBirth = "Please selected date of birth."
    case socialSecurityNo = "Please enter a valid social security number."
    case driveringNo = "Please enter a valid driving licence number."
    case licenseNo = "Please enter a license number"
    case licenseType = "Please select license type"
    case issueAutho = "Please enter a issue authority"
    case issueDate = "Please enter a issue date"
    case expDate = "Please enter a expiration date"
    case renewalDate = "Please enter a renewal date"
    case licenseStatus = "Please select license status"
    case instName = "Please enter a institution name"
    case myDegree = "Please select degree"
    case areaOfStudy = "Please enter a study area"
    case graduationDate = "Please enter a graduation date"
    case certiNumber = "Please enter a certification number"
    case certitype = "Please select certification type"
    case certiOraganization = "Please enter a organization"
    case expType = "Please select experience type"
    case unit = "Please enter a unit"
    case jobTitle = "Please enter a job title"
    case startDate = "Please enter a start date"
    case endDate = "Please enter an end date"
    case helpIssue = "Please enter a issue"
    case jobName = "Please enter a job name"
    case weeklyPay = "Please enter a weekly pay"
    case jobDescription = "Please enter a job description"
    case speciality = "Please select speciality"
    case jobLocation = "Please select job loation"
    case workDuration = "Please select work duration"

    
    
    case comingSoon = "Coming soon."
    
}


