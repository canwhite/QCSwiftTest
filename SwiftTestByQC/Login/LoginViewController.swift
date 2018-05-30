//
//  FirstTestViewController.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/5.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit
/*
 *本类致力于写一些简单的东西，基本的控件要会使用不是？
 *背景图
 *介绍label
 *输入框1，2，第二个用snapkit布局
 *跳转按钮
 *登录请求
 */
@objcMembers//新特性
class LoginViewController: UIViewController,UITextFieldDelegate {
    
    //在这里我们初始化一些变量
    fileprivate var bgImageView = UIImageView()
    fileprivate var introLabel = UILabel()
    fileprivate var sendBtn = UIButton()
    fileprivate var textfield = UITextField()
    fileprivate var password = UITextField()
    fileprivate var nameStr:String = ""
    fileprivate var pwStr:String = ""
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = RGBA(r: 32, g: 169, b: 242, a: 1)
        
        initUI()

    }

    //初始化界面
    fileprivate func initUI(){
        
        
        
        
        let width:CGFloat! = self.view.frame.size.width
        let height:CGFloat! = self.view.frame.size.height

        
        //背景图
        
        bgImageView.setImageWith(nil, placeholder: UIImage(named:"login_bg"))
        bgImageView.frame = CGRect.init(x:20,y:height-300,width:width - 40,height:200)
        self.view.addSubview(bgImageView);
        
        
        //介绍label
        introLabel.text = "登录"
        introLabel.font = UIFont.systemFont(ofSize: 18)
        introLabel.textColor = UIColor.black
        
        introLabel.textAlignment = NSTextAlignment.center
        introLabel.frame = CGRect.init(x:20,y:50,width:width-40,height:15)
        self.view.addSubview(introLabel)
        
        
        
        
        //加一个提交按钮

        sendBtn.setTitle("登录", for: .normal)
        sendBtn.setTitleColor(UIColor.black, for:.normal)
        sendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(sendBtn)
        sendBtn.addTarget(self, action:#selector(btnClick(_:)), for:.touchUpInside)
        sendBtn.frame = CGRect.init(x:20,y:350,width:width-40,height:45)
        sendBtn.backgroundColor = UIColor.yellow
        sendBtn.layer.cornerRadius = 45/2
        sendBtn.layer.borderWidth = 1
        
        
        
        
        
        
        //name

        textfield.placeholder = "请输入学号"
        textfield.font = UIFont.systemFont(ofSize: 14)
        //设置边框模样为圆角矩形
        textfield.borderStyle = UITextBorderStyle.roundedRect
        textfield.frame = CGRect.init(x:20,y:250,width:width-40,height:35)
        //当文字超过文本框宽度时，自动调整文字大小
        textfield.adjustsFontSizeToFitWidth = true
        //最小可缩小的字号
        textfield.minimumFontSize = 10
        textfield.tag = 100
        //左对齐
        textfield.textAlignment = .left
        self.view.addSubview(textfield)
        //清除按钮，编辑时出现：.whileEditing 编辑时不出现，编辑后出现：.unlessEditing
        //一直显示清除按钮
        textfield.clearButtonMode = .always

        //设置文本关联的键盘类型
        textfield.keyboardType = UIKeyboardType.default

        //设置return键的样式
        textfield.returnKeyType = UIReturnKeyType.done //表示完成输入
        
        
        //password
        
        password.placeholder = "请输入密码"
        password.font = UIFont.systemFont(ofSize: 14)
        password.borderStyle = UITextBorderStyle.roundedRect
        //设置位置
        password.frame = CGRect.init(x:20,y:295,width:width-40,height:35)
        password.tag = 101
        //当文字超过文本框宽度时，自动调整文字大小
        password.adjustsFontSizeToFitWidth = true
        //最小可缩小的字号
        password.minimumFontSize = 10
        //左对齐
        password.textAlignment = .left
        self.view.addSubview(password)
        //清除按钮，编辑时出现：.whileEditing 编辑时不出现，编辑后出现：.unlessEditing
        //一直显示清除按钮
        password.clearButtonMode = .always

        //设置文本关联的键盘类型
        password.keyboardType = UIKeyboardType.default

        //设置return键的样式
        password.returnKeyType = UIReturnKeyType.done //表示完成输入
        
        
        

        
    }
    //MARK: - 最后的登录按钮，网络请求
    func btnClick(_ btn:UIButton){
        
        print("我点击了按钮")
        //存储登录状态,并切换到tabbar

        //测试用201434900033 pw:123456
        let dic:NSDictionary = ["username":textfield.text as Any,"password":password.text as Any]
    HttpTool.shareInstance.postRequest(urlString:String(format:"%@%@",HOSTURL,QCLOAD), params: dic as! [String : Any]) { (response:[String:AnyObject]?, error: NSError?) in
//            ["errorMessage": 22b8e08fbfaf4d9aafee18167949e86c, "errorCode": 2]
        //这个算是没有model的解析
        let str:String = response!["errorMessage"] as! String
        print(str)
        
        //然后我们写一个有model的解析        //外部用数组或者字符串接收
        //as? [[String :Any]]  转化为以字典为元素的数组
        //as? [String :Any]    转化为字典
        let model = LoginModel()
        model.errorCode = response?["errorCode"] as! NSInteger
        model.errorMessage = response?["errorMessage"] as! String

        //它只是一个一般的类，需要初始化
        let qc:QCProgressHUD = QCProgressHUD()
        
        //我们在这里存一下userId
        if model.errorCode  == 0{

            qc.initWithView(view: self.view, text: "请求数据失败", duration: 3)
            
        }else{
            saveLoginMark(value:true)
            //因为桥节好了三方所以也可以这样使用
            //SVProgressHUD.showSuccess(withStatus: "请求数据成功")
            qc.initWithView(view: self.view, text: "请求数据成功", duration: 3)
            saveUserId(value:model.errorMessage)
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.TabBarViewControllerShow()
            
            
        }
        
        }

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
