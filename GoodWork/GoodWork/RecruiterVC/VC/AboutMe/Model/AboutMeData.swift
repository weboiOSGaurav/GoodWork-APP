
import Foundation

struct AboutMeData : Codable {
    let about_me : String?
    var qualities : [String]?
    let agency_name : String?
    let id : String?
    let role : String?
    let first_name : String?
    let last_name : String?
    let image : String?
    let email : String?
    let user_name : String?
    let password : String?
    let fcm_token : String?
    let email_verified_at : String?
    let date_of_birth : String?
    let driving_license : String?
    let security_number : String?
    let mobile : String?
    let new_mobile : String?
    let otp : String?
    let email_notification : Int?
    let sms_notification : Int?
    let active : Int?
    let remember_token : String?
    let deleted_at : String?
    let created_at : String?
    let updated_at : String?
    let banned_until : String?
    let last_login_at : String?
    let last_login_ip : String?
  //  let facility_id : String?

    enum CodingKeys: String, CodingKey {

        case about_me = "about_me"
        case qualities = "qualities"
        case agency_name = "Agency_name"
        case id = "id"
        case role = "role"
        case first_name = "first_name"
        case last_name = "last_name"
        case image = "image"
        case email = "email"
        case user_name = "user_name"
        case password = "password"
        case fcm_token = "fcm_token"
        case email_verified_at = "email_verified_at"
        case date_of_birth = "date_of_birth"
        case driving_license = "driving_license"
        case security_number = "security_number"
        case mobile = "mobile"
        case new_mobile = "new_mobile"
        case otp = "otp"
        case email_notification = "email_notification"
        case sms_notification = "sms_notification"
        case active = "active"
        case remember_token = "remember_token"
        case deleted_at = "deleted_at"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case banned_until = "banned_until"
        case last_login_at = "last_login_at"
        case last_login_ip = "last_login_ip"
       
        
        //case facility_id = "facility_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        about_me = try values.decodeIfPresent(String.self, forKey: .about_me)
        
       // qualities = try values.decodeIfPresent([String].self, forKey: .qualities)
        
        if let qualities_Test = try? values.decodeIfPresent(String.self, forKey: .qualities){
            var str = [String]()
            
            qualities = str
        }else{
            qualities = try values.decodeIfPresent([String].self, forKey: .qualities)
            
        }
        
        agency_name = try values.decodeIfPresent(String.self, forKey: .agency_name)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
        date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
        driving_license = try values.decodeIfPresent(String.self, forKey: .driving_license)
        security_number = try values.decodeIfPresent(String.self, forKey: .security_number)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        new_mobile = try values.decodeIfPresent(String.self, forKey: .new_mobile)
        otp = try values.decodeIfPresent(String.self, forKey: .otp)
        email_notification = try values.decodeIfPresent(Int.self, forKey: .email_notification)
        sms_notification = try values.decodeIfPresent(Int.self, forKey: .sms_notification)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        remember_token = try values.decodeIfPresent(String.self, forKey: .remember_token)
        deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        banned_until = try values.decodeIfPresent(String.self, forKey: .banned_until)
        last_login_at = try values.decodeIfPresent(String.self, forKey: .last_login_at)
        last_login_ip = try values.decodeIfPresent(String.self, forKey: .last_login_ip)
      //  facility_id = try values.decodeIfPresent(String.self, forKey: .facility_id)
    }

}
