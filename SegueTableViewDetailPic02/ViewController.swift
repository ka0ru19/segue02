//
//  ViewController.swift
//  SegueTableViewDetailPic02
//
//  Created by 井上航 on 2015/06/15.
//  Copyright (c) 2015年 Wataru.I. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView : UITableView?
    
    let imgArray: NSArray = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png"]
    
    let label2Array: NSArray = ["2013/8/23 16:04","2013/8/23 16:15","2013/8/23 16:47","2013/8/23 17:10",
        "2013/8/23 17:15","2013/8/23 17:21","2013/8/23 17:33","2013/8/23 17:41"]
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Table Viewのセルの数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する!
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成 cell deque
        var cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as UITableViewCell
        
        var img = UIImage(named:"\(imgArray[indexPath.row])")
        // Tag番号 1 で UIImageView インスタンスの生成
        var imageView = tableView.viewWithTag(1) as UIImageView
        imageView.image = img
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label1 = tableView.viewWithTag(2) as UILabel
        label1.text = "No.\(indexPath.row + 1)"
        
        // Tag番号 3 で UILabel インスタンスの生成
        var label2 = tableView.viewWithTag(3) as UILabel?
        label2?.text = "\(label2Array[indexPath.row])"
        
        return cell
    }
    // Cell が選択された場合
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(imgArray[indexPath.row])")
        
        // DetailViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("ToDetailViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToDetailViewController") {
            let DetailVC: DetailViewController = segue.destinationViewController as DetailViewController
            // DetailViewController のselectedImgに選択された画像を設定する
            DetailVC.selectedImg = selectedImage
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
