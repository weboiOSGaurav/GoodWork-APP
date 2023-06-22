import Foundation
struct HomeData : Codable {
    let permanent_jobs : Int?
    let travel_jobs : Int?
    let perdiem_jobs : Int?
    let local_jobs : Int?
    let notification : [HomeNotification]?
    let new : Int?
    let offered : Int?
    let onboard : Int?
    let working : Int?
    let done : Int?

    enum CodingKeys: String, CodingKey {

        case permanent_jobs = "permanent_jobs"
        case travel_jobs = "travel_jobs"
        case perdiem_jobs = "perdiem_jobs"
        case local_jobs = "local_jobs"
        case notification = "Notification"
        case new = "New"
        case offered = "Offered"
        case onboard = "Onboard"
        case working = "Working"
        case done = "Done"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        permanent_jobs = try values.decodeIfPresent(Int.self, forKey: .permanent_jobs)
        travel_jobs = try values.decodeIfPresent(Int.self, forKey: .travel_jobs)
        perdiem_jobs = try values.decodeIfPresent(Int.self, forKey: .perdiem_jobs)
        local_jobs = try values.decodeIfPresent(Int.self, forKey: .local_jobs)
        notification = try values.decodeIfPresent([HomeNotification].self, forKey: .notification)
        new = try values.decodeIfPresent(Int.self, forKey: .new)
        offered = try values.decodeIfPresent(Int.self, forKey: .offered)
        onboard = try values.decodeIfPresent(Int.self, forKey: .onboard)
        working = try values.decodeIfPresent(Int.self, forKey: .working)
        done = try values.decodeIfPresent(Int.self, forKey: .done)
    }

}
