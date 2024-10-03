//
//  CodableWrapper.swift
//  UmainCodeTest
//
//  Created by Pontus Croneld on 2024-10-03.
//

import Foundation

struct CodableWrapper<T: Codable>: Codable {
    let items: [T]
}
