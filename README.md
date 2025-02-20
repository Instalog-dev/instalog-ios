# InstalogIOS

[![CI Status](https://img.shields.io/travis/25801929/InstalogIOS.svg?style=flat)](https://travis-ci.org/25801929/InstalogIOS)
[![Version](https://img.shields.io/cocoapods/v/InstalogIOS.svg?style=flat)](https://cocoapods.org/pods/InstalogIOS)
[![License](https://img.shields.io/cocoapods/l/InstalogIOS.svg?style=flat)](https://cocoapods.org/pods/InstalogIOS)
[![Platform](https://img.shields.io/cocoapods/p/InstalogIOS.svg?style=flat)](https://cocoapods.org/pods/InstalogIOS)

InstalogIOS is a powerful SDK for iOS applications that provides crash reporting, event logging, and user feedback collection capabilities.

## Table of Contents
- [InstalogIOS](#instalogios)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Getting Started](#getting-started)
    - [Initialize the SDK](#initialize-the-sdk)
    - [Basic Usage](#basic-usage)
  - [Features](#features)
    - [Crash Reporting](#crash-reporting)
    - [Event Logging](#event-logging)
    - [User Feedback](#user-feedback)
  - [Example](#example)
  - [Author](#author)
  - [License](#license)

## Installation

InstalogIOS is available through [CocoaPods](https://cocoapods.org). To install it, add the following line to your Podfile:

```ruby
pod 'InstalogIOS'
```

## Getting Started

### Initialize the SDK

```swift
import InstalogIOS

// In AppDelegate
func application(_ application: UIApplication, 
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Instalog.shared.initialize(key: "your-api-key")
    return true
}
```

### Basic Usage

```swift
// Set user ID
Instalog.shared.identifyUser("user123")

// Log an event
let log = InstalogLogModel(
    level: .info,
    message: "User completed onboarding"
)
Instalog.shared.logEvent(log: log)

// Show feedback modal
Instalog.shared.showFeedbackModal()
```

## Features

### Crash Reporting
- Automatic crash detection
- Manual crash reporting
- Crash simulation for testing

### Event Logging
- Multiple log levels (debug, info, warning, error)
- Custom metadata support
- Automatic device information collection

### User Feedback
- In-app feedback modal
- Screenshot attachment (up to 4 images)
- Programmatic feedback submission

## Example

To run the example project:

1. Clone the repo
2. Run `pod install` from the Example directory
3. Open the workspace in Xcode

The example project demonstrates:
- SDK initialization
- Event logging
- Crash reporting
- User feedback collection

## Author

Ogbonda Chiziaruhoma  
chiziaruhoma@gmail.com

## License

InstalogIOS is available under the MIT license. See the LICENSE file for more info.
