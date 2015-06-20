//
//  DetailViewController.swift
//  SegueTableViewDetailPic02
//
//  Created by 井上航 on 2015/06/16.
//  Copyright (c) 2015年 Wataru.I. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var selectedImg: UIImage?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //既存のCellが選択された場合
//        let backButtonItem = UIBarButtonItem(title: "ほげ", style: .Plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = backButtonItem
        //コードで戻るボタンを生成　ここまで
        
        imageView?.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        //新規作成の場合
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}