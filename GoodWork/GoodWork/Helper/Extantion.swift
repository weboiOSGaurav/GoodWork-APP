//
//  Extantion.swift

import Foundation
import UIKit

extension String{
    
    func isEmail() -> Bool {
        
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
        
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }
    
    func isStringWithoutSpace() -> Bool {
        return !self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    func contains(find: String) -> Bool{
        return self.range(of:find, options:String.CompareOptions.caseInsensitive) != nil
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }
    
    func removeWhitespace() -> String {
//        return self.replace(string: " ", replacement: "")
        return self.replacingOccurrences(of: "\\s+$",
                                               with: "",
                                            options: .regularExpression)
    }
    
    func isALowerCase( _ str : String) -> Bool{
        
        
        var isLowerCase = false
        
        for i in str {
            if i.isLowercase{
                isLowerCase = true
            }
        }
        
        //        let lowerCaseTest = NSPredicate(format: "SELF MATCHES %@", "^.*[a-z]$")
        //        return lowerCaseTest.evaluate(with: self)
        return   isLowerCase
    }
    
    
    func isAUpperCase(_ str : String) -> Bool{
        
        var isUppCase = false
        
        
        for i in str {
            if i.isUppercase{
                isUppCase = true
            }
        }
        
        //        let lowerCaseTest = NSPredicate(format: "SELF MATCHES %@", "^.*[A-Z]$")
        //        return lowerCaseTest.evaluate(with: self)
        return isUppCase
    }
    
    func isANumber(_ str : String) -> Bool{
        
        //let isNumbers = doStringContainsNumber(_string: str)
        
        //        let lowerCaseTest = NSPredicate(format: "SELF MATCHES %@", "^.*\\d")
        //        return lowerCaseTest.evaluate(with: self)
        
       // return isNumbers
        
        return false
    }
    
    func isMorethanEightCharecter(_ str : String) -> Bool {
        
        let numberCount = str.count
        return 7 < numberCount
    }
    
    func isACharacter() -> Bool{
        let lowerCaseTest = NSPredicate(format: "SELF MATCHES %@", "^.*[#$%^&*=+<.>_-]")
        return lowerCaseTest.evaluate(with: self)
    }
    
    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    var isLowercase: Bool {
        return self == self.lowercased()
    }
    
    var isUppercase: Bool {
        return self == self.uppercased()
    }
    
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,3})$", options: .caseInsensitive)
        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        print("Email validation \(valid)")
        return valid
    }
    
    // vrify Valid PhoneNumber or Not
//    func isValidPhone() -> Bool {
//
//        let regex = try! NSRegularExpression(pattern: "^[0-9]\\d{9}$", options: .caseInsensitive)
//        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
//        print("Mobile validation \(valid)")
//        return valid
//    }
    
    func isValidPhone() -> Bool {
        
        let range = NSRange(location: 0, length: self.count)
        let regex = try! NSRegularExpression(pattern: "(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}")
        if regex.firstMatch(in: self, options: [], range: range) != nil{
            print("Phone number is valid")
            return true
        }else{
            print("Phone number is not valid")
            return false
        }
    }
    
    
}


class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .alert)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    
    override init(){
        super.init()
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
    }
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;
        
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        }else{
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    // For Swift 4.2+
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image)
    }
    
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }
    
}

extension UIView {
    
    func cornerRadiusRound(_ cornerInt : Int) {
        self.layer.cornerRadius = CGFloat(cornerInt)
        self.clipsToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func dropShadow1(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 5
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func cardView(_ cornerRadius : Int){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 0.6
    }
    
    func cardViewCustom(_ cornerRadius : Int, _ shadowRadius : Double){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = CGFloat(shadowRadius)
        self.layer.shadowOpacity = 0.6
    }
    
    func cardViewCustomShadowOpacity(_ cornerRadius : Int, _ shadowRadius : Double, _ cardViewCustomShadowOpacity : Double){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = CGFloat(shadowRadius)
        self.layer.shadowOpacity = Float(cardViewCustomShadowOpacity)
    }
    
    func cornerRadius(_ radius :Int){
        self.layer.cornerRadius = CGFloat(radius)
        self.clipsToBounds = true
    }
    
    func cornerRadiusWithBgColour(_ radius :Int, bgColour : UIColor){
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.backgroundColor = bgColour.cgColor
        self.clipsToBounds = true
    }
    
    func addborder(_ bordarColour : UIColor){
        self.layer.borderWidth = 1
        self.layer.borderColor = bordarColour.cgColor
        self.clipsToBounds = true
    }
    
    func addBorder(_ weight: Int, _ colour : UIColor){
        self.layer.borderWidth = CGFloat(weight)
        self.layer.borderColor = colour.cgColor
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    func addBorderCornerRadius(_ cornerRadius: Int, _ weight: Int, _ colour : UIColor){
        self.layer.borderWidth = CGFloat(weight)
        self.layer.borderColor = colour.cgColor
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
    
    func addBorderAndCorner(_ weight: Int, _ redius: Int, _ colour : UIColor){
        self.layer.borderWidth = CGFloat(weight)
        self.layer.borderColor = colour.cgColor
        self.layer.cornerRadius = CGFloat(redius)
        self.clipsToBounds = true
    }
    
    func addBorderAndColour(_ weight: Int, _ colour : UIColor){
        self.layer.borderWidth = CGFloat(weight)
        self.layer.borderColor = colour.cgColor
        self.clipsToBounds = true
    }
    
    func addBorderAndColourFloat(_ Float: CGFloat, _ colour : UIColor){
        self.layer.borderWidth = CGFloat(Float)
        self.layer.borderColor = colour.cgColor
        self.clipsToBounds = true
    }
    
    func bottomRoundCorners(_ corners: CACornerMask, radius: CGFloat, _ bgColour : UIColor) {
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = corners
        } else {
            // Fallback on earlier versions
        }
        self.layer.cornerRadius = radius
        self.backgroundColor = bgColour
    }
    
    func topRoundCorners(_ radius: CGFloat) {
        var corners : UIRectCorner
        corners = [.topLeft, .topRight]
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addShadow(shadowOpacity: Double, shadowRadius: Int) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2
        self.clipsToBounds = false
    }
}


extension UIImage{
    func resizedToSize(_ sizeInKB: Double) -> UIImage? {
        guard let imageData = self.pngData() else { return nil }
        let megaByte = sizeInKB
        
        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB
        
        while imageSizeKB > megaByte { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resized(withPercentage: 0.5),
                  let imageData = resizedImage.pngData() else { return nil }
            
            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / megaByte // ! Or devide for 1024 if you need KB but not kB
        }
        
        return resizingImage
    }
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UIImageView {
    
    func bottomCornerRadius(_ corner : Int){
        self.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        self.clipsToBounds = true
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = corners
        } else {
            // Fallback on earlier versions
        }
        self.layer.cornerRadius = radius
    }
}



extension UIButton {
    
    func addBorderAndRoundButton(radious : Int, borderColour : UIColor, borderWidthBTN : Int) {
        
        self.layer.cornerRadius = CGFloat(radious)
        self.layer.borderWidth = CGFloat(borderWidthBTN)
        self.layer.backgroundColor = borderColour.cgColor
        
    }
    
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
    
    func setImageTintColorForSelected(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .selected)
        self.tintColor = color
    }
}

extension UIButton {
    
    func roundCornerWithBGColour(_ radius : CGFloat, bgColour : UIColor){
        self.layer.cornerRadius = radius
        self.backgroundColor = bgColour
    }
    
}


//extension UITableView {
//
//    func setEmptyMessage(_ message: String) {
//        let messageLabel = UILabel(frame: CGRect(x: 10, y: -10, width: self.bounds.size.width - 30, height: self.bounds.size.height))
//        messageLabel.text = message
//        messageLabel.textColor = EDColor.appBlack
//        messageLabel.numberOfLines = 0
//        messageLabel.lineBreakMode = .byWordWrapping
//        messageLabel.textAlignment = .center
//        messageLabel.font = EDFont.CenturyGothicFont(.Roboto_Regular, 20)
//        messageLabel.clipsToBounds = true
//        messageLabel.sizeToFit()
//
//        self.backgroundView = messageLabel
//        self.separatorStyle = .none
//    }
//
//    func restore() {
//        self.backgroundView = nil
//        self.separatorStyle = .singleLine
//    }
//}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String{
        
        if hours(from: date)   > 24{
            return date.toString(dateFormat: "MMM,dd")
        }
        
        if hours(from: date)   > 0 { return "\(hours(from: date))h" }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) >= 0 { return "Just now" }
        
        return ""
    }
    
    func blastTimeRemaing(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func blastTimeRemaingSeconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    func offsetForChat(from date: Date) -> String{
        
        if hours(from: date)   > 0 { return "Today" }
        if minutes(from: date) > 0 { return "Today" }
        if seconds(from: date) > 0 { return "Today" }
        if (days(from: date)) == 1 { return "Yesterday" }
        return UTCToLocal(date: date)
    }
    
    func UTCToLocal(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dt = date
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: dt)
    }
    
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

func df() -> DateFormatter {
    let dateF = DateFormatter()
    dateF.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
    dateF.locale = Locale(identifier: "en_US_POSIX")
    dateF.timeZone = TimeZone(identifier: "UTC")!
    return dateF
}


extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }){
           
            popToViewController(vc, animated: animated)
        }
    }
}

extension UILabel {
    func addCharactersSpacing(spacing:CGFloat, text:String) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, text.count-1))
        self.attributedText = attributedString
    }
}

extension UIButton{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

extension UITextField{
    func updateCursorColour(){
        self.tintColor = GoodWorkAppColor.appColour
    }
}
