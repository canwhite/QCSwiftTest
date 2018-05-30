//
//  MineTableViewCell.swift
//  SwiftTest18-1-5
//
//  Created by EricZhang on 2018/1/9.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    
    
    var titleLabel:UILabel?
    var linkLabel:UILabel?
    var lineLabel:UILabel?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.titleLabel = UILabel()
        self.contentView.addSubview(self.titleLabel!)
        
        
        self.linkLabel = UILabel()
        self.contentView.addSubview(self.linkLabel!)

        self.lineLabel = UILabel()
        self.contentView.addSubview(self.lineLabel!)
        
        
        setupViews()
        
    }
    
    
    //刚开始会报错，后来加了一段这个东西
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //这里来设置位置
    func setupViews(){
        
        //设置titleLabel
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(20)
        })
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        
        //设置linkLabel
        
        self.linkLabel?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-20)
            
        })
        self.linkLabel?.font = UIFont.systemFont(ofSize: 13)
        self.linkLabel?.text = ">"
        
        
        self.lineLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.bottom.equalTo(self).offset(-1)
            make.height.equalTo(1)
        })
        self.lineLabel?.backgroundColor = RGBA(r: 242, g: 242, b: 242, a: 1)
        

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
