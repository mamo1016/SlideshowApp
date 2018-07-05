//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 上田　護 on 2018/07/05.
//  Copyright © 2018年 mamoru.ueda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slide: UIImageView!
    @IBOutlet var preButton: UIButton!
    @IBOutlet var nexButton: UIButton!
    @IBOutlet var slideButton: UIButton!
    
//    var imageArray: [String] = ["コテージ.jpg"]
    var imageArray = [String]()
    var index: Int = 0
    var timer_sec: Int = 0
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray.append("コテージ.jpg")
        imageArray.append("橋.jpg")
        imageArray.append("湖.jpg")
        slide.image = UIImage(named: imageArray[0])
        slideButton.setTitle("▶️", for: .normal) // ボタンのタイトル
//        slideButton.setTitleColor(UIColor.red, for: .normal) // タイトルの色
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("test")
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
        slideButton.setTitle("▶️", for: .normal) // ボタンのタイトル

    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nex), userInfo: nil, repeats: true)
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する                         DisplayViewControllerクラスに変換すると言う意味
        let displayViewController:DisplayViewController = segue.destination as! DisplayViewController
        displayViewController.photoName = imageArray[index]
    }
//    segueを使って戻ってきたときに呼ばれるメソッド
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
//        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nex), userInfo: nil, repeats: true)
        // 有効化
        preButton.isEnabled = true
        nexButton.isEnabled = true
        
    }
    
    @IBAction func pre() {
        
        index -= 1
        if index == -1{
            index=2
        }
        slide.image = UIImage(named: imageArray[index])
    }
    @objc @IBAction func nex() {
        index += 1
        if index == 3{
            index=0
        }
        slide.image = UIImage(named: imageArray[index])
    }
    
    @IBAction func startSlide(){
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nex), userInfo: nil, repeats: true)
            // 無効化
            preButton.isEnabled = false
            nexButton.isEnabled = false
            slideButton.setTitle("⏸", for: .normal) // ボタンのタイトル

        }else{
            self.timer.invalidate()
            self.timer = nil
            // 有効化
            preButton.isEnabled = true
            nexButton.isEnabled = true
            slideButton.setTitle("▶️", for: .normal) // ボタンのタイトル

        }
    }
}

