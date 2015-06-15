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
    var selectedImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView?.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}