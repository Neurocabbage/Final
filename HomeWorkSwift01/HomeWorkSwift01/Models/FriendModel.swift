//
//  FriendModel.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

struct FriendModel: Decodable {
    var response: FriendResponse
    
    struct FriendResponse: Decodable {
        var count: Int
        var items: [Friend]
        
        struct Friend: Decodable {
            var id: Int32
            //var bdate: String?
            //var trackCode: String
            var photoIcon: String?
            var isOnline: Int
            var firstName: String
            var lastName: String
            //var canAccessClosed: Bool
            //var isClosed: Bool
            enum CodingKeys: String, CodingKey {
                case id
                //case bdate
                //case trackCode = "track_code"
                case photoIcon = "photo_200_orig"
                case isOnline = "online"
                case firstName = "first_name"
                case lastName = "last_name"
                //case canAccessClosed = "can_access_closed"
                //case isClosed = "is_closed"
            }
        }
    }
}
