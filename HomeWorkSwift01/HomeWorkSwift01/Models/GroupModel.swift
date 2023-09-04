//
//  FriendModel.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

struct GroupModel: Decodable {
    var response: GroupResponse
    
    struct GroupResponse:Decodable {
        var count: Int
        var items: [UserGroup]
        
        struct UserGroup: Decodable {
            var id: Int32
            var name: String
            var description: String
            var photoIcon: String
            
            enum CodingKeys: String, CodingKey {
                case id
                case name
                case description
                case photoIcon = "photo_50"
            }
        }
    }
}
