/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data11 : Codable {
	let id : String?
	let nurse_id : String?
	let role : String?
	let fcm_token : String?
	let fullName : String?
	let date_of_birth : String?
	let driving_license : String?
	let security_number : String?
	let email_notification : String?
	let sms_notification : String?
	let first_name : String?
	let last_name : String?
	let email : String?
	let image : String?
	let mobile : String?
	let nursing_license_state : String?
	let nursing_license_number : String?
	let specialty : [Specialty11]?
	let work_location : String?
	let work_location_definition : String?
	let address : String?
	let search_status : String?
	let search_status_definition : String?
	let license_type : String?
	let license_type_definition : String?
	let license_status : String?
	let license_status_definition : String?
	let license_expiry_date : String?
	let license_issue_date : String?
	let license_renewal_date : String?
	let city : String?
	let state : String?
	let postcode : String?
	let country : String?
	let hourly_pay_rate : String?
	let shift_duration : String?
	let shift_duration_definition : String?
	let assignment_duration : String?
	let assignment_duration_definition : String?
	let preferred_shift : String?
	let preferred_shift_definition : String?
	let days_of_the_week : [String]?
	let earliest_start_date : String?
	let profile_detail_flag : String?
	let hourly_rate_and_avail_flag : String?
	let unavailable_dates : [String]?
	//let experience : [String]?
	//let certitficate : [String]?
	let resume : String?
	let role_interest : Role_interest11?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case nurse_id = "nurse_id"
		case role = "role"
		case fcm_token = "fcm_token"
		case fullName = "fullName"
		case date_of_birth = "date_of_birth"
		case driving_license = "driving_license"
		case security_number = "security_number"
		case email_notification = "email_notification"
		case sms_notification = "sms_notification"
		case first_name = "first_name"
		case last_name = "last_name"
		case email = "email"
		case image = "image"
		case mobile = "mobile"
		case nursing_license_state = "nursing_license_state"
		case nursing_license_number = "nursing_license_number"
		case specialty = "specialty"
		case work_location = "work_location"
		case work_location_definition = "work_location_definition"
		case address = "address"
		case search_status = "search_status"
		case search_status_definition = "search_status_definition"
		case license_type = "license_type"
		case license_type_definition = "license_type_definition"
		case license_status = "license_status"
		case license_status_definition = "license_status_definition"
		case license_expiry_date = "license_expiry_date"
		case license_issue_date = "license_issue_date"
		case license_renewal_date = "license_renewal_date"
		case city = "city"
		case state = "state"
		case postcode = "postcode"
		case country = "country"
		case hourly_pay_rate = "hourly_pay_rate"
		case shift_duration = "shift_duration"
		case shift_duration_definition = "shift_duration_definition"
		case assignment_duration = "assignment_duration"
		case assignment_duration_definition = "assignment_duration_definition"
		case preferred_shift = "preferred_shift"
		case preferred_shift_definition = "preferred_shift_definition"
		case days_of_the_week = "days_of_the_week"
		case earliest_start_date = "earliest_start_date"
		case profile_detail_flag = "profile_detail_flag"
		case hourly_rate_and_avail_flag = "hourly_rate_and_avail_flag"
		case unavailable_dates = "unavailable_dates"
		//case experience = "experience"
		//case certitficate = "certitficate"
		case resume = "resume"
		case role_interest = "role_interest"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		nurse_id = try values.decodeIfPresent(String.self, forKey: .nurse_id)
		role = try values.decodeIfPresent(String.self, forKey: .role)
		fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
		driving_license = try values.decodeIfPresent(String.self, forKey: .driving_license)
		security_number = try values.decodeIfPresent(String.self, forKey: .security_number)
		email_notification = try values.decodeIfPresent(String.self, forKey: .email_notification)
		sms_notification = try values.decodeIfPresent(String.self, forKey: .sms_notification)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		nursing_license_state = try values.decodeIfPresent(String.self, forKey: .nursing_license_state)
		nursing_license_number = try values.decodeIfPresent(String.self, forKey: .nursing_license_number)
		specialty = try values.decodeIfPresent([Specialty11].self, forKey: .specialty)
		work_location = try values.decodeIfPresent(String.self, forKey: .work_location)
		work_location_definition = try values.decodeIfPresent(String.self, forKey: .work_location_definition)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		search_status = try values.decodeIfPresent(String.self, forKey: .search_status)
		search_status_definition = try values.decodeIfPresent(String.self, forKey: .search_status_definition)
		license_type = try values.decodeIfPresent(String.self, forKey: .license_type)
		license_type_definition = try values.decodeIfPresent(String.self, forKey: .license_type_definition)
		license_status = try values.decodeIfPresent(String.self, forKey: .license_status)
		license_status_definition = try values.decodeIfPresent(String.self, forKey: .license_status_definition)
		license_expiry_date = try values.decodeIfPresent(String.self, forKey: .license_expiry_date)
		license_issue_date = try values.decodeIfPresent(String.self, forKey: .license_issue_date)
		license_renewal_date = try values.decodeIfPresent(String.self, forKey: .license_renewal_date)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		hourly_pay_rate = try values.decodeIfPresent(String.self, forKey: .hourly_pay_rate)
		shift_duration = try values.decodeIfPresent(String.self, forKey: .shift_duration)
		shift_duration_definition = try values.decodeIfPresent(String.self, forKey: .shift_duration_definition)
		assignment_duration = try values.decodeIfPresent(String.self, forKey: .assignment_duration)
		assignment_duration_definition = try values.decodeIfPresent(String.self, forKey: .assignment_duration_definition)
		preferred_shift = try values.decodeIfPresent(String.self, forKey: .preferred_shift)
		preferred_shift_definition = try values.decodeIfPresent(String.self, forKey: .preferred_shift_definition)
		days_of_the_week = try values.decodeIfPresent([String].self, forKey: .days_of_the_week)
		earliest_start_date = try values.decodeIfPresent(String.self, forKey: .earliest_start_date)
		profile_detail_flag = try values.decodeIfPresent(String.self, forKey: .profile_detail_flag)
		hourly_rate_and_avail_flag = try values.decodeIfPresent(String.self, forKey: .hourly_rate_and_avail_flag)
		unavailable_dates = try values.decodeIfPresent([String].self, forKey: .unavailable_dates)
		//experience = try values.decodeIfPresent([String].self, forKey: .experience)
		//certitficate = try values.decodeIfPresent([String].self, forKey: .certitficate)
		resume = try values.decodeIfPresent(String.self, forKey: .resume)
		role_interest = try values.decodeIfPresent(Role_interest11.self, forKey: .role_interest)
	}

}
