# QuickSms

[![Version](https://img.shields.io/cocoapods/v/QuickSms.svg?style=flat)](http://cocoapods.org/pods/QuickSms)
[![License](https://img.shields.io/cocoapods/l/QuickSms.svg?style=flat)](http://cocoapods.org/pods/QuickSms)
[![Platform](https://img.shields.io/cocoapods/p/QuickSms.svg?style=flat)](http://cocoapods.org/pods/QuickSms)

#### A swift library for QuickSms SMS gateway.

### Overview of QuickSms library
QuickSms library will help you achieve the following:

* Send SMS easily.
* Check Account Balance.
* Get Delivery Report.

Simply register at [quicksms1.com](http://quicksms1.com) and you are good to go!

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

QuickSms is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QuickSms'
```

## Using QuickSms library in your iOS application

Import QuickSms
```swift
import QuickSms
```

Initialize QuickSms with your Username and Password
```swift
let quickSms = QuickSms.configure(withUsername: "YOUR_EMAIL", password: "YOUR_PASSWORD")
```

### Send SMS

Create an `Sms` Instance

```swift
var sms = Sms()
sms.sender = "Tester"
sms.message = "This is just a test"
sms.recipient = "08000000000"
```

Passing the `sms` instance as an argument

```swift
quickSms.sendSms(sms: sms).addOnCompleteListener(handler: { (res, err) in
    if res != nil {
        print(res!.totalNumberOfSmsCreditsUsed)
        print(res!.messageId)
    }
    if err != nil {
        print(err!.message)
    }
})
```

##### To specify Multiple Recipients
```swift
var sms = Sms()
//...
//...
sms.recipient = "08000000000,08000000001,08000000002"
```

##### To specify to deliver to DND numbers
```swift
var sms = Sms()
...
...
sms.supportDnd = true
```

##### To schedule an sms for later delivery
```swift
var sms = Sms()
...
...
sms.schedule = "2018-10-01 12:30:00"
```

### Check Account Balance
```swift
quickSms.getAccountBalance().addOnCompleteListener(handler: { (res, err) in
    if res != nil {
        print(res!.balance)
    }
    if err != nil {
        print(err!.message)
    }
})
```

### Get Delivery Report

Passing `messageId` as argument

```swift
quickSms.getDeliveryReport(messageId: "54765").addOnCompleteListener(handler: { (res, err) in
    if res != nil {
        print(res!.status)
    }
    if err != nil {
        print(err!.message)
    }
})
```

## If this library helps you in anyway, show your love :heart: by putting a :star: on this project :v:; or you can buy me a coffee <a href='https://ko-fi.com/P5P0GMV2' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi2.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## Author

Emmanuel Kehinde, emmakoko1996@gmail.com

## License

QuickSms is available under the MIT license. See the LICENSE file for more info.
