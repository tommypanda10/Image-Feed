//
//  Constants.swift
//  Image Feed
//
//  Created by tommy tm on 05.03.2023.
//

import Foundation

enum Constants {
    static let accessKey = "6PcGUG-o_X-ssx3GbFHqmYdxKYlzvbkIeUp1LHMVZog"
    static let secretKey = "z14OlsvDlRlNBrtc_0xaYmfwMlF_Y4O0nBALOMPSG6M"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL = URL(string: "https://api.unsplash.com/")!
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
    static let url = URL(string: "https://unsplash.com/oauth/token")!
}
