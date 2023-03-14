//
//  OAuth2TokenStorage.swift
//  Image Feed
//
//  Created by tommy tm on 11.03.2023.
//

import Foundation

final class OAuth2TokenStorage {
    static private let bearerTokenKey = "imageFeedBearerToken"
    static var token: String? {
        get {
            UserDefaults.standard.string(forKey: bearerTokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: bearerTokenKey)
        }
    }
}
