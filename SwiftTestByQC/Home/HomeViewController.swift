//
//  HomeViewController.swift
//  SwiftTest18-1-5
//
//  Created by QC on 2018/1/8.
//  Copyright © 2018年 BoYaXun. All rights reserved.
//


/*
 *本类主要实现collectionView
 *动态布局
 *这个类我还准备测试一下网络数据请求
 */


import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RGBA(r: 242, g: 242, b: 242, a: 1)
        // Do any additional setup after loading the view.
        self.title = "首页"
        myCollectionView()
        
        
        
    }
    
    
    func myCollectionView() {
        
        
        //自定义item的FlowLayout
        let flowLayout = UICollectionViewFlowLayout()
        //设置item的size
        flowLayout.itemSize = CGSize.init(width:CKWIDTH/4,height:CKWIDTH/4)
        //设置item的排列方式
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置item的四边边距
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0)
        //列间距
        flowLayout.minimumLineSpacing = 0
        //行间距
        flowLayout.minimumInteritemSpacing = 0
        //设置页头尺寸
        //flowLayout.headerReferenceSize = CGSize.init(width:,height:)
        //设置页尾尺寸
        //flowLayout.footerReferenceSize = CGSize.init(width: , height: )
        //自定义uicollectionview的位置
        
        let collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 64, width: CKWIDTH, height: CKHEIGHT - 64),collectionViewLayout:flowLayout)
        self.view.addSubview(collectionView)

        
        //设置背景颜色
        collectionView.backgroundColor = RGBA(r: 242, g: 242, b: 242, a: 1)
        //设置垂直滚动是否滚到item的最底部
        collectionView.alwaysBounceVertical = true
        //设置水平滚动是否滚到item的最右边
        collectionView.alwaysBounceHorizontal = true
        //设置数据源对象
        collectionView.dataSource = self
        //设置代理对象
        collectionView.delegate = self
        //设置uicollectionView的单元格点击
        collectionView.allowsSelection = true
        //设置uicollectionView的单元格多选
        collectionView.allowsMultipleSelection = false
        //开启uicollectionView的分页显示效果
        collectionView.isPagingEnabled = true
        //注册uicollectionviewcell
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "reusable")
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath)
        
        return cell
        
    }
    //分区头高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: CKWIDTH, height: 200)
    }
    
    //分区头设置
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview:UICollectionReusableView!
        if kind == UICollectionElementKindSectionHeader{
            
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusable", for: indexPath)
            reusableview.addSubview(headerImage)

        }
        return reusableview

    }
    
    
    
    //懒加载一个imageView
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
