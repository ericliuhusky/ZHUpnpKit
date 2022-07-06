//
//  MediaController.swift
//
//
//  Created by lzh on 2022/7/6.
//

import SwiftUpnpTools

public class MediaController {
    let cp = UPnPControlPoint()
    var device: UPnPDevice
    
    public init(device: UPnPDevice) {
        self.device = device
    }
}

public extension MediaController {
    func play(url: String, meta: String, startPosition: Int) {
        let uriArg: Arguments = [
            .instanceID: "0",
            .currentURI: url,
            .currentURIMetaData: meta
        ]
        let playArg: Arguments = [
            .instanceID: "0",
            .speed: "1"
        ]
        
        cp.setAVTransportURI(device: device, arguments: uriArg) { res, err in
            self.cp.play(device: self.device, arguments: playArg) { res, err in
                // TODO: 播放之后立刻seek不起作用，看是延时还是监听返回播放状态之后再重新seek
//                self.seek(second: startPosition)
            }
        }
    }
    
    func pause() {
        let arg: Arguments = [
            .instanceID: "0"
        ]
        cp.pause(device: device, arguments: arg) { res, err in
            
        }
    }
    
    func play() {
        let arg: Arguments = [
            .instanceID: "0",
            .speed: "1"
        ]
        cp.play(device: device, arguments: arg) { res, err in
            
        }
    }
    
    func stop() {
        let arg: Arguments = [
            .instanceID: "0"
        ]
        cp.stop(device: device, arguments: arg) { res, err in
            
        }
    }
    
    func seek(second: Int) {
        func computeTarget(_ s: Int) -> String {
            var m = s / 60
            let s = s % 60
            let h = m / 60
            m = m % 60
            return String(format: "%02d:%02d:%02d", h, m, s)
        }
        let arg: Arguments = [
            .instanceID: "0",
            .unit: "REL_TIME",
            .target: computeTarget(second)
        ]
        cp.seek(device: device, arguments: arg) { res, err in
            
        }
    }
}

public extension MediaController {
    func setVolume(_ volume: Int) {
        let arg: Arguments = [
            .instanceID: "0",
            .channel: "Master",
            .desiredVolume: String(volume)
        ]
        cp.setVolume(device: device, arguments: arg) { res, err in
            
        }
    }
    
    func addVolume() {
        let arg: Arguments = [
            .instanceID: "0",
            .channel: "Master",
        ]
        cp.getVolume(device: device, arguments: arg) { res, err in
            guard let volumeStr = res?["CurrentVolume"],
                  var volume = Int(volumeStr) else {
                return
            }
            volume += 1
            self.setVolume(volume)
        }
    }
    
    func reduceVolume() {
        let arg: Arguments = [
            .instanceID: "0",
            .channel: "Master",
        ]
        cp.getVolume(device: device, arguments: arg) { res, err in
            guard let volumeStr = res?["CurrentVolume"],
                  var volume = Int(volumeStr) else {
                return
            }
            volume -= 1
            self.setVolume(volume)
        }
    }
}
