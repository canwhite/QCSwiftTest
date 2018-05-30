//
//  TabBarController.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/9.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//  如果你发送setTranslucent：YES到一个不透明的自定义背景图像的bar，它将适用系统不透明度小于1.0的图像。如果将setTranslucent：NO发送到具有半透明自定义背景图像的条形图，则会使用条形图的barTintColor（如果已定义）为图像提供不透明的背景
        self.tabBar.isTranslucent = true
        setUpTabbar()
        setChildVC()
        
        
        
    }
    
    fileprivate func setUpTabbar(){
        
        
        //根据颜色值画条线
        let rect = CGRect(x:0,y:0,width:CKWIDTH,height:0.5)
        //作图
        UIGraphicsBeginImageContext(rect.size)
        //内容
        let context = UIGraphicsGetCurrentContext()!
        //填充颜色
        context.setFillColor(UIColor.gray.cgColor)
        //填充
        context.fill(rect)
        
        let  image = UIGraphicsGetImageFromCurrentImageContext()
        //结束
        UIGraphicsEndImageContext()
        
        //这两个很重要，缺一不可
        self.tabBar.shadowImage = image
        self.tabBar.backgroundImage = UIImage()
        
        //设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, 0.0)
        
        //tabbar 底部工具栏背景颜色
        self.tabBar.backgroundColor = UIColor.white
        
        //未选中
        let unDict:NSDictionary = [NSAttributedStringKey.foregroundColor : UIColor.gray,NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)]
        UITabBarItem.appearance().setTitleTextAttributes(unDict as? [NSAttributedStringKey : Any], for: .normal)
        
        //选中
        let selDic:NSDictionary = [NSAttributedStringKey.foregroundColor:UIColor.blue,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)]
        UITabBarItem.appearance().setTitleTextAttributes(selDic as? [NSAttributedStringKey:Any], for: .selected)
        
        
        //设置选中时图片颜色必须设置（系统默认选中蓝色）
//        self.tabBar.tintColor = UIColor.black
        

        
        
    }
    
    //添加控制器
    fileprivate func setChildVC(){
        
        //首页
        setupOneChildViewController(HomeViewController(), title: "首页", normalImage: "home_un", selectedImage: "home_sel")
        //服务
        setupOneChildViewController(ServiceViewController(), title: "服务", normalImage: "service_un", selectedImage: "service_sel")
        //我的
        setupOneChildViewController(MineViewController(), title: "我的", normalImage: "mine_un", selectedImage: "mine_sel")

        
    }

    //添加控制器的方法
    fileprivate func setupOneChildViewController(_ vc:UIViewController,title:String,normalImage:String,selectedImage:String ){
        
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named:normalImage)
        vc.tabBarItem.selectedImage = UIImage(named:selectedImage)
        let baseNav = NavController(rootViewController:vc)
        addChildViewController(baseNav)
        
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
