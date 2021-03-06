# Translate-Text Unary gRPC iOS Example
## Work in Progress!
## Description

This application demonstrates making a unary call using gRPC translate and detect the inputted text's language using gRPC Swift, built on top of SwiftNIO.

## Technologies

* [gRPC Swift](https://github.com/grpc/grpc-swift)
* [Google Translate API](https://cloud.google.com/translate)
* [SnapKit](https://github.com/SnapKit/SnapKit)

## Acquiring an API Key
This project requires a Google Cloud API Key. Please [register](https://cloud.google.com/apis/docs/getting-started) and [create an API key](https://cloud.google.com/docs/authentication/api-keys) in order to consume the API.

## Project Setup
1. Clone the repository
2. Navigate to the root directory (`Examples/Google/TranslateText`) and run `pod install`
3. Run `make protos` to pull the most recent .proto files from the googleapis repository
4. run `make generate` to leverage the `protoc` plugin to generate the Swift interfaces
    - Note: Please refer to [Getting the `protoc` Plugins](https://github.com/grpc/grpc-swift#getting-the-protoc-plugins). For this tutorial, the Makefile requires that the `protoc-gen-grpc-swift` and `protoc-gen-swift` are on the users `PATH`.
5. Open the `.xcworkspace`
6. Open the `Constants.swift` file and assign your generated Google Cloud API Key to the `apiKey` variable.
    - Note: Once you add the API Key, feel free to remove the forced warning/reminder on line 23.
7. Run the application!

## Helpful Links
* [Getting Started with Speech APIs](https://cloud.google.com/speech-to-text/docs/quickstart)
* [CocoaPods](https://cocoapods.org/)
* [gRPC-Swift CocoaPod](https://cocoapods.org/pods/gRPC-Swift)
