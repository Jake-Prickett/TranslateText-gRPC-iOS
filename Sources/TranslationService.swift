//
//  TranslationService.swift
//  TranslateText-gRPC-iOS
//
//  Created by PRICKETT, JACOB on 8/3/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import GRPC

typealias TranslationServiceClient = Google_Cloud_Translation_V3_TranslationServiceClient
typealias DetectLanguageRequest = Google_Cloud_Translation_V3_DetectLanguageRequest
typealias DetectLanguageResponse = Google_Cloud_Translation_V3_DetectLanguageResponse

final class TranslationService {
  
  let client: TranslationServiceClient
  
  init() {
    precondition(!Constants.apiKey.isEmpty, "Please refer to the README on how to configure your API Key properly.")
    
    // Make EventLoopGroup for the specific platform (NIOTSEventLoopGroup for iOS)
    // see https://github.com/grpc/grpc-swift/blob/master/docs/apple-platforms.md for more details
    let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)
    
    // Create a connection secured with TLS to Google's speech service running on our `EventLoopGroup`
    let channel = ClientConnection
      .secure(group: group)
      .connect(host: "translation.googleapis.com", port: 443)
    
    // Specify call options to be used for gRPC calls
    
    
    // Now we have a client!
    self.client = TranslationServiceClient(channel: channel)
  }
  
  func detectLanguage() {
    let callOptions = CallOptions(customMetadata: [
      "key": Constants.apiKey
    ])
    
    let detectLanguageRequest = DetectLanguageRequest.with {
      $0.source = .content("Hello, my name is Jake")
      $0.parent = "projects/united-rope-274013"
    }
    let call = self.client.detectLanguage(detectLanguageRequest, callOptions: callOptions)
    call.response.whenSuccess { response in
      print("Success -- \(response.languages)")
    }
    call.response.whenFailure { error in
      print("Error -- \(error.localizedDescription)")
    }
  }
  
}
