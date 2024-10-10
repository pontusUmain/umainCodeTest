//
//  ApiRequest.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

class APIRequest<Resource: APIResource>: NetworkRequest {
    let resource: Resource

    init(resource: Resource) {
        self.resource = resource
    }
    
    func decode(_ data: Data) throws -> Resource.ModelType {
        let wrapper = try JSONDecoder.apiDecoder
            .decode(Resource.ModelType.self, from: data)
        return wrapper
    }

    func execute() async throws -> Resource.ModelType {
        try await load(resource.url)
    }
}
