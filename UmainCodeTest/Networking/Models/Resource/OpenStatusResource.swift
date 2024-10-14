//
//  OpenStatusResource.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct OpenStatusResource: APIResource {
    typealias ModelType = OpenStatus
    
    var id: String
    
    var baseUrl: String {
        return Endpoint.openStatus(id: id).baseUrl
    }
    
    var methodPath: String {
        return Endpoint.openStatus(id: id).methodPath
    }
    
    var filter: String? {
        return nil
    }
}
