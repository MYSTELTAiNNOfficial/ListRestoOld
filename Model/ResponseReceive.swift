//
//  ResponseReceive.swift
//  ListResto
//
//  Created by Macbook Pro on 30/05/22.
//

import Foundation

struct RespRece : Hashable, Codable {
    var err: Bool
    var message: String
    
    static let `default` = RespRece(err: false, message: "")
}
