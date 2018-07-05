//
//  DisplayViewController.swift
//  SlideshowApp
//
//  Created by 上田　護 on 2018/07/05.
//  Copyright © 2018年 mamoru.ueda. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet weak var zoom: UIImageView!
    var photoName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        zoom.image = UIImage(named: photoName)
        // Do any additional setup after loading the view.
    }

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
