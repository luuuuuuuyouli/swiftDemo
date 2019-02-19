//
//  ViewController.swift
//  watchDemo
//
//  Created by shenyong on 2019/2/18.
//  Copyright © 2019年 shenyong. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var timeLabel:UILabel!
    var timer:Timer!
    var labelNumber:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel = UILabel()
        timeLabel.frame = CGRect.init(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: 200);
        timeLabel.text = "0"
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.textColor = UIColor.init(red: 1, green: 211/255.0, blue: 200/255.0, alpha: 1);
        self.view.addSubview(timeLabel);
        
        let startButton = UIButton()
        startButton.frame = CGRect.init(x: 0, y: 200, width: UIScreen.main.bounds.size.width/2.0, height: 200)
        startButton.backgroundColor = UIColor.init(red: 130/255.0, green: 123/255.0, blue: 34/255.0, alpha: 1)
        startButton.setTitle("start", for: UIControl.State.normal)
        startButton.addTarget(self, action: #selector(startHander), for: UIControl.Event.touchUpInside)
        self.view.addSubview(startButton)
        
        let endButton = UIButton()
        endButton.frame = CGRect.init(x: UIScreen.main.bounds.size.width/2.0, y: 200, width: UIScreen.main.bounds.size.width/2.0, height: 200);
        endButton.setTitle("end", for: UIControl.State.normal)
        endButton.backgroundColor = UIColor.init(red: 90/255.0, green: 200/255.0, blue: 29/255.0, alpha: 1)
        endButton.addTarget(self, action: #selector(endHander), for: UIControl.Event.touchUpInside)
        self.view.addSubview(endButton)
        
        let resetButton = UIButton()
        resetButton.frame = CGRect.init(x: 100, y: 500, width: 100, height: 40);
        resetButton.setTitle("reset", for: UIControl.State.normal)
        resetButton.backgroundColor = UIColor.orange
        resetButton.layer.masksToBounds = true
        resetButton.layer.cornerRadius = 5.0
        resetButton.addTarget(self, action: #selector(resetHander), for: UIControl.Event.touchUpInside)
        self.view.addSubview(resetButton)
    
    }
    @objc func startHander(){
        if self.timer != nil{
            self.endHander()
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            self.labelNumber = self.labelNumber + 0.1
            self.timeLabel.text = String(format: "%.1f", self.labelNumber)
        })
        self.timer.fire()
    }
    @objc func endHander(){
        guard let timeDestory = self.timer else {
            return
        }
        timeDestory.invalidate()
    }
    @objc func resetHander(){
        self.labelNumber = 0
        self.timeLabel.text = "0"
        
    }


}

