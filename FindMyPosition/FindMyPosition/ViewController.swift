//
//  ViewController.swift
//  FindMyPosition
//
//  Created by shenyong on 2019/2/19.
//  Copyright © 2019年 shenyong. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{
     let loactionManage = CLLocationManager()
     let geocdoer = CLGeocoder()
     let loactionLabel = UILabel()
     let addrsssLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let startButton = UIButton()
        startButton.frame = CGRect.init(x: 100, y: 100, width: 200, height: 30)
        startButton.setTitle("Find My Position", for: UIControl.State.normal)
        startButton.addTarget(self, action: #selector(findMyPostion), for: UIControl.Event.touchUpInside)
        startButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.view.addSubview(startButton)
        
        loactionLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        loactionLabel.textAlignment = NSTextAlignment.center
        loactionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loactionLabel.frame = CGRect.init(x: 0, y: 200, width: self.view.bounds.width, height: 30)
        self.view.addSubview(loactionLabel)
        
        addrsssLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addrsssLabel.frame = CGRect.init(x:0, y: 300, width: self.view.bounds.width, height: 30)
        addrsssLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        addrsssLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(addrsssLabel)
    
        loactionManage.delegate = self
        
    }
    @objc func findMyPostion(){
        loactionManage.requestAlwaysAuthorization()
        loactionManage.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lonactionArray : NSArray = locations as NSArray
        let currntLoaction = lonactionArray.lastObject as! CLLocation
        loactionLabel.text = "lat:\(currntLoaction.coordinate.latitude),lng:\(currntLoaction.coordinate.longitude)"
        reverseGeocode(loaction: currntLoaction)
        
    }
    func reverseGeocode(loaction:CLLocation){
        geocdoer.reverseGeocodeLocation(loaction) { (placeMark, error) in
            if error == nil{
                let addressArray = placeMark! as NSArray
                let mark = addressArray.lastObject as! CLPlacemark
    
                let addressStr = "\(mark.country ?? "无"),\(mark.administrativeArea ?? "无"),\(mark.subAdministrativeArea ?? "无")"
                self.addrsssLabel.text = addressStr
                
            }
        }
        
    }

}

