//
//  OAuthTokenResponseBody.swift
//  Image Feed
//
//  Created by tommy tm on 11.03.2023.
//

import UIKit

struct OAuthTokenResponseBody: Decodable {
    let access_token: String
    let token_type: String
    let scope: String
    let refresh_token: String
    let created_at: Int
}
