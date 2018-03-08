//
//  Sms.swift
//  QuickSms
//
//  Created by emmanuel.kehinde on 07/03/2018.
//

import Foundation

public struct Sms {
    
    public init() {}
    
    public var sender: String = ""
    public var recipient: String = ""
    public var message: String = ""
    public var supportDnd: Bool = false
    public var schedule: String = ""
    
}
