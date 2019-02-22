//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by shenyong on 2019/2/21.
//  Copyright © 2019年 shenyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView.init(frame: self.view.bounds)
        imageView.image = #imageLiteral(resourceName: "samplePhoto.jpeg")
        imageView.isUserInteractionEnabled = true
    
        let scorllowView = UIScrollView.init(frame: self.view.bounds)
        scorllowView.maximumZoomScale = 4.0
        scorllowView.minimumZoomScale = 1.0
        scorllowView.contentSize = imageView.bounds.size
        scorllowView.delegate = self
        self.view.addSubview(scorllowView)
        
        scorllowView.addSubview(imageView)
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }


}

