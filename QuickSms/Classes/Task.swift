//
//  Task.swift
//  QuickSms
//
//  Created by emmanuel.kehinde on 07/03/2018.
//

import Foundation

public class Task<T> {
    
    public var eventHandlers: [EventHandler]
    
    public init() {
        eventHandlers = [EventHandler]()
    }
    
    public typealias EventHandler = (T) -> ()
    
    public func addOnCompleteListener(handler: @escaping EventHandler) {
        eventHandlers.append(handler)
    }
    
    func raise(data: T) {
        for handler in eventHandlers {
            handler(data)
        }
    }
}
