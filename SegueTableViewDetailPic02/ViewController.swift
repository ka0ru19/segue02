//
//  ViewController.swift
//  SegueTableViewDetailPic02
//
//  Created by 井上航 on 2015/06/15.
//  Copyright (c) 2015年 Wataru.I. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    /*
    let calendar = NSCalendar(identifier: NSGregorianCalendar)!
    
    class Event {
        
        let mainImage: UIImage? //メインの写真 //?はinitに必須, nilのある場合
        let name: String //名前
        // let data: NSMutableData //登録日時
        // var data: NSData?
        
        // イニシャライザ
        init(mainImage: UIImage, name: String/*, data: NSData*/) {
            self.mainImage = nil
            self.name = name
//            self.data = ......
//            self.data = nil
        }
        
        // 説明
//        func description() -> String {
//            return "\(name) Lv.\(level)"
    }
//    
//    let m = Monster()
//    println(m.description()) // 不明 Lv.1
*/
    
    @IBOutlet var tableView : UITableView!
    
    let imgArray: NSMutableArray = ["0.png","1.png","2.png","3.png","4.png","5.png","6.png","7.png"]
    
    var label2Array = ["2013/8/23 16:04","2013/8/23 16:15","2013/8/23 16:47","2013/8/23 17:10",
        "2013/8/23 17:15","2013/8/23 17:21","2013/8/23 17:33","2013/8/23 17:41"]
    
    var selectedImage: UIImage?
    
//    var eventArray = [Event]()

//    eventArray.append("0.png","写真その０"/*,0*/)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Addボタンの生成
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
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
    
//    //
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow() {
//                let object = objects[indexPath.row] as NSDate
//                (segue.destinationViewController as DetailViewController).detailItem = object
//            }
//        }
//    }
    
    
    // Add が選択された場合
    func insertNewObject(sender: AnyObject) {
        
        let now = NSDate() //現在時刻を取得して文字列に変換
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm" //"yyyy/MM/dd HH:mm:ss"
        let nowString = formatter.stringFromDate(now)
        
        label2Array.insert(nowString, atIndex: 0)
        selectedImage = nil
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }
    // DetailViewController に遷移
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToDetailViewController") {
            if selectedImage != nil{
                let DetailVC: DetailViewController = segue.destinationViewController as DetailViewController
                // DetailViewController のselectedImgに選択された画像を設定する
                DetailVC.selectedImg = selectedImage
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
