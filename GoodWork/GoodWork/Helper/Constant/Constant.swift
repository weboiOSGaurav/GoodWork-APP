//
//  Constant.swift


import Foundation
import UIKit


let _userDefault : UserDefaults = UserDefaults.standard

private let _sharedManager = Constant()

class Constant: NSObject {
    
    class var sharedManager:Constant {
        return _sharedManager
    }
    
    public override init(){
    }
    
    class func showAlert(_ title: String) {
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        rootVC?.present(alert, animated: true){}
    }
}


