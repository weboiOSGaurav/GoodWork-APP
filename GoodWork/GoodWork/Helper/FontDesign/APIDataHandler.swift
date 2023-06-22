

import Foundation
import Alamofire

import UIKit

enum APIType
{
    case login , signup
}


class APIDataHandler{
    
    let kSuccess        = "Success"
    let kStatus         = "Status"
    let kMessage        = "Message"
    
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = APIDataHandler()
    
    func getSessionToken() -> String {
        var sessionID = ""
        if let id = UserDefaults.standard.value(forKey: "access_token") as? String {
            sessionID = id
        }
        return sessionID
    }
    
    func getTokenType() -> String {
        var sessionID = ""
        if let id = UserDefaults.standard.value(forKey: "tokenType") as? String {
            sessionID = id
        }
        return sessionID
    }
    
    // MARK: POST Method
    func DeleteAccountDataOfType(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>?, completionHandler: @escaping (NSDictionary?, String?) -> Void){
        
        var header = [String : String]()
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = ["Content-Type":"application/json"]
        }
        //eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MThlNjZlMDk4MWMzODU2ZWFjYzgwMjYiLCJpYXQiOjE2NjE0MDc3NjAsImV4cCI6MTY2Mzk5OTc2MCwidHlwZSI6InJlZnJlc2gifQ.TWTmi7JDmMEtvQdj9iQMxWUrf5p5vsPvpQgwyhjJKyI
        
        print(url)
        Alamofire.request(url, method: .delete, parameters: dict, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print("Reponse time \(response.timeline.totalDuration)")
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData , value)
                
                if value == 200{
                    //                    let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                    let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //
                    //                    UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 204 {
                    completionHandler(JSONData as? NSDictionary , nil)
                }else if value == 400 {
                    completionHandler(JSONData as? NSDictionary , nil)
                }else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }else{
                    let error  = JSONData as? NSDictionary
                    print("ErrorData===",error)
                    if error != nil {
                        if  let errorDict = error!.value(forKey: "error") as? NSDictionary{
                            completionHandler(nil, errorDict.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }else{
                            completionHandler(nil, error!.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }
                        
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
        }
    }
    
    // MARK: POST Method
    func PostDataOfType(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>?, completionHandler: @escaping (NSDictionary?, String?) -> Void){
        
        var header = [String : String]()
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = ["Content-Type":"application/json"]
        }
        //eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MThlNjZlMDk4MWMzODU2ZWFjYzgwMjYiLCJpYXQiOjE2NjE0MDc3NjAsImV4cCI6MTY2Mzk5OTc2MCwidHlwZSI6InJlZnJlc2gifQ.TWTmi7JDmMEtvQdj9iQMxWUrf5p5vsPvpQgwyhjJKyI
        
        print(url)
        Alamofire.request(url, method: .post, parameters: dict, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print("Reponse time \(response.timeline.totalDuration)")
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData , value)
                
                if value == 200{
                    //                    let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                    let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //
                    //                    UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 204 {
                    completionHandler(JSONData as? NSDictionary , nil)
                }else if value == 400 {
                    completionHandler(JSONData as? NSDictionary , nil)
                }else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }else{
                    let error  = JSONData as? NSDictionary
                    print("ErrorData===",error)
                    if error != nil {
                        if  let errorDict = error!.value(forKey: "error") as? NSDictionary{
                            completionHandler(nil, errorDict.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }else{
                            completionHandler(nil, error!.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }
                        
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
        }
    }
    
    
    // MARK: POST Method
    func PostMethodDataOfType(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>?, completionHandler: @escaping (NSDictionary?, String?, Data?) -> Void){
        
        var header = [String : String]()
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = ["Content-Type":"application/json"]
        }
        //eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MThlNjZlMDk4MWMzODU2ZWFjYzgwMjYiLCJpYXQiOjE2NjE0MDc3NjAsImV4cCI6MTY2Mzk5OTc2MCwidHlwZSI6InJlZnJlc2gifQ.TWTmi7JDmMEtvQdj9iQMxWUrf5p5vsPvpQgwyhjJKyI
        
        print(url)
        
        Alamofire.request(url, method: .post, parameters: dict, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print("Reponse time \(response.timeline.totalDuration)")
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured", nil)
                    return
                }
                print(JSONData , value)
                
                if value == 200{
                    //                    let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                    let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //
                    //                    UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                    completionHandler(JSONData as? NSDictionary , nil, JSONData as! Data)
                }
                else if value == 204 {
                    completionHandler(JSONData as? NSDictionary , nil, JSONData as! Data)
                }else if value == 400 {
                    completionHandler(JSONData as? NSDictionary , nil, JSONData as! Data)
                }else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil, JSONData as! Data)
                    
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }else{
                    let error  = JSONData as? NSDictionary
                    print("ErrorData===",error)
                    if error != nil {
                        if  let errorDict = error!.value(forKey: "error") as? NSDictionary{
                            completionHandler(nil, errorDict.value(forKey: "message") as? String  ?? "Some error Occured" ,nil)
                        }else{
                            completionHandler(nil, error!.value(forKey: "message") as? String  ?? "Some error Occured",nil)
                        }
                        
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong",nil)
                    }
                }
            }else{
                
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?),nil)
            }
        }
    }
    
    // MARK: Patch Method
    func PatchDataOfType(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>?, completionHandler: @escaping (NSDictionary?, String?) -> Void){
        var header = [String : String]()
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = ["Content-Type":"application/json"]
        }
        
        print(url)
        Alamofire.request(url, method: .patch, parameters: dict, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print("Reponse time \(response.timeline.totalDuration)")
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData , value)
                
                if value == 200{
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 204 {
                    completionHandler(JSONData as? NSDictionary , nil)
                }else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                    let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                    let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                    UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }else{
                    let error  = JSONData as? NSDictionary
                    print("ErrorData===",error)
                    if error != nil
                    {
                        if  let errorDict = error!.value(forKey: "error") as? NSDictionary{
                            completionHandler(nil, errorDict.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }else{
                            completionHandler(nil, error!.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
            
        }
    }
    
    // MARK: POST Method
    func GetDataOfWithParamType(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>?, completionHandler: @escaping (NSDictionary?, String?) -> Void){
        var header = [String : String]()
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = ["Content-Type":"application/json"]
        }
        
        print(url)
        
        Alamofire.request(url, method: .get, parameters: dict, encoding: URLEncoding.queryString, headers: header).responseJSON { (response) in
            
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData , value)
                
                if value == 200
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 204
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }
                else
                {
                    let error  = JSONData as? NSDictionary
                    print("ErrorData===",error)
                    if error != nil
                    {
                        if  let errorDict = error!.value(forKey: "error") as? NSDictionary{
                            completionHandler(nil, errorDict.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }else{
                            completionHandler(nil, error!.value(forKey: "message") as? String  ?? "Some error Occured" )
                        }
                        
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
            
        }
    }
    
    
    // MARK: POST Method
    func postRequestDataOfType(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>?, completionHandler: @escaping (NSDictionary?, String?) -> Void){
        var header = [String : String]()
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = ["Content-Type":"application/json"]
        }
        print(url)
        Alamofire.request(url, method: .post, parameters:dict, encoding: JSONEncoding.default, headers:header).validate().responseJSON { response in
            print(response)
            var statusCode = response.response?.statusCode
            if let error = response.result.error as? AFError {
                statusCode = error._code // statusCode private
                switch error {
                case .invalidURL(let url):
                    print("Invalid URL: \(url) - \(error.localizedDescription)")
                case .parameterEncodingFailed(let reason):
                    print("Parameter encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .multipartEncodingFailed(let reason):
                    print("Multipart encoding failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                case .responseValidationFailed(let reason):
                    print("Response validation failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    
                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        print("Downloaded file could not be read")
                    case .missingContentType(let acceptableContentTypes):
                        print("Content Type Missing: \(acceptableContentTypes)")
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                    case .unacceptableStatusCode(let code):
                        print("Response status code was unacceptable: \(code)")
                        statusCode = code
                    }
                case .responseSerializationFailed(let reason):
                    print("Response serialization failed: \(error.localizedDescription)")
                    print("Failure Reason: \(reason)")
                    // statusCode = 3840 ???? maybe..
                default:break
                }
                
                print("Underlying error: \(error.underlyingError)")
            } else if let error = response.result.error as? URLError {
                print("URLError occurred: \(error)")
            } else {
                print("Unknown error: \(response.result.error)")
            }
            print(statusCode) // the status code
        }
    }
    
    // MARK: POST Method
    func PostDataOfSP(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>, completionHandler: @escaping (NSDictionary?, String?) -> Void)
    {
        //let header = ["Content-Type":"application/json"]
        print(url)
        print(dict)
        
        Alamofire.request(url, method: .post, parameters: dict, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    //  completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData , value)
                
                if value == 200
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }
                else
                {
                    let error  = JSONData as? NSDictionary
                    if error != nil
                    {
                        completionHandler(error, error!.value(forKey: "Message") as? String  ?? "Some error Occured" )
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
            
        }
    }
    
    // MARK: GET Method
    func getDataFromAPIWith(type:APIType , url:String,completionHandler: @escaping (NSDictionary?, String?) -> Void){
        
        var header : [String : String]?
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization": "Bearer" + " " + self.getSessionToken()]
        }else{
            header = nil
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                
                print(JSONData , value)
                
                if value == 200{
                    completionHandler(JSONData as? NSDictionary , nil)
                    
                } else if value == 403{
                    let error  = JSONData as? NSDictionary
                    if error != nil{
                        completionHandler(nil, "Your account has been disabled from admin!")
                    }else  {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }else{
                    let error  = JSONData as? NSDictionary
                    if error != nil{
                        completionHandler(nil, error!.value(forKey: "Message") as? String  ?? "Some error Occured" )
                    }
                    else  {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }
            else
            {
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
        }
    }
    
    // MARK: GET Claim
    func getClaimDataFromAPIWith(type:APIType , url:String,completionHandler: @escaping (NSArray?, String?) -> Void)
    {
        var header : [String : String]?
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization":self.getTokenType() + " " + self.getSessionToken()]
        }else{
            header = nil
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                
                print(JSONData , value)
                
                if value == 200
                {
                    completionHandler(JSONData as? NSArray , nil)
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSArray , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }else{
                    let error  = JSONData as? NSDictionary
                    if error != nil
                    {
                        completionHandler(nil, error!.value(forKey: "Message") as? String  ?? "Some error Occured" )
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }
            else
            {
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
        }
    }
    
    
    // MARK: POST Method for Bool type data
    func PostBoolValue(type:APIType,url:String,withPostDataIn dict:Dictionary<String,AnyObject>, completionHandler: @escaping (NSDictionary?, String?) -> Void){
        
        let fileUrl = Foundation.URL(string: url)
        var request = URLRequest(url: fileUrl!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let data = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        let json = String(data: data, encoding: String.Encoding.utf8)
        print(json)
        request.httpBody = data
        
        print(url)
        print(dict)
        
        Alamofire.request(request).responseJSON { (response) in
            
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData ?? "" , value)
                
                if value == 200
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }
                else
                {
                    let error  = JSONData as? NSDictionary
                    if error != nil
                    {
                        completionHandler(nil, error!.value(forKey: "Message") as? String  ?? "Some error Occured" )
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
            
        }
    }
    
    func PostJsonArray(type:APIType,url:String,withPostDataIn dict:[Dictionary<String,AnyObject>], completionHandler: @escaping (NSDictionary?, String?) -> Void)
    {
        let fileUrl = Foundation.URL(string: url)
        var request = URLRequest(url: fileUrl!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: dict,options: .prettyPrinted)
        
        //        var header : [String : String]?
        if self.getSessionToken() != "" {
            //            header = ["Content-Type":"application/json",
            //                      "accept":"application/json",
            //                      "Authorization":self.getTokenType() + " " + self.getSessionToken()]"Bearer"
            //request.addValue(self.getTokenType() + " " + self.getSessionToken(), forHTTPHeaderField: "Authorization")
            request.addValue("Bearer" + " " + self.getSessionToken(), forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        print(url)
        print(dict)
        Alamofire.request(request).responseJSON { (response) in
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData ?? "" , value)
                
                if value == 200
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }
                else
                {
                    let error  = JSONData as? NSDictionary
                    if error != nil
                    {
                        completionHandler(nil, error!.value(forKey: "Message") as? String  ?? "Some error Occured" )
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
        }
    }
    
    func PostJsonArrayA(url:String,withPostDataIn dict:[Any], completionHandler: @escaping (NSDictionary?, String?) -> Void)
    {
        //        let fileUrl = Foundation.URL(string: url)
        //        var request = URLRequest(url: fileUrl!)
        //        request.httpMethod = "POST"
        ////        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        //        request.httpBody = try! JSONSerialization.data(withJSONObject: dict)
        
        var header : [String : String]?
        if self.getSessionToken() != "" {
            header = ["Content-Type":"application/json",
                      "accept":"application/json",
                      "Authorization":"Bearer" + " " + self.getSessionToken()]
        }else{
            header = nil
        }
        
        print(url)
        print(dict)
        //Alamofire.request(url,method: .post,parameters: <#T##Parameters?#>
        let pp = [dict]
        Alamofire.request(url, method: .post, parameters: header, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if let JSONData = response.result.value{
                guard let value = response.response?.statusCode else {
                    completionHandler(nil, "Some error Occured")
                    return
                }
                print(JSONData ?? "" , value)
                if value == 200
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }
                else
                {
                    let error  = JSONData as? NSDictionary
                    if error != nil
                    {
                        completionHandler(nil, error!.value(forKey: "Message") as? String  ?? "Some error Occured" )
                    }
                    else
                    {
                        completionHandler(nil, "Something Went wrong" )
                    }
                }
            }else{
                completionHandler(nil, self.getErrorStringFromError(error: response.result.error as NSError?))
            }
        }
    }
    
    func deleteDataFromAPIWith(url:String,data:Dictionary<String,AnyObject> ,header:Dictionary<String,String>,completionHandler: @escaping (NSDictionary?, String?) -> Void)
    {
        //        var header:Dictionary<String,String>?
        //
        //
        //
        //        if type == APIType.login || type == APIType.signup || type == APIType.recoverPassword
        //        {
        //
        //            header = nil
        //
        //        }
        //        else
        //        {
        //            header = ["Content-Type":"application/json","x-access-token":UserDefaults.standard.value(forKey:"token") as? String ?? ""]
        //
        //        }
        //
        //        print(url)
        
        Alamofire.request(url, method: .delete, parameters: data, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if let JSONData = response.result.value{
                
                guard let value = response.response?.statusCode else {
                    
                    completionHandler(nil, "Some error Occured")
                    return
                }
                
                print(JSONData , value)
                
                if value == 200
                {
                    
                    let error  = (JSONData  as AnyObject).value(forKey:self.kMessage) as! String
                    completionHandler(nil, error  )
                }
                else if value == 402 {
                    completionHandler(JSONData as? NSDictionary , nil)
                    //                     let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
                    //                     let myViewController = mainStoryboard.instantiateViewController(withIdentifier: "commonAlertVC") as! commonAlertVC
                    //                     UIApplication.topViewController()?.navigationController?.present(myViewController, animated: true)
                }
                else
                {
                    completionHandler(JSONData as? NSDictionary , nil)
                    
                }
            }
            else
            {
                
                var str:String? = ""
                
                if response.data != nil
                {
                    str = String(data: response.data!, encoding: String.Encoding.utf8)
                    
                    print(str ?? "Some error Occured")
                    
                }
                completionHandler(nil, str)
            }
        }
    }
    
    // Parse Error Localization
    func getErrorStringFromError(error:NSError?) -> String
    {
        if var errorResponse = error?.localizedDescription
        {
            
            //print( errorResponse)
            
            if (errorResponse as String) ==  "The Internet connection appears to be offline."{
                errorResponse += "\n Please Try After Some Time"
                return errorResponse
            }else if(errorResponse as String) ==  "The Internet connection appears to be offline."{
                return "Server Not Responding. \n Please try after some time."
            }else{
                return errorResponse
            }
        }
        else{
            return "Something went wrong!"
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Session Expired", message: "Your account has got some issues, please try logging in again.", preferredStyle: UIAlertController.Style.alert)
        
        // alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { (alert) -> Void in
            
            _userDefault.synchronize()
        })
         
    }
}

