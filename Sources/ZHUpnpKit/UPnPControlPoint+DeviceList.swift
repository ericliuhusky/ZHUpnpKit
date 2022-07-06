//
//  UPnPControlPoint+DeviceList.swift
//  
//
//  Created by lzh on 2022/7/6.
//

import SwiftUpnpTools
import Foundation

public extension UPnPControlPoint {
    func on(updateDevices handler: (([UPnPDevice]) -> Void)?) {
        on(addDevice: { device in
            DispatchQueue.main.async {
                let devices = self.presentableDevices.values.sorted {
                    ($0.friendlyName ?? "") < ($1.friendlyName ?? "")
                }
                handler?(devices)
            }
        })
        
        on(removeDevice: { device in
            DispatchQueue.main.async {
                let devices = self.presentableDevices.values.sorted {
                    ($0.friendlyName ?? "") < ($1.friendlyName ?? "")
                }
                handler?(devices)
            }
        })
    }
}
