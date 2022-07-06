//
//  UPnPControlPoint+AVTransport.swift
//  
//
//  Created by lzh on 2022/7/6.
//

import SwiftUpnpTools

extension UPnPControlPoint {
    func setAVTransportURI(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        avTransport(device: device, action: .setAVTransportURI, arguments: arguments, completionHandler: completionHandler)
    }
    
    func play(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        avTransport(device: device, action: .play, arguments: arguments, completionHandler: completionHandler)
    }
    
    func seek(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        avTransport(device: device, action: .seek, arguments: arguments, completionHandler: completionHandler)
    }
    
    func pause(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        avTransport(device: device, action: .pause, arguments: arguments, completionHandler: completionHandler)
    }
    
    func stop(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        avTransport(device: device, action: .stop, arguments: arguments, completionHandler: completionHandler)
    }
    
    func getPositionInfo(device: UPnPDevice, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        avTransport(device: device, action: .getPositionInfo, arguments: arguments, completionHandler: completionHandler)
    }
    
    func avTransport(device: UPnPDevice, action: Action, arguments: Arguments, completionHandler: (UPnPActionInvoke.invokeCompletionHandler)?) {
        guard let service = device.getService(type: "urn:schemas-upnp-org:service:AVTransport:1") else {
            print("[ERR] Service not found")
            return
        }
        
        invoke(service: service,
               actionName: action.rawValue,
               fields: arguments.fields,
               completionHandler: completionHandler)
    }
}
