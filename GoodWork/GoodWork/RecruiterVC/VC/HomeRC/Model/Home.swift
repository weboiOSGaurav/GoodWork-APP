
import Foundation

struct Home : Codable {
    let api_status : String?
    let message : String?
    let data : HomeData?

    enum CodingKeys: String, CodingKey {

        case api_status = "api_status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        api_status = try values.decodeIfPresent(String.self, forKey: .api_status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(HomeData.self, forKey: .data)
    }

}
