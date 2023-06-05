//
//  User.swift
//  Buttontestproject
//
//  Created by ahmet hakan öz on 3.06.2023.
//

import Foundation

struct UserJSON: Decodable {
    var id         : Int?
    var name       : String?
    var username   : String?
    var password   : String?
}

struct Data: Decodable {
    var data            : UserData?
}

struct UserData : Decodable {
    var id         : Int?
    var name       : String?
    var username   : String?
    var password   : String?
}
