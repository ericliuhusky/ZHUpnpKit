//
//  Arguments.swift
//  
//
//  Created by lzh on 2022/7/5.
//

import SwiftUpnpTools

enum ArgumentsKey: String {
    case instanceID = "InstanceID"
    case currentURI = "CurrentURI"
    case currentURIMetaData = "CurrentURIMetaData"
    case speed = "Speed"
    case unit = "Unit"
    case target = "Target"
    case channel = "Channel"
    case desiredVolume = "DesiredVolume"
}

typealias Arguments = [ArgumentsKey: String]

extension Arguments {
    private var rawValue: [String: String] {
        mapKeysAndValues { key, value in
            (key.rawValue, value)
        }
    }
    
    var fields: OrderedProperties {
        rawValue.reduce(OrderedProperties()) { partialResult, pairs in
            partialResult[pairs.key] = pairs.value
            return partialResult
        }
    }
}

fileprivate extension Dictionary {
    func mapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)) rethrows -> [K: V] {
        [K: V](uniqueKeysWithValues: try map(transform))
    }
}
