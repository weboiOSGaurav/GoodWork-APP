/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Recently_added : Codable {
    
    let keyword_title : String?
	let keyword_id : Int?
	let job_title : String?
	let job_filter : String?
	let offer_id : String?
	let job_id : String?
	let job_type : Int?
	let job_name : String?
	let job_location : String?
	let weekly_pay : Int?
	let hours_per_week : Int?
	let preferred_specialty : Int?
	let preferred_specialty_definition : String?
	let preferred_assignment_duration : Int?
	let preferred_assignment_duration_definition : String?
	let preferred_shift_duration : Int?
	let preferred_shift_duration_definition : String?
	let preferred_work_location : Int?
	let preferred_work_location_definition : String?
	let preferred_work_area : String?
	let preferred_days_of_the_week : [String]?
	let preferred_hourly_pay_rate : String?
	let preferred_experience : String?
	let description : String?
	let created_at : String?
	let created_at_definition : String?
	let updated_at : String?
	let deleted_at : String?
	let created_by : String?
	let slug : String?
	let active : Int?
	let facility_id : String?
	let job_video : String?
	let seniority_level : Int?
	let seniority_level_definition : String?
	let job_function : Int?
	let job_function_definition : String?
	let responsibilities : String?
	let qualifications : String?
	let job_cerner_exp : Int?
	let job_cerner_exp_definition : String?
	var job_meditech_exp : Int?
	let job_meditech_exp_definition : String?
	let job_epic_exp : Int?
	let job_epic_exp_definition : String?
	let job_other_exp : String?
	let video_embed_url : String?
	let is_open : Int?
	let name : String?
	let address : String?
	let city : String?
	let state : String?
	let postcode : String?
	let type : String?
	let facility_logo : String?
	let facility_email : String?
	let facility_phone : String?
	let specialty_need : String?
	let cno_message : String?
	let cno_image : String?
	let gallary_images : String?
	let video : String?
	let facebook : String?
	let twitter : String?
	let linkedin : String?
	let instagram : String?
	let pinterest : String?
	let tiktok : String?
	let sanpchat : String?
	let youtube : String?
	let about_facility : String?
	let facility_website : String?
	let f_lat : String?
	let f_lang : String?
	let f_emr : String?
	let f_emr_other : String?
	let f_bcheck_provider : String?
	let f_bcheck_provider_other : String?
	let nurse_cred_soft : String?
	let nurse_cred_soft_other : String?
	let nurse_scheduling_sys : String?
	let nurse_scheduling_sys_other : String?
	let time_attend_sys : String?
	let time_attend_sys_other : String?
	let licensed_beds : String?
	let trauma_designation : String?
	let total_applied : String?
	let is_applied : String?
	let is_liked : String?
	let shift : String?
	let start_date : String?
	let applied_nurses : String?
	let nurses_applied : [String]?
	var is_saved : String?
	//let popular_jobs : [Popular_jobs]?

	enum CodingKeys: String, CodingKey {

		case keyword_id = "keyword_id"
		case job_title = "job_title"
		case job_filter = "job_filter"
		case offer_id = "offer_id"
		case job_id = "job_id"
		case job_type = "job_type"
		case job_name = "job_name"
		case job_location = "job_location"
		case weekly_pay = "weekly_pay"
		case hours_per_week = "hours_per_week"
		case preferred_specialty = "preferred_specialty"
		case preferred_specialty_definition = "preferred_specialty_definition"
		case preferred_assignment_duration = "preferred_assignment_duration"
		case preferred_assignment_duration_definition = "preferred_assignment_duration_definition"
		case preferred_shift_duration = "preferred_shift_duration"
		case preferred_shift_duration_definition = "preferred_shift_duration_definition"
		case preferred_work_location = "preferred_work_location"
		case preferred_work_location_definition = "preferred_work_location_definition"
		case preferred_work_area = "preferred_work_area"
		case preferred_days_of_the_week = "preferred_days_of_the_week"
		case preferred_hourly_pay_rate = "preferred_hourly_pay_rate"
		case preferred_experience = "preferred_experience"
		case description = "description"
		case created_at = "created_at"
		case created_at_definition = "created_at_definition"
		case updated_at = "updated_at"
		case deleted_at = "deleted_at"
		case created_by = "created_by"
		case slug = "slug"
		case active = "active"
		case facility_id = "facility_id"
		case job_video = "job_video"
		case seniority_level = "seniority_level"
		case seniority_level_definition = "seniority_level_definition"
		case job_function = "job_function"
		case job_function_definition = "job_function_definition"
		case responsibilities = "responsibilities"
		case qualifications = "qualifications"
		case job_cerner_exp = "job_cerner_exp"
		case job_cerner_exp_definition = "job_cerner_exp_definition"
		case job_meditech_exp = "job_meditech_exp"
		case job_meditech_exp_definition = "job_meditech_exp_definition"
		case job_epic_exp = "job_epic_exp"
		case job_epic_exp_definition = "job_epic_exp_definition"
		case job_other_exp = "job_other_exp"
		case video_embed_url = "video_embed_url"
		case is_open = "is_open"
		case name = "name"
		case address = "address"
		case city = "city"
		case state = "state"
		case postcode = "postcode"
		case type = "type"
		case facility_logo = "facility_logo"
		case facility_email = "facility_email"
		case facility_phone = "facility_phone"
		case specialty_need = "specialty_need"
		case cno_message = "cno_message"
		case cno_image = "cno_image"
		case gallary_images = "gallary_images"
		case video = "video"
		case facebook = "facebook"
		case twitter = "twitter"
		case linkedin = "linkedin"
		case instagram = "instagram"
		case pinterest = "pinterest"
		case tiktok = "tiktok"
		case sanpchat = "sanpchat"
		case youtube = "youtube"
		case about_facility = "about_facility"
		case facility_website = "facility_website"
		case f_lat = "f_lat"
		case f_lang = "f_lang"
		case f_emr = "f_emr"
		case f_emr_other = "f_emr_other"
		case f_bcheck_provider = "f_bcheck_provider"
		case f_bcheck_provider_other = "f_bcheck_provider_other"
		case nurse_cred_soft = "nurse_cred_soft"
		case nurse_cred_soft_other = "nurse_cred_soft_other"
		case nurse_scheduling_sys = "nurse_scheduling_sys"
		case nurse_scheduling_sys_other = "nurse_scheduling_sys_other"
		case time_attend_sys = "time_attend_sys"
		case time_attend_sys_other = "time_attend_sys_other"
		case licensed_beds = "licensed_beds"
		case trauma_designation = "trauma_designation"
		case total_applied = "total_applied"
		case is_applied = "is_applied"
		case is_liked = "is_liked"
		case shift = "shift"
		case start_date = "start_date"
		case applied_nurses = "applied_nurses"
		case nurses_applied = "nurses_applied"
		case is_saved = "is_saved"
        case keyword_title = "keyword_title"
        
	//	case popular_jobs = "popular_jobs"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
//		keyword_id = try values.decodeIfPresent(Int.self, forKey: .keyword_id)
        
        if let keyword_id_Test = try? values.decodeIfPresent(String.self, forKey: .keyword_id){
            keyword_id = Int(keyword_id_Test) ?? 0
        }else{
            keyword_id = try values.decodeIfPresent(Int.self, forKey: .keyword_id)
        }
        
		job_title = try values.decodeIfPresent(String.self, forKey: .job_title)
		job_filter = try values.decodeIfPresent(String.self, forKey: .job_filter)
		offer_id = try values.decodeIfPresent(String.self, forKey: .offer_id)
		job_id = try values.decodeIfPresent(String.self, forKey: .job_id)
//		job_type = try values.decodeIfPresent(Int.self, forKey: .job_type)
        
        if let job_type_Test = try? values.decodeIfPresent(String.self, forKey: .job_type){
            job_type = Int(job_type_Test) ?? 0
        }else{
            job_type = try values.decodeIfPresent(Int.self, forKey: .job_type)
        }
		job_name = try values.decodeIfPresent(String.self, forKey: .job_name)
		job_location = try values.decodeIfPresent(String.self, forKey: .job_location)
//		weekly_pay = try values.decodeIfPresent(Int.self, forKey: .weekly_pay)
        
        if let weekly_payy = try? values.decodeIfPresent(String.self, forKey: .weekly_pay){
            weekly_pay = Int(weekly_payy) ?? 0
        }else{
            weekly_pay = try values.decodeIfPresent(Int.self, forKey: .weekly_pay)
        }
        
//		hours_per_week = try values.decodeIfPresent(Int.self, forKey: .hours_per_week)
        
        if let hours_per_weekk = try? values.decodeIfPresent(String.self, forKey: .hours_per_week){
            hours_per_week = Int(hours_per_weekk) ?? 0
        }else{
            hours_per_week = try values.decodeIfPresent(Int.self, forKey: .hours_per_week)
        }
        
		preferred_specialty = try values.decodeIfPresent(Int.self, forKey: .preferred_specialty)
		preferred_specialty_definition = try values.decodeIfPresent(String.self, forKey: .preferred_specialty_definition)
		preferred_assignment_duration = try values.decodeIfPresent(Int.self, forKey: .preferred_assignment_duration)
		preferred_assignment_duration_definition = try values.decodeIfPresent(String.self, forKey: .preferred_assignment_duration_definition)
		//preferred_shift_duration = try values.decodeIfPresent(Int.self, forKey: .preferred_shift_duration)
        
        if let preferred_shift_test = try? values.decodeIfPresent(String.self, forKey: .preferred_shift_duration){
            preferred_shift_duration = Int(preferred_shift_test)
        }else{
            preferred_shift_duration = try values.decodeIfPresent(Int.self, forKey: .preferred_shift_duration)
        }
        
		preferred_shift_duration_definition = try values.decodeIfPresent(String.self, forKey: .preferred_shift_duration_definition)
		preferred_work_location = try values.decodeIfPresent(Int.self, forKey: .preferred_work_location)
		preferred_work_location_definition = try values.decodeIfPresent(String.self, forKey: .preferred_work_location_definition)
		preferred_work_area = try values.decodeIfPresent(String.self, forKey: .preferred_work_area)
		preferred_days_of_the_week = try values.decodeIfPresent([String].self, forKey: .preferred_days_of_the_week)
		preferred_hourly_pay_rate = try values.decodeIfPresent(String.self, forKey: .preferred_hourly_pay_rate)
		preferred_experience = try values.decodeIfPresent(String.self, forKey: .preferred_experience)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		created_at_definition = try values.decodeIfPresent(String.self, forKey: .created_at_definition)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
		created_by = try values.decodeIfPresent(String.self, forKey: .created_by)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		active = try values.decodeIfPresent(Int.self, forKey: .active)
		facility_id = try values.decodeIfPresent(String.self, forKey: .facility_id)
		job_video = try values.decodeIfPresent(String.self, forKey: .job_video)
		
//        seniority_level = try values.decodeIfPresent(Int.self, forKey: .seniority_level)d
        
        if let seniority_level_test = try? values.decodeIfPresent(String.self, forKey: .seniority_level){
            seniority_level = Int(seniority_level_test)
        }else{
            seniority_level = try values.decodeIfPresent(Int.self, forKey: .seniority_level)
        }
        
		seniority_level_definition = try values.decodeIfPresent(String.self, forKey: .seniority_level_definition)
//		job_function = try values.decodeIfPresent(Int.self, forKey: .job_function)
        
        if let job_function_test = try? values.decodeIfPresent(String.self, forKey: .job_function){
            job_function = Int(job_function_test)
        }else{
            job_function = try values.decodeIfPresent(Int.self, forKey: .job_function)
        }
        
		job_function_definition = try values.decodeIfPresent(String.self, forKey: .job_function_definition)
		responsibilities = try values.decodeIfPresent(String.self, forKey: .responsibilities)
		qualifications = try values.decodeIfPresent(String.self, forKey: .qualifications)
//		job_cerner_exp = try values.decodeIfPresent(Int.self, forKey: .job_cerner_exp)
        
        if let job_cerner_exp_test = try? values.decodeIfPresent(String.self, forKey: .job_cerner_exp){
            job_cerner_exp = Int(job_cerner_exp_test)
        }else{
            job_cerner_exp = try values.decodeIfPresent(Int.self, forKey: .job_cerner_exp)
        }
        
		job_cerner_exp_definition = try values.decodeIfPresent(String.self, forKey: .job_cerner_exp_definition)
        //job_meditech_exp = try values.decodeIfPresent(Int.self, forKey: .job_meditech_exp)
        
        if let job_meditech_exp_test = try? values.decodeIfPresent(String.self, forKey: .job_meditech_exp){
            job_meditech_exp = Int(job_meditech_exp_test)
        }else{
            job_meditech_exp = try values.decodeIfPresent(Int.self, forKey: .job_meditech_exp)
        }
        
		job_meditech_exp_definition = try values.decodeIfPresent(String.self, forKey: .job_meditech_exp_definition)
		
//        job_epic_exp = try values.decodeIfPresent(Int.self, forKey: .job_epic_exp)
        
        if let job_epic_exp_test = try? values.decodeIfPresent(String.self, forKey: .job_epic_exp){
            job_epic_exp = Int(job_epic_exp_test)
        }else{
            job_epic_exp = try values.decodeIfPresent(Int.self, forKey: .job_epic_exp)
        }
        
		job_epic_exp_definition = try values.decodeIfPresent(String.self, forKey: .job_epic_exp_definition)
		job_other_exp = try values.decodeIfPresent(String.self, forKey: .job_other_exp)
		video_embed_url = try values.decodeIfPresent(String.self, forKey: .video_embed_url)
		is_open = try values.decodeIfPresent(Int.self, forKey: .is_open)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
		//type = try values.decodeIfPresent(Int.self, forKey: .type)
        
        if let type_test = try? values.decodeIfPresent(Int.self, forKey: .type){
            type = String(type_test)
        }else{
            type = try values.decodeIfPresent(String.self, forKey: .type)
        }
        
		facility_logo = try values.decodeIfPresent(String.self, forKey: .facility_logo)
		facility_email = try values.decodeIfPresent(String.self, forKey: .facility_email)
		facility_phone = try values.decodeIfPresent(String.self, forKey: .facility_phone)
		specialty_need = try values.decodeIfPresent(String.self, forKey: .specialty_need)
		cno_message = try values.decodeIfPresent(String.self, forKey: .cno_message)
		cno_image = try values.decodeIfPresent(String.self, forKey: .cno_image)
		gallary_images = try values.decodeIfPresent(String.self, forKey: .gallary_images)
		video = try values.decodeIfPresent(String.self, forKey: .video)
		facebook = try values.decodeIfPresent(String.self, forKey: .facebook)
		twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
		linkedin = try values.decodeIfPresent(String.self, forKey: .linkedin)
		instagram = try values.decodeIfPresent(String.self, forKey: .instagram)
		pinterest = try values.decodeIfPresent(String.self, forKey: .pinterest)
		tiktok = try values.decodeIfPresent(String.self, forKey: .tiktok)
		sanpchat = try values.decodeIfPresent(String.self, forKey: .sanpchat)
		youtube = try values.decodeIfPresent(String.self, forKey: .youtube)
		about_facility = try values.decodeIfPresent(String.self, forKey: .about_facility)
		facility_website = try values.decodeIfPresent(String.self, forKey: .facility_website)
		f_lat = try values.decodeIfPresent(String.self, forKey: .f_lat)
		f_lang = try values.decodeIfPresent(String.self, forKey: .f_lang)
		f_emr = try values.decodeIfPresent(String.self, forKey: .f_emr)
		f_emr_other = try values.decodeIfPresent(String.self, forKey: .f_emr_other)
		f_bcheck_provider = try values.decodeIfPresent(String.self, forKey: .f_bcheck_provider)
		f_bcheck_provider_other = try values.decodeIfPresent(String.self, forKey: .f_bcheck_provider_other)
		nurse_cred_soft = try values.decodeIfPresent(String.self, forKey: .nurse_cred_soft)
		nurse_cred_soft_other = try values.decodeIfPresent(String.self, forKey: .nurse_cred_soft_other)
		nurse_scheduling_sys = try values.decodeIfPresent(String.self, forKey: .nurse_scheduling_sys)
		nurse_scheduling_sys_other = try values.decodeIfPresent(String.self, forKey: .nurse_scheduling_sys_other)
		time_attend_sys = try values.decodeIfPresent(String.self, forKey: .time_attend_sys)
		time_attend_sys_other = try values.decodeIfPresent(String.self, forKey: .time_attend_sys_other)
		licensed_beds = try values.decodeIfPresent(String.self, forKey: .licensed_beds)
		trauma_designation = try values.decodeIfPresent(String.self, forKey: .trauma_designation)
		total_applied = try values.decodeIfPresent(String.self, forKey: .total_applied)
		is_applied = try values.decodeIfPresent(String.self, forKey: .is_applied)
		is_liked = try values.decodeIfPresent(String.self, forKey: .is_liked)
		shift = try values.decodeIfPresent(String.self, forKey: .shift)
		start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
		applied_nurses = try values.decodeIfPresent(String.self, forKey: .applied_nurses)
		nurses_applied = try values.decodeIfPresent([String].self, forKey: .nurses_applied)
	//	is_saved = try values.decodeIfPresent(String.self, forKey: .is_saved)
//		popular_jobs = try values.decodeIfPresent([Popular_jobs].self, forKey: .popular_jobs)
        
        if let type_test = try? values.decodeIfPresent(Int.self, forKey: .is_saved){
            is_saved = String(type_test)
        }else{
            is_saved = try values.decodeIfPresent(String.self, forKey: .is_saved)
        }
        
        keyword_title = try values.decodeIfPresent(String.self, forKey: .keyword_title)
	}
}
