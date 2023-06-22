/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AccountInfoDataRC : Codable {
	let id : String?
	let first_name : String?
	let last_name : String?
	let email : String?
	let user_name : String?
	let mobile : String?
	let fcm_token : String?
	let facilty_id : String?
	let facility_name : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case first_name = "first_name"
		case last_name = "last_name"
		case email = "email"
		case user_name = "user_name"
		case mobile = "mobile"
		case fcm_token = "fcm_token"
		case facilty_id = "facilty_id"
		case facility_name = "facility_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
		facilty_id = try values.decodeIfPresent(String.self, forKey: .facilty_id)
		facility_name = try values.decodeIfPresent([String].self, forKey: .facility_name)
	}

}
