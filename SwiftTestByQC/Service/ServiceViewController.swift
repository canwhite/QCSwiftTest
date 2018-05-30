//
//  ServiceViewController.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/8.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//
/*
 *这个类写一些图片选择器啊，时间选择器啊等一些相关的工具
 *
 */

import UIKit
//先遵守协议
class ServiceViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    fileprivate var photoBtn:UIButton!
    fileprivate var alertController:UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = RGBA(r: 242, g: 242, b: 242, a: 1)
        self.title = "工具"
        
        
        //创建一个可以调取相机的按钮
        let width:CGFloat = (CKWIDTH-60)/2
        
        
        self.photoBtn = UIButton()
        self.view.addSubview(self.photoBtn)
        self.photoBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.view).offset(84)
            make.width.equalTo(width)
            make.height.equalTo(width)
        }
        
        self.photoBtn.setTitle("图片获取", for: .normal)
        self.photoBtn.setTitleColor(UIColor.white, for: .normal)
        self.photoBtn.addTarget(self, action:#selector(photoClick(_:)), for: .touchUpInside)
        self.photoBtn.backgroundColor = RGBA(r: 32, g: 169, b: 242, a: 1)

    
    }
    //按钮点击事件
    @objc func photoClick(_ btn:UIButton)  {
        
        var alert : UIAlertController!
        alert = UIAlertController.init(title: "提示", message: "添加照片", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel) { (action:UIAlertAction) in
            
        }
        let cameraAction = UIAlertAction.init(title: "拍照", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            
        }
        let albumAction = UIAlertAction.init(title: "相册", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(cameraAction)
        alert.addAction(albumAction)
        
        self.present(alert, animated: true, completion: nil)
        

        
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
