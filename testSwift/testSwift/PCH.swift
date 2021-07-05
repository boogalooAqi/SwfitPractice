//
//  PCH.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//
import UIKit
import Foundation


let Screen_Bounds: CGRect  = UIScreen.main.bounds
let Screen_Width : CGFloat = UIScreen.main.bounds.width
let Screen_Height: CGFloat = UIScreen.main.bounds.height
// 屏幕宽/高
let SWIDTH = CGFloat(Screen_Width)
let SHEIGHT = CGFloat(Screen_Height)
// 状态栏高度
let STATUSBAR_HIGH = CGFloat(is_iPhoneXSeries() ? 44 : 20)
// 导航栏高度
let NAV_HIGH = CGFloat(44);
// tabbar高度
let TABBAR_HEIGHT = CGFloat(is_iPhoneXSeries() ? 83.0 : 49.0)
// tabbar安全高度
let TABBAR_HEIGHT_SAFE = CGFloat(is_iPhoneXSeries() ? 34.0 : 0.0)

// Window
let KWindow = UIApplication.shared.windows.first
// User_Default
let USER_DEFAULTS = UserDefaults.standard;
// 沙盒路径
let DOCUMENT_PATH = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);

/********************** frame **********************/
extension CGRect {
    static func getFrame(x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat) ->(CGRect){
        return CGRect.init(x: CGFloat(x), y: CGFloat(y), width: CGFloat(w), height: CGFloat(h))
    }
    
    static func getMaxX(obj:UIView) -> (CGFloat){
        let x : CGFloat = obj.frame.maxX
        return x
    }
    
    static func getMaxY(obj:UIView) -> (CGFloat){
        let y : CGFloat = obj.frame.maxY
        return y
    }
}

/********************** Color **********************/
extension UIColor {
    
    static func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> (UIColor) {
        return RGBA(r: r, g: g, b: b, a: 1.0);
    }
    
    static func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> (UIColor) {
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    

    static func HEX(_ val: UInt) -> UIColor {
          var r: UInt = 0, g: UInt = 0, b: UInt = 0;
          var a: UInt = 0xFF
          var rgb = val

          if (val & 0xFFFF0000) == 0 {
              a = 0xF

              if val & 0xF000 > 0 {
                  a = val & 0xF
                  rgb = val >> 4
              }

              r = (rgb & 0xF00) >> 8
              r = (r << 4) | r

              g = (rgb & 0xF0) >> 4
              g = (g << 4) | g

              b = rgb & 0xF
              b = (b << 4) | b

              a = (a << 4) | a

          } else {
              if val & 0xFF000000 > 0 {
                  a = val & 0xFF
                  rgb = val >> 8
              }

              r = (rgb & 0xFF0000) >> 16
              g = (rgb & 0xFF00) >> 8
              b = rgb & 0xFF
          }
          return UIColor(red: CGFloat(r) / 255.0,
                         green: CGFloat(g) / 255.0,
                         blue: CGFloat(b) / 255.0,
                         alpha: CGFloat(a) / 255.0)
      }
}


/********************** Font **********************/
func Font(fontSize: CGFloat) -> UIFont {
    return  UIFont.systemFont(ofSize: fontSize)
}

func BoldFont(fontSize: CGFloat) -> UIFont {
    return  UIFont.boldSystemFont(ofSize: fontSize)
}

/********************** Device **********************/
// 适配 判断系统版本
func AdaptiveiOSSystem(version: Float) -> (Bool) {
    let sysVer = Float(UIDevice.current.systemVersion) ?? 0.0;
    if (sysVer >= version) {
        return true;
    }
    return false;
}
 
// 判断是否设备是iphoneX系列
func is_iPhoneXSeries() -> (Bool) {
    guard #available(iOS 11.0, *) else{
        return false
    }
    let isX = UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
    print("是不是--->\(isX)")
    return isX
}
 
// 判断iPhoneX
func is_iPhoneX() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1125, height: 2436));
}
 
// 判断iPhoneXS
func is_iPhoneXS() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1125, height: 2436));
}
 
// 判断iPHoneXR
func is_iPhoneXR() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 828, height: 1792));
}
 
// 判断iPhoneXS Max
func is_iPhoneXSMax() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1242, height: 2688));
}
 
// 判断iPhone8 Plus
func is_iPhone8Plus() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1080, height: 1920));
}
 
// 判断iPhone8
func is_iPhone8() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 750, height: 1334));
}
 
// 判断iPhone7 Plus
func is_iPhone7Plus() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1080, height: 1920));
}
 
// 判断iPhone7
func is_iPhone7() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 750, height: 1334));
}
 
// 判断iPhone6S Plus
func is_iPhone6SPlus() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 1080, height: 1920));
}
 
// 判断iPhone6S
func is_iPhone6S() -> (Bool) {
    return CompareIPhoneSize(size: CGSize(width: 750, height: 1334));
}
 
// 设备是否是iPad
func is_iPad() -> (Bool) {
    if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
        return true;
    }
    return false;
}
 
func CompareIPhoneSize(size: CGSize) -> (Bool) {
    if (!is_iPad()) {
        guard let currentSize = UIScreen.main.currentMode?.size else {
            return false;
        }
        if (__CGSizeEqualToSize(size, currentSize)) {
            return true;
        }
    }
    return false;
}
