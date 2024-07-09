//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/7/9.
//

import UIKit
import MobileVLCKit

final class ViewController: UIViewController {
    
    private let mediaURL = "https://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4"
    
    var mediaPlayer = VLCMediaPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediaPlayerSetting()
    }
    
    @objc func handlePlayPause(_ sender: UIBarButtonItem) {
                
        if mediaPlayer.isPlaying {
            playerButton(systemItem: .play)
            mediaPlayer.pause()
        } else {
            playerButton(systemItem: .pause)
            mediaPlayer.play()
        }
    }
}

// MARK: - VLCMediaPlayerDelegate
extension ViewController: VLCMediaPlayerDelegate {

    func mediaPlayerStateChanged(_ aNotification: Notification) {
        if mediaPlayer.state == .stopped { view.backgroundColor = .white }
    }
}

// MARK: - 小工具
private extension ViewController {
    
    /// 初始化設定
    func mediaPlayerSetting() {
        
        guard let url = URL(string: mediaURL) else { return }
        
        mediaPlayer.delegate = self
        mediaPlayer.drawable = view
        mediaPlayer.media = VLCMedia(url: url)
        
        playerButton(systemItem: .play)
    }
    
    /// 設定播放鈕
    /// - Parameter systemItem: UIBarButtonItem.SystemItem
    func playerButton(systemItem: UIBarButtonItem.SystemItem) {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: systemItem,
            target: self,
            action: #selector(Self.handlePlayPause)
        )
        
        navigationItem.rightBarButtonItem?.tintColor = .systemRed
    }
}
