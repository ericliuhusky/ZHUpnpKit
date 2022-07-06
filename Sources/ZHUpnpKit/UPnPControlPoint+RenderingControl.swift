//
//  UPnPControlPoint+RenderingControl.swift
//  
//
//  Created by lzh on 2022/7/6.
//

import SwiftUpnpTools

extension UPnPControlPoint {
    func setVolume(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        renderingControl(device: device, action: .setVolume, arguments: arguments, completionHandler: completionHandler)
    }
    
    func getVolume(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        renderingControl(device: device, action: .getVolume, arguments: arguments, completionHandler: completionHandler)
    }
    
    func renderingControl(device: UPnPDevice, action: Action, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        guard let service = device.getService(type: "urn:schemas-upnp-org:service:RenderingControl:1") else {
            print("[ERR] Service not found")
            return
        }
        
        invoke(service: service,
               actionName: action.rawValue,
               fields: arguments.fields,
               completionHandler: completionHandler)
    }
}
