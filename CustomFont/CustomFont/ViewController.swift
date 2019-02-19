//
//  ViewController.swift
//  CustomFont
//
//  Created by shenyong on 2019/2/18.
//  Copyright © 2019年 shenyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel()
    var fonValue:CGFloat! = 18.0
    override func viewDidLoad() {
        super.viewDidLoad()
        label.textColor = UIColor.red
        label.text = "hello I am Mr.shen";
        label.frame = CGRect.init(x: 100, y: 100, width: 200, height: 20)
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 18);
        self.view.addSubview(label)
        
        let button = UIButton()
        button.frame = CGRect.init(x: 100, y: 300, width: 200, height: 30)
        button.setTitle("click me to change label font", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(changeFont), for: UIControl.Event.touchUpInside)
        button.setTitleColor(UIColor.orange, for: UIControl.State.normal);
        self.view.addSubview(button)
        
        
    }
    @objc func changeFont() {
        fonValue = 1 + fonValue
        label.font = UIFont.systemFont(ofSize:fonValue);
    }


}

