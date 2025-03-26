# InstalogIOS
[![Version](https://img.shields.io/cocoapods/v/InstalogIOS.svg?style=flat)](https://cocoapods.org/pods/InstalogIOS)
[![License](https://img.shields.io/cocoapods/l/InstalogIOS.svg?style=flat)](https://cocoapods.org/pods/InstalogIOS)
[![Platform](https://img.shields.io/cocoapods/p/InstalogIOS.svg?style=flat)](https://cocoapods.org/pods/InstalogIOS)

InstalogIOS is a powerful SDK for iOS applications that provides crash reporting, event logging, and user feedback collection capabilities.

## Table of Contents
- [InstalogIOS](#instalogios)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [CocoaPods](#cocoapods)
    - [Swift Package Manager](#swift-package-manager)
  - [Getting Started](#getting-started)
    - [Initialize the SDK](#initialize-the-sdk)
    - [Feature Configuration](#feature-configuration)
    - [Basic Usage](#basic-usage)
  - [Features](#features)
    - [Crash Reporting](#crash-reporting)
    - [Event Logging](#event-logging)
    - [User Feedback](#user-feedback)
    - [Configurable Components](#configurable-components)
  - [Example](#example)
    - [Initialization Example](#initialization-example)
    - [Logging Example](#logging-example)
  - [Author](#author)
  - [License](#license)

## Installation

### CocoaPods

InstalogIOS is available through [CocoaPods](https://cocoapods.org). To install it, add the following line to your Podfile:

```ruby
pod 'InstalogIOS'
```

### Swift Package Manager

InstalogIOS is also available through [Swift Package Manager](https://swift.org/package-manager/). To install it, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/instalog-dev/instalog-ios.git", .exact("1.0.1"))
]
```

Or in Xcode:

1. File > Add Packages...
2. Enter package URL: `https://github.com/instalog-dev/instalog-ios.git`
3. Select "Exact Version" and enter "1.0.1"
4. Click "Add Package"

## Getting Started

### Initialize the SDK

```swift
import InstalogIOS

// In AppDelegate
func application(_ application: UIApplication, 
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Basic initialization
    Instalog.shared.initialize(key: "your-api-key")
    
    // Or initialize with specific features enabled/disabled
    let options = InstalogOptions(dictionary: [
        "isCrashEnabled": true,      // Enable/disable crash reporting
        "isFeedbackEnabled": true,   // Enable/disable feedback functionality
        "isLogEnabled": true,        // Enable/disable event logging
        "isLoggerEnabled": false     // Enable/disable debug logging
    ])
    
    Instalog.shared.initialize(key: "your-api-key", options: options)
    
    return true
}
```

### Feature Configuration

InstalogIOS allows you to configure which features are enabled or disabled:

| Option | Default | Description |
|--------|---------|-------------|
| `isCrashEnabled` | `true` | Controls crash reporting functionality |
| `isFeedbackEnabled` | `true` | Controls in-app feedback functionality |
| `isLogEnabled` | `true` | Controls event logging functionality |
| `isLoggerEnabled` | `false` | Controls internal debug logging |

You can configure these options when initializing the SDK, or use the default configuration.

### Basic Usage

```swift
// Set user ID
Instalog.shared.identifyUser("user123")

// Log an event
let log = InstalogLogModel(
    event: "onboarding_completed",
    params: ["screen": "welcome", "user_type": "new"]
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
- Can be enabled/disabled through configuration

### Event Logging
- Multiple log levels (debug, info, warning, error)
- Custom metadata support
- Automatic device information collection
- Can be enabled/disabled through configuration

### User Feedback
- In-app feedback modal
- Screenshot attachment (up to 4 images)
- Programmatic feedback submission
- Can be enabled/disabled through configuration

### Configurable Components
- Selectively enable or disable features based on your needs
- Control internal logging verbosity
- All configurations can be set at initialization

## Example

To run the example project:

1. Clone the repo
2. Run `pod install` from the Example directory
3. Open the workspace in Xcode

The example project demonstrates:
- SDK initialization with feature configuration
- Event logging with different log levels
- Crash reporting and simulation
- User feedback collection

### Initialization Example

```swift
// Initialize with all default settings
Instalog.shared.initialize(key: "your-api-key")

// Initialize with custom configuration
let options = InstalogOptions(dictionary: [
    "isCrashEnabled": true,      
    "isFeedbackEnabled": true,   
    "isLogEnabled": true,        
    "isLoggerEnabled": true      // Enable internal logging for debugging
])
Instalog.shared.initialize(key: "your-api-key", options: options)

// Set a user identifier
Instalog.shared.identifyUser("user_123")
```

### Logging Example

```swift
// Simple event log
let simpleLog = InstalogLogModel(
    event: "product_viewed",
    params: ["product_id": "12345", "category": "electronics"]
)
Instalog.shared.logEvent(log: simpleLog)

// Detailed event log
let detailedLog = InstalogLogModel(
    event: "payment_failed",
    params: [
      "transaction_id": "tx_789", 
      "error_code": "payment_declined", 
      "amount": "99.99", 
      "currency": "USD"
    ]
)
Instalog.shared.logEvent(log: detailedLog)
```

## Author

Ogbonda Chiziaruhoma  
chiziaruhoma@gmail.com

## License

InstalogIOS is available under the MIT license. See the LICENSE file for more info.
