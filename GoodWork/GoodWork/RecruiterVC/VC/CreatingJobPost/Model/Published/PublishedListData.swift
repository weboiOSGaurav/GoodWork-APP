
import Foundation
struct PublishedListData : Codable {
	let workers_applied : Int?
	let job_title : String?
	let job_filter : String?
	let job_id : String?
	let id : String?
	let job_name : String?
	let job_location : String?
	let preferred_specialty : Int?
	let preferred_assignment_duration : Int?
	let preferred_shift : String?
	let preferred_shift_duration : String?
	let preferred_work_location : Int?
	let preferred_work_area : String?
	let preferred_days_of_the_week : String?
	let preferred_hourly_pay_rate : String?
	let preferred_experience : String?
	let description : String?
	let start_date : String?
	let end_date : String?
	let created_at : String?
	let updated_at : String?
	let deleted_at : String?
	let auto_offers : String?
	let created_by : String?
	let slug : String?
	let active : Int?
	let facility_id : String?
	let job_video : String?
	let seniority_level : String?
	let job_function : String?
	let responsibilities : String?
	let qualifications : String?
	let job_cerner_exp : String?
	let job_meditech_exp : String?
	let job_epic_exp : String?
	let job_other_exp : String?
	let job_photos : String?
	let video_embed_url : String?
	let is_open : Int?
	let license_type : String?
	let call_coverage : String?
	let weekly_pay : String?
	let hours_per_week : String?
	let job_type : Int?
	let recruiter_id : String?
	let offer_id : String?
	let nurse_id : String?
	let assignment_duration_definition : String?
	let preferred_specialty_definition : String?

	enum CodingKeys: String, CodingKey {

		case workers_applied = "workers_applied"
		case job_title = "job_title"
		case job_filter = "job_filter"
		case job_id = "job_id"
		case id = "id"
		case job_name = "job_name"
		case job_location = "job_location"
		case preferred_specialty = "preferred_specialty"
		case preferred_assignment_duration = "preferred_assignment_duration"
		case preferred_shift = "preferred_shift"
		case preferred_shift_duration = "preferred_shift_duration"
		case preferred_work_location = "preferred_work_location"
		case preferred_work_area = "preferred_work_area"
		case preferred_days_of_the_week = "preferred_days_of_the_week"
		case preferred_hourly_pay_rate = "preferred_hourly_pay_rate"
		case preferred_experience = "preferred_experience"
		case description = "description"
		case start_date = "start_date"
		case end_date = "end_date"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case deleted_at = "deleted_at"
		case auto_offers = "auto_offers"
		case created_by = "created_by"
		case slug = "slug"
		case active = "active"
		case facility_id = "facility_id"
		case job_video = "job_video"
		case seniority_level = "seniority_level"
		case job_function = "job_function"
		case responsibilities = "responsibilities"
		case qualifications = "qualifications"
		case job_cerner_exp = "job_cerner_exp"
		case job_meditech_exp = "job_meditech_exp"
		case job_epic_exp = "job_epic_exp"
		case job_other_exp = "job_other_exp"
		case job_photos = "job_photos"
		case video_embed_url = "video_embed_url"
		case is_open = "is_open"
		case license_type = "license_type"
		case call_coverage = "call_coverage"
		case weekly_pay = "weekly_pay"
		case hours_per_week = "hours_per_week"
		case job_type = "job_type"
		case recruiter_id = "recruiter_id"
		case offer_id = "offer_id"
		case nurse_id = "nurse_id"
		case assignment_duration_definition = "assignment_duration_definition"
		case preferred_specialty_definition = "preferred_specialty_definition"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		workers_applied = try values.decodeIfPresent(Int.self, forKey: .workers_applied)
		job_title = try values.decodeIfPresent(String.self, forKey: .job_title)
		job_filter = try values.decodeIfPresent(String.self, forKey: .job_filter)
		job_id = try values.decodeIfPresent(String.self, forKey: .job_id)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		job_name = try values.decodeIfPresent(String.self, forKey: .job_name)
		job_location = try values.decodeIfPresent(String.self, forKey: .job_location)
		preferred_specialty = try values.decodeIfPresent(Int.self, forKey: .preferred_specialty)
		preferred_assignment_duration = try values.decodeIfPresent(Int.self, forKey: .preferred_assignment_duration)
		preferred_shift = try values.decodeIfPresent(String.self, forKey: .preferred_shift)
		preferred_shift_duration = try values.decodeIfPresent(String.self, forKey: .preferred_shift_duration)
		preferred_work_location = try values.decodeIfPresent(Int.self, forKey: .preferred_work_location)
		preferred_work_area = try values.decodeIfPresent(String.self, forKey: .preferred_work_area)
		preferred_days_of_the_week = try values.decodeIfPresent(String.self, forKey: .preferred_days_of_the_week)
		preferred_hourly_pay_rate = try values.decodeIfPresent(String.self, forKey: .preferred_hourly_pay_rate)
		preferred_experience = try values.decodeIfPresent(String.self, forKey: .preferred_experience)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
		end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
		auto_offers = try values.decodeIfPresent(String.self, forKey: .auto_offers)
		created_by = try values.decodeIfPresent(String.self, forKey: .created_by)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		active = try values.decodeIfPresent(Int.self, forKey: .active)
		facility_id = try values.decodeIfPresent(String.self, forKey: .facility_id)
		job_video = try values.decodeIfPresent(String.self, forKey: .job_video)
		seniority_level = try values.decodeIfPresent(String.self, forKey: .seniority_level)
		job_function = try values.decodeIfPresent(String.self, forKey: .job_function)
		responsibilities = try values.decodeIfPresent(String.self, forKey: .responsibilities)
		qualifications = try values.decodeIfPresent(String.self, forKey: .qualifications)
		job_cerner_exp = try values.decodeIfPresent(String.self, forKey: .job_cerner_exp)
		job_meditech_exp = try values.decodeIfPresent(String.self, forKey: .job_meditech_exp)
		job_epic_exp = try values.decodeIfPresent(String.self, forKey: .job_epic_exp)
		job_other_exp = try values.decodeIfPresent(String.self, forKey: .job_other_exp)
		job_photos = try values.decodeIfPresent(String.self, forKey: .job_photos)
		video_embed_url = try values.decodeIfPresent(String.self, forKey: .video_embed_url)
		is_open = try values.decodeIfPresent(Int.self, forKey: .is_open)
		license_type = try values.decodeIfPresent(String.self, forKey: .license_type)
		call_coverage = try values.decodeIfPresent(String.self, forKey: .call_coverage)
		weekly_pay = try values.decodeIfPresent(String.self, forKey: .weekly_pay)
		hours_per_week = try values.decodeIfPresent(String.self, forKey: .hours_per_week)
		job_type = try values.decodeIfPresent(Int.self, forKey: .job_type)
		recruiter_id = try values.decodeIfPresent(String.self, forKey: .recruiter_id)
		offer_id = try values.decodeIfPresent(String.self, forKey: .offer_id)
		nurse_id = try values.decodeIfPresent(String.self, forKey: .nurse_id)
		assignment_duration_definition = try values.decodeIfPresent(String.self, forKey: .assignment_duration_definition)
		preferred_specialty_definition = try values.decodeIfPresent(String.self, forKey: .preferred_specialty_definition)
	}

}
