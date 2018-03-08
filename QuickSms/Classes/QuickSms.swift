//
//  QuickSms.swift
//  QuickSms
//
//  Created by emmanuel.kehinde on 07/03/2018.
//

import Foundation
import Alamofire

public class QuickSms {
    
    private var username: String = ""
    private var password: String = ""
    
    private init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    public func sendSms(sms: Sms) -> Task<(SendSmsResult?, QuickSmsError?)> {
        let task = Task<(SendSmsResult?, QuickSmsError?)>()
        
        let params: Parameters = [
            QuickSmsConstants.Query.USERNAME: self.username,
            QuickSmsConstants.Query.PASSWORD: self.password,
            QuickSmsConstants.Query.SENDER: sms.sender,
            QuickSmsConstants.Query.MESSAGE: sms.message,
            QuickSmsConstants.Query.RECIPIENT: sms.recipient,
            QuickSmsConstants.Query.BALANCE: "1",
            QuickSmsConstants.Query.SCHEDULE: sms.schedule,
            QuickSmsConstants.Query.CONVERT: "1",
            QuickSmsConstants.Query.REPORT: "1",
            QuickSmsConstants.Query.ROUTE: sms.supportDnd ? "1" : "0",
        ]
        
        var result: SendSmsResult? = nil
        var error = QuickSmsError()
        error.message = QuickSmsConstants.COMMON_ERROR_MESSAGE
        
        Alamofire.request(QuickSmsConstants.BASE_URL, method:.get, parameters: params).responseString { response in
            if response.result.isSuccess {
                if response.result.value!.contains("OK") {
                    result = QuickSmsHelper.getSmsResult(result: "\(response.result.value!)")
                    task.raise(data: (result, nil))
                } else {
                    error.message = QuickSmsHelper.getErrorMessageFromCode(code: response.result.value!)
                    task.raise(data: (nil, error))
                }
            } else {
                task.raise(data: (nil, error))
            }
        }
        
        return task
    }
    
    public func getAccountBalance() -> Task<(GetAccountBalanceResult?, QuickSmsError?)> {
        let task = Task<(GetAccountBalanceResult?, QuickSmsError?)>()
        var result = GetAccountBalanceResult()
        result.balance = 20
        
        let params: Parameters = [
            QuickSmsConstants.Query.USERNAME: self.username,
            QuickSmsConstants.Query.PASSWORD: self.password,
            QuickSmsConstants.Query.BALANCE: "1"
        ]
        
        var error = QuickSmsError()
        error.message = QuickSmsConstants.COMMON_ERROR_MESSAGE
        
        Alamofire.request(QuickSmsConstants.BASE_URL, method:.get, parameters: params).responseString { response in
            if response.result.isSuccess {
                task.raise(data: (nil, error))
            } else {
                task.raise(data: (nil, error))
            }
        }
        
        return task
    }
    
    public func getDeliveryReport(messageId: String) -> Task<(GetDeliveryReportResult?, QuickSmsError?)> {
        let task = Task<(GetDeliveryReportResult?, QuickSmsError?)>()
        var result = GetDeliveryReportResult()
        result.status = "DELIVERED"
        
        let params: Parameters = [
            QuickSmsConstants.Query.USERNAME: self.username,
            QuickSmsConstants.Query.PASSWORD: self.password,
            QuickSmsConstants.Query.MESSAGE_ID: messageId
        ]
        
        var error = QuickSmsError()
        error.message = QuickSmsConstants.COMMON_ERROR_MESSAGE
        
        Alamofire.request(QuickSmsConstants.BASE_URL_REPORT, method:.get, parameters: params).responseString { response in
            if response.result.isSuccess {
                task.raise(data: (nil, error))
            } else {
                task.raise(data: (nil, error))
            }
        }
        
        return task
    }
    
    public static func configure(withUsername: String, password: String) -> QuickSms {
        let quickSms = QuickSms(username: withUsername, password: password)
        return quickSms
    }
}
