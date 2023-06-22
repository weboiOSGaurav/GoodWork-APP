
import Foundation

import UIKit

public var baseUrl : String{
    get{
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            fatalError("Couldn't find the Info.plist file")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "SERVER_URL") as? String else {
            fatalError("Coundn;t find the SERVER_URL in Info.plist file")
        }
        return value
    }
}

struct baseURLV1Constant {

    static let bseURL = "https://goodwork.jobpazi.in/api/"
}

struct commonFunctions {
    static func sort(str:String) -> Double {
        let dfmatter = DateFormatter()
            dfmatter.dateFormat="yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if str == "" || str == nil {
            let date = Date()
            let dateformat = DateFormatter()
            dateformat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let str = dateformat.string(from: date)
            let dateStamp:TimeInterval = date.timeIntervalSince1970
            let dateSt:Double = Double(dateStamp)
            return dateSt
        }else{
            let date = dfmatter.date(from: str)
            let dateStamp:TimeInterval = date!.timeIntervalSince1970
            let dateSt:Double = Double(dateStamp)
            return dateSt
        }
    }
    
   static func stringToDate(isDate:String)->Date{
        let isoDate = isDate
        
        let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"//"yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:isoDate)!
        return date
    }
    
    
}


@IBDesignable
class DashedLineView : UIView {
    @IBInspectable var perDashLength: CGFloat = 2.0
    @IBInspectable var spaceBetweenDash: CGFloat = 2.0
    @IBInspectable var dashColor: UIColor = UIColor.lightGray
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let  path = UIBezierPath()
        if height > width {
            let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            path.move(to: p0)
            
            let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
            path.addLine(to: p1)
            path.lineWidth = width
            
        } else {
            let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            path.move(to: p0)
            
            let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
            path.addLine(to: p1)
            path.lineWidth = height
        }
        
        let  dashes: [ CGFloat ] = [ perDashLength, spaceBetweenDash ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        
        path.lineCapStyle = .butt
        dashColor.set()
        path.stroke()
    }
    
    private var width : CGFloat {
        return self.bounds.width
    }
    
    private var height : CGFloat {
        return self.bounds.height
    }
}
