//
//  DetailViewController.swift
//  SegueTableViewDetailPic02
//
//  Created by 井上航 on 2015/06/16.
//  Copyright (c) 2015年 Wataru.I. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var selectedImg: UIImage?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //既存のCellが選択された場合
//        let backButtonItem = UIBarButtonItem(title: "ほげ", style: .Plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = backButtonItem
        //コードで戻るボタンを生成　ここまで
        
        if selectedImg == nil { //新規作成の場合
            self.pickImageFromCamera()
            self.pickImageFromLibrary()
            
        }else{
            imageView?.image = selectedImg
            // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
            imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        }
        
    }
    
    // 写真を撮ってそれを選択
    func pickImageFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    // ライブラリから写真を選択する
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}