//
//  User.swift
//  SearchBarController
//
//  Created by Semih Özsoy on 4.05.2021.
//

import UIKit

struct User:Decodable {
    let name: String
    let id: Int
    let username: String
    let email: String
    let company: Company
}

struct Company:Decodable {
    let name: String
}
