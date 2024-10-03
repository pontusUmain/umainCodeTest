//
//  ImageRequest.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

class ImageRequest: NetworkRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }

    func decode(_ data: Data) throws -> URL? {
        let dataString = data.base64EncodedString()
        return URL(string: "data:image/png;base64," + dataString)!
    }

    func execute() async throws -> URL? {
        try await load(url)
    }
}

