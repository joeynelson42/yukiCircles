
import Foundation
import UIKit

extension UIColor{
    class func fromHex(rgbValue:UInt32, alpha:Double=1.0) -> UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    class func extraLightGray() -> UIColor {
        return UIColor.fromHex(rgbValue: 0xECECEC)
    }
    
    class func randomYukiColor() -> UIColor {
        let colorIndex = Int(arc4random_uniform(UInt32(UIColor.yukiColors.count)))
        return yukiColors[colorIndex]
    }
    
    static let yukiColors = [UIColor.fromHex(rgbValue: 0x00BCAE),
                             UIColor.fromHex(rgbValue: 0x0088FF),
                             UIColor.fromHex(rgbValue: 0xFF0000),
                             UIColor.fromHex(rgbValue: 0x00D7B5),
                             UIColor.fromHex(rgbValue: 0x2200C8),
                             UIColor.fromHex(rgbValue: 0xFF9D00),
                             UIColor.fromHex(rgbValue: 0xFF009F),
                             UIColor.fromHex(rgbValue: 0x16DDE3),
                             UIColor.fromHex(rgbValue: 0xFFCC00),
                             UIColor.fromHex(rgbValue: 0x00DF00),
                             UIColor.fromHex(rgbValue: 0xFBF400)]
    
    class func stringToHex(s: NSString)->Int{
        let numbers = [
            "a": 10, "A": 10,
            "b": 11, "B": 11,
            "c": 12, "C": 12,
            "d": 13, "D": 13,
            "e": 14, "E": 14,
            "f": 15, "F": 15,
            "0": 0
        ]
        
        var number: Int = Int()
        if(s.intValue > 0){
            number = s.integerValue
        }
        else{
            number = numbers[s as String]!
        }
        return number
    }
    
    
    
    func rgb() -> (red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = CGFloat(fRed * 255.0)
            let iGreen = CGFloat(fGreen * 255.0)
            let iBlue = CGFloat(fBlue * 255.0)
            let iAlpha = CGFloat(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
    
    class func ColorFromRedGreenBlue(red: NSString, green: NSString, blue: NSString)->UIColor{
        
        var first: NSString = red.substring(to: 1) as NSString
        var second = red.substring(from: 1)
        var varOne = stringToHex(s: first)
        var varTwo = stringToHex(s: second as NSString)
        let redValue: CGFloat = (CGFloat(varOne) * 16.0 + CGFloat(varTwo)) / 255.0
        
        first = green.substring(to: 1) as NSString
        second = green.substring(from: 1)
        varOne = stringToHex(s: first)
        varTwo = stringToHex(s: second as NSString)
        let greenValue: CGFloat = (CGFloat(varOne) * 16.0 + CGFloat(varTwo)) / 255.0
        
        first = blue.substring(to: 1) as NSString
        second = blue.substring(from: 1)
        varOne = stringToHex(s: first)
        varTwo = stringToHex(s: second as NSString)
        let blueValue: CGFloat = (CGFloat(varOne) * 16.0 + CGFloat(varTwo)) / 255.0
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
