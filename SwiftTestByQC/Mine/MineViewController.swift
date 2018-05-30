//
//  MineViewController.swift
//  SwiftTest18-1-5
//
//  Created by EricZhang on 2018/1/8.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//

/*
 *本类主要实现tableview
 *和使用snapkit自动布局
 *
 */




import UIKit

class MineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    

    
    fileprivate var  table:UITableView!
    fileprivate var  sendBtn:UIButton!
    
    
    let arry:[String] = ["我是谁","我从哪里来","要到哪里去"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "我的"
        
        //设置UItabView的位置
        table = UITableView()
        self.view.addSubview(table)
        //这个类似于masonry
        table.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view)
            make.width.equalTo(CKWIDTH)
            make.height.equalTo(350+64+100)
        }
        self.table.backgroundColor = UIColor.white
        self.table.separatorStyle = UITableViewCellSeparatorStyle.none
        //设置数据源
        self.table.dataSource = self;
        
        //设置代理
        self.table.delegate = self;
        
        self.table.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        table?.tableHeaderView = headerImage
        
        sendBtn = UIButton()
        sendBtn.setTitle("logout", for: .normal)
        sendBtn.setTitleColor(UIColor.white, for: .normal)
        sendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view .addSubview(sendBtn)
        sendBtn.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.table.snp.bottom).offset(20)
            make.width.equalTo(CKWIDTH*2/3)
            make.height.equalTo(40)
            
        }
        sendBtn.backgroundColor = RGBA(r: 32, g: 169, b: 242, a: 1)
        sendBtn.layer.cornerRadius = 5
        


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let indentifier = "MineCenterCell"
        var cell:MineTableViewCell! = tableView.dequeueReusableCell(withIdentifier: indentifier) as? MineTableViewCell
        if cell == nil {
            cell = MineTableViewCell(style: .default, reuseIdentifier: indentifier)
        }
        cell.titleLabel?.text = self.arry[indexPath.row]
        cell.linkLabel?.text = ">"
        
        
        return cell
        
    }
    //设置表头的高
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.table.deselectRow(at: indexPath as IndexPath, animated: true)//点击完成，取消高亮
    }

    
    
    //懒加载
    lazy var headerImage:UIImageView = {

        let headerImage = UIImageView()
        headerImage.setImageWith(nil, placeholder: UIImage(named:"cat"))
        headerImage.frame = CGRect.init(x:0,y:0,width:CKWIDTH,height:200)
        return headerImage
        
        
    }()
    
    
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
