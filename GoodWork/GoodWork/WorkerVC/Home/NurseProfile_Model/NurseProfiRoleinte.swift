/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NurseProfileRole_interest : Codable {
	let nu_video_embed_url : String?
	let nu_video_embed_url_definition : String?
	let serving_preceptor : String?
	let serving_preceptor_definition : String?
	let serving_interim_nurse_leader : String?
	let serving_interim_nurse_leader_definition : String?
	let clinical_educator : String?
	let clinical_educator_definition : String?
	let is_daisy_award_winner : String?
	let is_daisy_award_winner_definition : String?
	let employee_of_the_mth_qtr_yr : String?
	let employee_of_the_mth_qtr_yr_definition : String?
	let other_nursing_awards : String?
	let other_nursing_awards_definition : String?
	let is_professional_practice_council : String?
	let is_professional_practice_council_definition : String?
	let is_research_publications : String?
	let is_research_publications_definition : String?
	let leadership_roles : String?
	let leadership_roles_definition : String?
	let summary : String?
	let languages : [String]?
	let additional_files : [String]?
	let additional_pictures : [String]?

	enum CodingKeys: String, CodingKey {

		case nu_video_embed_url = "nu_video_embed_url"
		case nu_video_embed_url_definition = "nu_video_embed_url_definition"
		case serving_preceptor = "serving_preceptor"
		case serving_preceptor_definition = "serving_preceptor_definition"
		case serving_interim_nurse_leader = "serving_interim_nurse_leader"
		case serving_interim_nurse_leader_definition = "serving_interim_nurse_leader_definition"
		case clinical_educator = "clinical_educator"
		case clinical_educator_definition = "clinical_educator_definition"
		case is_daisy_award_winner = "is_daisy_award_winner"
		case is_daisy_award_winner_definition = "is_daisy_award_winner_definition"
		case employee_of_the_mth_qtr_yr = "employee_of_the_mth_qtr_yr"
		case employee_of_the_mth_qtr_yr_definition = "employee_of_the_mth_qtr_yr_definition"
		case other_nursing_awards = "other_nursing_awards"
		case other_nursing_awards_definition = "other_nursing_awards_definition"
		case is_professional_practice_council = "is_professional_practice_council"
		case is_professional_practice_council_definition = "is_professional_practice_council_definition"
		case is_research_publications = "is_research_publications"
		case is_research_publications_definition = "is_research_publications_definition"
		case leadership_roles = "leadership_roles"
		case leadership_roles_definition = "leadership_roles_definition"
		case summary = "summary"
		case languages = "languages"
		case additional_files = "additional_files"
		case additional_pictures = "additional_pictures"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		nu_video_embed_url = try values.decodeIfPresent(String.self, forKey: .nu_video_embed_url)
		nu_video_embed_url_definition = try values.decodeIfPresent(String.self, forKey: .nu_video_embed_url_definition)
		serving_preceptor = try values.decodeIfPresent(String.self, forKey: .serving_preceptor)
		serving_preceptor_definition = try values.decodeIfPresent(String.self, forKey: .serving_preceptor_definition)
		serving_interim_nurse_leader = try values.decodeIfPresent(String.self, forKey: .serving_interim_nurse_leader)
		serving_interim_nurse_leader_definition = try values.decodeIfPresent(String.self, forKey: .serving_interim_nurse_leader_definition)
		clinical_educator = try values.decodeIfPresent(String.self, forKey: .clinical_educator)
		clinical_educator_definition = try values.decodeIfPresent(String.self, forKey: .clinical_educator_definition)
		is_daisy_award_winner = try values.decodeIfPresent(String.self, forKey: .is_daisy_award_winner)
		is_daisy_award_winner_definition = try values.decodeIfPresent(String.self, forKey: .is_daisy_award_winner_definition)
		employee_of_the_mth_qtr_yr = try values.decodeIfPresent(String.self, forKey: .employee_of_the_mth_qtr_yr)
		employee_of_the_mth_qtr_yr_definition = try values.decodeIfPresent(String.self, forKey: .employee_of_the_mth_qtr_yr_definition)
		other_nursing_awards = try values.decodeIfPresent(String.self, forKey: .other_nursing_awards)
		other_nursing_awards_definition = try values.decodeIfPresent(String.self, forKey: .other_nursing_awards_definition)
		is_professional_practice_council = try values.decodeIfPresent(String.self, forKey: .is_professional_practice_council)
		is_professional_practice_council_definition = try values.decodeIfPresent(String.self, forKey: .is_professional_practice_council_definition)
		is_research_publications = try values.decodeIfPresent(String.self, forKey: .is_research_publications)
		is_research_publications_definition = try values.decodeIfPresent(String.self, forKey: .is_research_publications_definition)
		leadership_roles = try values.decodeIfPresent(String.self, forKey: .leadership_roles)
		leadership_roles_definition = try values.decodeIfPresent(String.self, forKey: .leadership_roles_definition)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		languages = try values.decodeIfPresent([String].self, forKey: .languages)
		additional_files = try values.decodeIfPresent([String].self, forKey: .additional_files)
		additional_pictures = try values.decodeIfPresent([String].self, forKey: .additional_pictures)
	}

}
