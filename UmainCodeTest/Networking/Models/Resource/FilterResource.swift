//
//  FilterResource.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct FilterResource: APIResource {
    typealias ModelType = [Filter]
    
    var id: String
    
    var baseUrl: String {
        return Endpoint.filter(id: id).baseUrl
    }
    
    var methodPath: String {
        return Endpoint.filter(id: id).methodPath
    }
    
    var filter: String? {
        return nil
    }
}
