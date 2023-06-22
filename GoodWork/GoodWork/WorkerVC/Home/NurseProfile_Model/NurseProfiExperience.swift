/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct NurseProfileExperience : Codable {
	let experience_id : String?
	let type : Int?
	let type_definition : String?
	let position_title : String?
	let unit : String?
	let start_date : String?
	let end_date : String?
	let is_current_job : String?

	enum CodingKeys: String, CodingKey {

		case experience_id = "experience_id"
		case type = "type"
		case type_definition = "type_definition"
		case position_title = "position_title"
		case unit = "unit"
		case start_date = "start_date"
		case end_date = "end_date"
		case is_current_job = "is_current_job"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		experience_id = try values.decodeIfPresent(String.self, forKey: .experience_id)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
		type_definition = try values.decodeIfPresent(String.self, forKey: .type_definition)
		position_title = try values.decodeIfPresent(String.self, forKey: .position_title)
		unit = try values.decodeIfPresent(String.self, forKey: .unit)
		start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
		end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
		is_current_job = try values.decodeIfPresent(String.self, forKey: .is_current_job)
	}

}
