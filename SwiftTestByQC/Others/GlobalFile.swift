//
//  GlobalFile.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/5.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit
import SnapKit//和masonry一样的功能
import SDWebImage//不解释
import YYKit.NSObject_YYModel //数据解析
import Alamofire //数据请求 原AFN作者


 //json解析
//import HandyJSON.h



//屏幕设置系列
let kSCREEN_WIDTH = UIScreen.main.bounds.size.width
let kSCREEN_HEIGHT = UIScreen.main.bounds.size.height
let kSCREEN_BOUNDS = UIScreen.main.bounds

//最后改成了这样的宽高，感觉这样写着舒服点吧
let CKWIDTH = UIScreen.main.bounds.size.width
let CKHEIGHT = UIScreen.main.bounds.size.height


let HOSTURL = "http://49.122.0.187"
let QCLOAD = "/Hall/api/loginVerify"


//顶部电池条的状态栏高度
let kStatubarHeight = UIApplication.shared.statusBarFrame.size.height




//设置矩形区域
func __setCGRECT(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect {
    return CGRect(x:x,y:y,width:width,height:height)
}

//如果传进来的name为空，会导致崩溃，必须返回有值
func __setImageName(name:String) -> UIImage {
    return UIImage(named:name)!
}

//将任意数据类型转换为number
func __CGFloat(number:AnyObject) -> CGFloat {
    
    return CGFloat.init(truncating: number as! NSNumber)
}




//存储常量
let KUserDefauls = UserDefaults.standard

//存储登陆信息
func saveLoginMark(value:Bool) {
    KUserDefauls.set(value, forKey: "islogin")
    KUserDefauls.synchronize()
}
/** 获取登录信息*/
func isLogin() -> Bool {
    return KUserDefauls.bool(forKey: "islogin")
}

//存储userID
func saveUserId(value:String)  {
    
    KUserDefauls.set(value, forKey: "myUserId")
    
    
}
//获取userId
func getUserId() -> String {
    
    return KUserDefauls.string(forKey: "myUserId")!

}








//封装RGBA
func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
}





//// 用十六进制颜色创建UIColor
////颜色设置 - 导航条颜色
//let RGBAX = UIColor.colorWithHexString(color: "#00d9c9")
//
//
//
//extension UIColor {
//
//    // 用十六进制颜色创建UIColor
//    class func colorWithHexString(color : NSString) -> UIColor {
//        return UIColor.colorWithHexString_alpha(alpha: 1.0, color: color)
//    }
//
//    /// 用十六进制颜色创建UIColor
//    class func colorWithHexString_alpha(alpha : CGFloat, color : NSString) -> UIColor {
//
//        let set = NSCharacterSet()
//        var strCo = color.trimmingCharacters(in: set as CharacterSet).uppercased()
//
//        if strCo.characters.count != 7 {
//            return self.clear
//        }
//
//        if strCo.hasPrefix("0X") {
//            let index = strCo.index(strCo.startIndex, offsetBy:2)
//            strCo = strCo.substring(from: index)
//        }
//
//        if strCo.hasPrefix("#") {
//            let index = strCo.index(strCo.startIndex, offsetBy:1)
//            strCo = strCo.substring(from: index)
//        }
//
//
//        //分割字符串
//        var startIndex = strCo.index(strCo.startIndex, offsetBy:0)
//        var endIndex = strCo.index(startIndex, offsetBy:2)
//
//        let red = strCo.substring(with: startIndex..<endIndex)
//
//
//        startIndex = strCo.index(strCo.startIndex, offsetBy: 2)
//        endIndex = strCo.index(startIndex, offsetBy: 2)
//
//        let greend = strCo.substring(with: startIndex..<endIndex)
//
//        startIndex = strCo.index(strCo.startIndex, offsetBy: 4)
//        endIndex = strCo.index(startIndex, offsetBy: 2)
//
//        let blue = strCo.substring(with: startIndex..<endIndex)
//
//
//        // 存储转换后的数值
//        var r:UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0
//
//        // 分别转换进行转换
//        Scanner(string: red).scanHexInt32(&r)
//
//        Scanner(string: greend).scanHexInt32(&g)
//
//        Scanner(string: blue).scanHexInt32(&b)
//
//        return self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
//    }
//
//}







