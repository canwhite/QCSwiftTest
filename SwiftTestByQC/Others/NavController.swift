//
//  NavController.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/9.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit

class NavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.isNavigationBarHidden = false //头部的导航栏
        self.navigationBar.backgroundColor = UIColor.blue
        self.isToolbarHidden = true //底部的导航栏

        
    }
    
    
    // Mark：重写跳转
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0{
            //跳转后隐藏
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
        
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
