# WWSwiftMobileVLC

[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWSwiftMobileVLC) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

## [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- After packaging [MobileVLCKit](https://github.com/videolan/vlckit), use it [directly](https://medium.com/programmingbeauty/使用以及打包-mobilevlckit-1e93c73d1a3) on [SPM](https://artifacts.videolan.org/VLCKit/MobileVLCKit/).
- 將[MobileVLCKit](https://medium.com/@ashinwangboy/使用mobilevlckit遇到slow-loading時-該怎麼辦-6d20047f590c)打包後，直接在[SPM](https://www.chainhao.com.tw/swiftui_rtsp/)上使用。

![](./Example.gif)

## [Installation with Swift Package Manager - 安裝方式](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)

```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWSwiftMobileVLC.git", .upToNextMajor(from: "1.0.0"))
]
```

![](./Example.png)

## Example - 程式範例
```swift
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

extension ViewController: VLCMediaPlayerDelegate {

    func mediaPlayerStateChanged(_ aNotification: Notification) {
        if mediaPlayer.state == .stopped { view.backgroundColor = .white }
    }
}

private extension ViewController {
    
    func mediaPlayerSetting() {
        
        guard let url = URL(string: mediaURL) else { return }
        
        mediaPlayer.delegate = self
        mediaPlayer.drawable = view
        mediaPlayer.media = VLCMedia(url: url)
        
        playerButton(systemItem: .play)
    }
    
    func playerButton(systemItem: UIBarButtonItem.SystemItem) {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: systemItem,
            target: self,
            action: #selector(Self.handlePlayPause)
        )
        
        navigationItem.rightBarButtonItem?.tintColor = .systemRed
    }
}
```
