

import Foundation
struct ApplicantTypeListData : Codable {
	let name : String?
	let applicants : Int?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case applicants = "applicants"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		applicants = try values.decodeIfPresent(Int.self, forKey: .applicants)
	}

}
