
import Foundation

struct ExploreData : Codable {
    
    var popular_jobs : [Popular_jobs]?
    var recommended_jobs : [Recommended_jobs]?
    var recently_added : [Recently_added]?

    enum CodingKeys: String, CodingKey {

        case popular_jobs = "popular_jobs"
        case recommended_jobs = "recommended_jobs"
        case recently_added = "recently_added"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        popular_jobs = try values.decodeIfPresent([Popular_jobs].self, forKey: .popular_jobs)
        recommended_jobs = try values.decodeIfPresent([Recommended_jobs].self, forKey: .recommended_jobs)
        recently_added = try values.decodeIfPresent([Recently_added].self, forKey: .recently_added)
    }

}
