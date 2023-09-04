//
//  FriendModel.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

struct ProfileModel: Decodable {
    var response: Profile
    
    struct Profile: Decodable {
        var photo: String
        var firstName: String
        var lastName: String
        
        enum CodingKeys: String, CodingKey {
            case photo = "photo_200"
            case firstName = "first_name"
            case lastName = "last_name"
        }
    }
}
