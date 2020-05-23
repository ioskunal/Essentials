

import UIKit
import CoreTelephony

/// EZSwiftExtensions
private let DeviceList = [
    /* iPod 5 */          "iPod5,1": "iPod Touch 5",
    /* iPod 6 */          "iPod7,1": "iPod Touch 6",
    /* iPhone 4 */        "iPhone3,1": "iPhone 4", "iPhone3,2": "iPhone 4", "iPhone3,3": "iPhone 4",
    /* iPhone 4S */       "iPhone4,1": "iPhone 4S",
    /* iPhone 5 */        "iPhone5,1": "iPhone 5", "iPhone5,2": "iPhone 5",
    /* iPhone 5C */       "iPhone5,3": "iPhone 5C", "iPhone5,4": "iPhone 5C",
    /* iPhone 5S */       "iPhone6,1": "iPhone 5S", "iPhone6,2": "iPhone 5S",
    /* iPhone 6 */        "iPhone7,2": "iPhone 6",
    /* iPhone 6 Plus */   "iPhone7,1": "iPhone 6 Plus",
    /* iPhone 6S */       "iPhone8,1": "iPhone 6S",
    /* iPhone 6S Plus */  "iPhone8,2": "iPhone 6S Plus",
    /* iPhone 7 */        "iPhone9,1": "iPhone 7", "iPhone9,3": "iPhone 7",
    /* iPhone 7 Plus */   "iPhone9,2": "iPhone 7 Plus", "iPhone9,4": "iPhone 7 Plus",
    /* iPhone SE */       "iPhone8,4": "iPhone SE",
    /* iPhone 8 */        "iPhone10,1": "iPhone 8", "iPhone10,4": "iPhone 8",
    /* iPhone 8 Plus */   "iPhone10,2": "iPhone 8 Plus", "iPhone10,5": "iPhone 8 Plus",
    /* iPhone X */        "iPhone10,3": "iPhone X", "iPhone10,6": "iPhone X",

    /* iPad 2 */          "iPad2,1": "iPad 2", "iPad2,2": "iPad 2", "iPad2,3": "iPad 2", "iPad2,4": "iPad 2",
    /* iPad 3 */          "iPad3,1": "iPad 3", "iPad3,2": "iPad 3", "iPad3,3": "iPad 3",
    /* iPad 4 */          "iPad3,4": "iPad 4", "iPad3,5": "iPad 4", "iPad3,6": "iPad 4",
    /* iPad Air */        "iPad4,1": "iPad Air", "iPad4,2": "iPad Air", "iPad4,3": "iPad Air",
    /* iPad Air 2 */      "iPad5,3": "iPad Air 2", "iPad5,4": "iPad Air 2",
    /* iPad Mini */       "iPad2,5": "iPad Mini", "iPad2,6": "iPad Mini", "iPad2,7": "iPad Mini",
    /* iPad Mini 2 */     "iPad4,4": "iPad Mini 2", "iPad4,5": "iPad Mini 2", "iPad4,6": "iPad Mini 2",
    /* iPad Mini 3 */     "iPad4,7": "iPad Mini 3", "iPad4,8": "iPad Mini 3", "iPad4,9": "iPad Mini 3",
    /* iPad Mini 4 */     "iPad5,1": "iPad Mini 4", "iPad5,2": "iPad Mini 4",
    /* iPad Pro */        "iPad6,7": "iPad Pro", "iPad6,8": "iPad Pro",
    /* AppleTV */         "AppleTV5,3": "AppleTV",
    /* Simulator */       "x86_64": "Simulator", "i386": "Simulator"
]

extension UIDevice {
  
    /// EZSwiftExtensions
    public class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)

        for child in mirror.children {
            let value = child.value

            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }

        return identifier
    }

    //TODO: Fix syntax, add docs and readme for these methods:
    //TODO: Delete isSystemVersionOver()
    // MARK: - Device Version Checks

    public enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
    }

    public class func isSystemVersionOver(_ requiredVersion: String) -> Bool {
        switch systemVersion().compare(requiredVersion, options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            //println("iOS >= 8.0")
            return true
        case .orderedAscending:
            //println("iOS < 8.0")
            return false
        }
    }
    
    public class func idForVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    /// - Operating system name
    public class func systemName() -> String {
        return UIDevice.current.systemName
    }
    
    /// - Operating system version
    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// EZSwiftExtensions
    public class func deviceName() -> String {
        return UIDevice.current.name
    }
    
    
    /// EZSwiftExtensions
    public class func deviceModelReadable() -> String {
        return DeviceList[deviceModel()] ?? deviceModel()
    }
    
    /// EZSE: Returns true if the device is iPhone //TODO: Add to readme
    public class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    /// EZSE: Returns true if the device is iPad //TODO: Add to readme
    public class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    public class func IS_4_OR_4S() -> Bool {
        return (UIDevice.screenHeight == 480) ? true : false
    }
    
    public class func IS_5_OR_5S() -> Bool {
        return (UIDevice.screenHeight == 568) ? true : false
    }
    
    public class func IS_6_7_OR_8() -> Bool {
        return (UIDevice.screenHeight == 667) ? true : false
    }
    
    public class func IS_6PLUS_7PLUS_OR_8PLUS() -> Bool {
        return (UIDevice.screenHeight == 736) ? true : false
    }
    
    public class func IS_X() -> Bool {
        return (UIDevice.screenHeight >= 812) ? true : false
    }
    
    public class func isOrBelow5() -> Bool {
        return (IS_4_OR_4S() || IS_5_OR_5S()) ? true : false
    }
    
    func getInfo() -> String {
        let strVersion = UIDevice.appVersion!
        let strRegion = UIDevice.currentRegion ?? ""
        let phoneInfo = CTTelephonyNetworkInfo()
        let phoneCarrier = phoneInfo.subscriberCellularProvider
        let device = UIDevice.current
        let systemName = device.systemName
        let systemVersion =  device.systemVersion
        let model = device.model
        let localizedModel = device.localizedModel
        let UUID =  device.identifierForVendor?.uuidString ?? ""
        let carrier = phoneCarrier?.carrierName ?? ""
        
        let strDetails = "Version: \(strVersion)\n Region: \(strRegion)\n System Name: \(systemName)\n systemVersion: \(systemVersion)\n model: \(model)\n Localized Model: \(localizedModel)\n UUID: \(UUID)\n Carrier: \(carrier)\n"
        return strDetails
    }
}
