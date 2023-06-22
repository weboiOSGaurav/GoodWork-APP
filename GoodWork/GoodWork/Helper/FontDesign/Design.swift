//
//  font.swift
import Foundation
import UIKit

enum GoodWorkAppFontName : String {
    case NeueKabelRegular = "NeueKabel-Regular"
    case NeueKabelMedium = "NeueKabel-Medium"
    case NeueKabelBold = "NeueKabel-Bold"
    case NeueKabelItalic = "NeueKabel-Italic"
    case NeueKabelMediumItalic = "NeueKabelMediumItalic"
    
    case PoppinsRegular = "Poppins-Regular"
    case PoppinsSemiBold = "Poppins-SemiBold"
    
    case QuicksandRegular = "Quicksand-Regular"
    case QuicksandSemiBold = "Quicksand-SemiBold"
    case QuicksandBold = "Quicksand-Bold"
    case DMSansRegular = "DMSans-Regular"
    case DMSansMedium = "DMSans-Medium"
   
    
    
    
}

struct GoodWorkApp {
    static func defaultFont(_ withSize:CGFloat, _ weight:UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize:withSize, weight:weight)
    }
    
    static func customeFont(_ name:String, _ size:CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? defaultFont(size, .regular)
    }
    
    static func goodWorkAppFont(_ name: GoodWorkAppFontName ,_ size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? defaultFont(size, .regular)
    }
}

class GoodWorkAppColor: UIColor {
    static let appBlack = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let appWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let appColour = #colorLiteral(red: 0.2392156863, green: 0.1725490196, blue: 0.2235294118, alpha: 1) //# 3D2C39
    static let appLightPink = #colorLiteral(red: 0.7098039216, green: 0.3921568627, blue: 0.6196078431, alpha: 1)
    static let appLightGray = #colorLiteral(red: 0.4196078431, green: 0.4156862745, blue: 0.4196078431, alpha: 1)
    static let appOffWhite = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.937254902, alpha: 1) // FFEEEF
    static let appDarkPurple = #colorLiteral(red: 0.2392156863, green: 0.1725490196, blue: 0.2235294118, alpha: 1) // 3D2C39
    static let appBGPink = #colorLiteral(red: 0.9960784314, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
    static let appGre = #colorLiteral(red: 0.3215686275, green: 0.8705882353, blue: 0.7568627451, alpha: 1) // #52DEC1
    static let appBlue = #colorLiteral(red: 0, green: 0.4196078431, blue: 0.7882352941, alpha: 1)
    static let appLightBlack = #colorLiteral(red: 0.08235294118, green: 0.07450980392, blue: 0.07450980392, alpha: 1) // #151313
    static let appEerieBlack = #colorLiteral(red: 0.1019607843, green: 0.1137254902, blue: 0.1176470588, alpha: 1) // #1A1D1E
    static let appArsenic = #colorLiteral(red: 0.2588235294, green: 0.2392156863, blue: 0.2941176471, alpha: 1) // #423D4B
    static let appOffPink = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9725490196, alpha: 1)
    static let appRomanSilver = #colorLiteral(red: 0.5529411765, green: 0.5254901961, blue: 0.4901960784, alpha: 1)
    static let appRaisin = #colorLiteral(red: 0.1058823529, green: 0.1176470588, blue: 0.1568627451, alpha: 1) // #1B1E28
    static let appThunder = #colorLiteral(red: 0.231372549, green: 0.1803921569, blue: 0.2274509804, alpha: 1) // #3B2E3A
    static let appMirage = #colorLiteral(red: 0.1019607843, green: 0.1450980392, blue: 0.1882352941, alpha: 1) // #1A2530
    static let appLavender = #colorLiteral(red: 0.9843137255, green: 0.9882352941, blue: 0.9215686275, alpha: 1) // FBFCEB
    static let appDustyGray = #colorLiteral(red: 0.6823529412, green: 0.631372549, blue: 0.6509803922, alpha: 1) // #AEA1A6
    static let appMalachite = #colorLiteral(red: 0.05882352941, green: 0.8823529412, blue: 0.4274509804, alpha: 1) // #0FE16D
    static let appGrayHTML = #colorLiteral(red: 0.4718119502, green: 0.4867618084, blue: 0.482195437, alpha: 1) // #797C7B
    static let appAuroMetalSaurus = #colorLiteral(red: 0.4392156863, green: 0.4823529412, blue: 0.5058823529, alpha: 1) //#707B81
    static let appDavysGrey = #colorLiteral(red: 0.3215686275, green: 0.3058823529, blue: 0.3607843137, alpha: 1) //#524E5C
    static let appRaisinBlack = #colorLiteral(red: 0.1333333333, green: 0.1019607843, blue: 0.1254901961, alpha: 1) //#221A20
    static let appGrayCSS = #colorLiteral(red: 0.5098039216, green: 0.4705882353, blue: 0.5019607843, alpha: 1) // #827880
    static let appDarkPink = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9725490196, alpha: 1) // #FFE9F9
    static let appOxfordBlue = #colorLiteral(red: 0.2392156863, green: 0.2588235294, blue: 0.3764705882, alpha: 1) // #3D4260
    static let appDateLightGray = #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5176470588, alpha: 1) // #848484
    static let appDescLight = #colorLiteral(red: 0.4470588235, green: 0.462745098, blue: 0.4862745098, alpha: 1) // #72767C
    static let appDeYork = #colorLiteral(red: 0.4392156863, green: 0.8117647059, blue: 0.5921568627, alpha: 1) // #72767C
    static let appPorcelain = #colorLiteral(red: 0.9254901961, green: 0.9333333333, blue: 0.9411764706, alpha: 1) // #ECEEF0
    static let appCharade = #colorLiteral(red: 0.1411764706, green: 0.1529411765, blue: 0.1921568627, alpha: 1) // #242731
    static let appRed = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1) //  #FF5A5A;
    static let appLightBlue = #colorLiteral(red: 0.7254901961, green: 0.8470588235, blue: 0.9803921569, alpha: 1) // #B9D8FA
    static let appLightYello = #colorLiteral(red: 0.9764705882, green: 0.7490196078, blue: 0.3176470588, alpha: 1) // #F9BF51
    static let appLightOrange = #colorLiteral(red: 0.9960784314, green: 0.4941176471, blue: 0.2156862745, alpha: 1) // #F9BF51
    static let appGrannySmith = #colorLiteral(red: 0.5803921569, green: 0.8823529412, blue: 0.6078431373, alpha: 1) // #94E19B
    
    static let appBlizzardBlue = #colorLiteral(red: 0.6588235294, green: 0.8745098039, blue: 0.9450980392, alpha: 1) // #A8DFF1
    static let appSail = #colorLiteral(red: 0.6823529412, green: 0.8235294118, blue: 0.9764705882, alpha: 1) // #AED2F9
    static let appHalfBaked = #colorLiteral(red: 0.4509803922, green: 0.6901960784, blue: 0.8039215686, alpha: 1) // #73B0CD
    static let appMalibu = #colorLiteral(red: 0.4, green: 0.6980392157, blue: 1, alpha: 1) // #73B0CD
    static let appSliderBg = #colorLiteral(red: 0.9137254902, green: 0.9294117647, blue: 0.937254902, alpha: 1) // #E9EDEF
    
}
