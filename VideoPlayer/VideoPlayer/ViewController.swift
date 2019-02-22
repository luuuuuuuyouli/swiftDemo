//
//  ViewController.swift
//  VideoPlayer
//
//  Created by shenyong on 2019/2/20.
//  Copyright © 2019年 shenyong. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class ViewController: UIViewController {
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoPlayButton = UIButton()
        videoPlayButton.frame = CGRect.init(x: 100, y: 100, width: 100, height: 20)
        videoPlayButton.setTitle("播放视频", for: UIControl.State.normal)
        videoPlayButton.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: UIControl.State.normal)
        videoPlayButton.addTarget(self, action: #selector(playVideo), for: UIControl.Event.touchUpInside)
        self.view.addSubview(videoPlayButton)
        
        let musicButton = UIButton()
        musicButton.frame = CGRect.init(x: 100, y: 200, width: 100, height: 20)
        musicButton.setTitle("播放音乐", for: UIControl.State.normal)
        musicButton.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: UIControl.State.normal)
        musicButton.addTarget(self, action: #selector(playMusic), for: UIControl.Event.touchUpInside)
        self.view.addSubview(musicButton)
        
        let pauseButton = UIButton()
        pauseButton.frame = CGRect.init(x: 100, y: 300, width: 100, height: 20)
        pauseButton.setTitle("暂停播放", for: UIControl.State.normal)
        pauseButton.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: UIControl.State.normal)
        pauseButton.addTarget(self, action: #selector(pauseMusic), for: UIControl.Event.touchUpInside)
        self.view.addSubview(pauseButton)
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        //初始化播放器
        let contentPath = Bundle.main.path(forResource: "live", ofType: "mp3")
        let contentUrl = URL(fileURLWithPath: contentPath!)
    
        playerItem = AVPlayerItem.init(url: contentUrl)
        player = AVPlayer.init(playerItem: playerItem!)
        print("播放时长=\(String(describing: playerItem?.asset.duration ?? nil))")
        
        let image = #imageLiteral(resourceName: "thumb.jpg")
        let artWork = MPMediaItemArtwork.init(boundsSize:image.size) { (CGSize) -> UIImage in
            return image
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
             MPMediaItemPropertyTitle:"皇后大道东",
             MPMediaItemPropertyArtist:"罗大佑",
             MPMediaItemPropertyArtwork:artWork,
        ]
        //歌曲进度条
        
    }
    
    @objc func playVideo(){
        let player = AVPlayer.init(url: NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")! as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.present(playerController, animated: true) {}
    }
    
    @objc func playMusic(){
        
        player?.play()
    }
    
    @objc func pauseMusic(){
        
         player?.pause()
    }
    //锁屏界面的暂停播放
    override func remoteControlReceived(with event: UIEvent?) {
        switch event?.subtype{
        case .remoteControlPlay?:
            player?.play()
        case .remoteControlPause?:
            player?.pause()
        default:
            break
        }
    }


}

