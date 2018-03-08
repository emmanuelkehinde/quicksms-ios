//
//  QuickSmsConstants.swift
//  QuickSms
//
//  Created by emmanuel.kehinde on 07/03/2018.
//

import Foundation

class QuickSmsConstants {
    
    public static let BASE_URL = "https://www.quicksms1.com/api/sendsms.php"
    public static let BASE_URL_REPORT = "https://www.quicksms1.com/api/getdelivery.php"
    public static let COMMON_ERROR_MESSAGE = "An error has occurred, check your internet connection and try again"
    
    public struct Query {
        public static let USERNAME = "username"
        public static let PASSWORD = "password";
        public static let SENDER = "sender";
        public static let MESSAGE = "message";
        public static let RECIPIENT = "recipient";
        public static let BALANCE = "balance";
        public static let SCHEDULE = "schedule";
        public static let CONVERT = "convert";
        public static let REPORT = "report";
        public static let ROUTE = "route";
        public static let MESSAGE_ID = "msgid";
    }
    
    public struct ErrorCode {
        public static let INCORRECT_USERNAME_OR_PASSWORD = "1001";
        public static let INVALID_SENDER = "1002";
        public static let INVALID_MESSAGE = "1003";
        public static let INVALID_RECIPIENT = "1004";
        public static let INSUFFICIENT_BALANCE = "1005";
    }
    
    public struct ErrorMessage {
        public static let INCORRECT_USERNAME_OR_PASSWORD = "Incorrect Username or Password specified";
        public static let INVALID_SENDER = "Invalid Sender ID";
        public static let INVALID_MESSAGE = "Invalid Message";
        public static let INVALID_RECIPIENT = "Invalid Recipient(s) Number";
        public static let INSUFFICIENT_BALANCE = "Insufficient Balance";
    }
    
}
