//
//  ViewController.swift
//  MRDPopView
//
//  Created by disappearping on 2015/10/13.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var blackView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        blackView = UIView(frame: CGRectMake(100, 200, 100, 100))
        blackView!.backgroundColor = UIColor.blackColor()
        self.view.addSubview(blackView!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

