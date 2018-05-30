//
//  HomeCollectionViewCell.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/11.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    var  titleLabel:UILabel?
    var  imageView:UIImageView?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let cellWidth:CGFloat = self.frame.size.width
        let cellHeight:CGFloat = self.frame.size.height
        self.imageView = UIImageView()
        self.addSubview(self.imageView!)
        self.imageView?.snp.makeConstraints({ (make) in
            
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-10)
            make.width.equalTo(cellWidth/3)
            make.height.equalTo(cellHeight/3)
            
        })
        self.imageView?.setImageWith(nil, placeholder: UIImage(named:"cat"))
        
        self.titleLabel = UILabel()
        self.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.top.equalTo((self.imageView?.snp.bottom)!).offset(10)
            make.width.equalTo(width)
            make.height.equalTo(13)
        })
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.titleLabel?.text = "新闻中心"
        self.titleLabel?.textAlignment = NSTextAlignment.center
 
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
