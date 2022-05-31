//
//  Akun.swift
//  ListResto
//
//  Created by Macbook Pro on 29/05/22.
//
// Credit: Ipung DEV Academy @ YT

import Foundation

struct UserData : Hashable, Codable, Identifiable {
    var id: Int
    var user: String
    var err: Bool
    var message: String
    
    static let `default` = UserData(id: -1, user: "", err: false, message: "")
}
