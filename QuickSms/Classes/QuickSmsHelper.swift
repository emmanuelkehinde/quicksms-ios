//
//  QuickSmsHelper.swift
//  QuickSms
//
//  Created by emmanuel.kehinde on 07/03/2018.
//

import Foundation

class QuickSmsHelper {
    
    public static func getErrorMessageFromCode(code: String) -> String {
        var res: String
        switch code {
        case QuickSmsConstants.ErrorCode.INCORRECT_USERNAME_OR_PASSWORD:
            res = QuickSmsConstants.ErrorMessage.INCORRECT_USERNAME_OR_PASSWORD
            break
        case QuickSmsConstants.ErrorCode.INSUFFICIENT_BALANCE:
            res = QuickSmsConstants.ErrorMessage.INSUFFICIENT_BALANCE
            break
        case QuickSmsConstants.ErrorCode.INVALID_MESSAGE:
            res = QuickSmsConstants.ErrorMessage.INVALID_MESSAGE
            break
        case QuickSmsConstants.ErrorCode.INVALID_RECIPIENT:
            res = QuickSmsConstants.ErrorMessage.INVALID_RECIPIENT
            break
        case QuickSmsConstants.ErrorCode.INVALID_SENDER:
            res = QuickSmsConstants.ErrorMessage.INVALID_SENDER
            break
        default:
            res = ""
            break
        }
        
        return res
    }
    
    public static func getSmsResult(result: String)  -> SendSmsResult {
        var sendSmsResult = SendSmsResult()
        let splString = result.components(separatedBy: " ")
        let credits = splString[1]
        
        sendSmsResult.totalNumberOfSmsCreditsUsed = credits
        if credits == "1" {
            sendSmsResult.messageId = splString[3]
        } else {
            let splNumber = splString[3].components(separatedBy: "|")
            sendSmsResult.messageId = splNumber[0]
        }
        
        return sendSmsResult
    }
}
