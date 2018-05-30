//
//  HttpTool.swift
//  SwiftTestByQC
//
//  Created by QC on 2018/1/12.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit
import Alamofire //数据请求 原AFN作者

class HttpTool{
    
    //创建单例
    static let shareInstance:HttpTool = {
    
        let tools = HttpTool()
        return tools
        
    }()
}



//MARK: - GET和POST的简单封装
extension HttpTool {
    /// 发送POST请求
    func postRequest(urlString: String, params : [String : Any], finished : @escaping (_ response : [String : AnyObject]?,_ error: NSError?)->()) {
        
        
        Alamofire.request(urlString, method: .post, parameters: params)
            .responseJSON { (response) in
                
                if response.result.isSuccess{
                    
                    finished(response.result.value as? [String : AnyObject],nil)
                }else{
                    
                    finished(nil,response.result.error as NSError?)
                    
                }
        }

    }
    
    //发送get请求
    
    func getRequest(urlString: String, params : [String : Any], finished : @escaping (_ response : [String : AnyObject]?,_ error: NSError?)->()) {
        
        
        Alamofire.request(urlString, method: .get, parameters: params)
            .responseJSON { (response) in
                
                if response.result.isSuccess{
                    
                    finished(response.result.value as? [String : AnyObject],nil)
                }else{
                    
                    finished(nil,response.result.error as NSError?)
                    
                }
        }
    }
    

}





