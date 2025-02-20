#!/bin/bash

FRAMEWORK_NAME="InstalogIOS"
OUTPUT_DIR="./build"

# Clean previous builds
rm -rf "${OUTPUT_DIR}"
rm -rf "${FRAMEWORK_NAME}.xcframework"

# Archive for iOS devices (arm64)
# xcodebuild archive \
#   -workspace "${FRAMEWORK_NAME}.xcworkspace" \
#   -scheme "${FRAMEWORK_NAME}" \
#   -configuration Release \
#   -sdk iphoneos \
#   -archivePath "${OUTPUT_DIR}/archives/ios_devices.xcarchive" \
#   BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
#   SKIP_INSTALL=NO

# # Archive for iOS simulator (arm64 + x86_64)
# xcodebuild archive \
#   -workspace "${FRAMEWORK_NAME}.xcworkspace" \
#   -scheme "${FRAMEWORK_NAME}" \
#   -sdk iphonesimulator \
#   -destination "generic/platform=iOS Simulator" \
#   -archivePath "${OUTPUT_DIR}/archives/ios_simulator.xcarchive" \
#   BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
#   SKIP_INSTALL=NO


xcodebuild archive \
  -workspace "Example/${FRAMEWORK_NAME}.xcworkspace" \
  -scheme "${FRAMEWORK_NAME}" \
  -configuration Release \
  -sdk iphoneos\
  -archivePath "${OUTPUT_DIR}/ios.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Archive for iOS Simulator
xcodebuild archive \
  -workspace "Example/${FRAMEWORK_NAME}.xcworkspace" \
  -scheme "${FRAMEWORK_NAME}" \
  -configuration Debug \
  -sdk iphonesimulator \
  -archivePath "${OUTPUT_DIR}/simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
  -framework "build/ios.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
  -framework "build/simulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
  -output "${FRAMEWORK_NAME}.xcframework"

# Copy the generated XCFramework to the desired location
cp -R "${FRAMEWORK_NAME}.xcframework" "../flutter/instalog_ios/ios/Frameworks/"

echo "XCFramework created at ${FRAMEWORK_NAME}.xcframework"
