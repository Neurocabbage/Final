//
//  FriendModel.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

struct PhotoModel: Decodable {
    var response: PhotoResponse
    
    struct PhotoResponse: Decodable {
        var count: Int
        var items: [Photo]
        
        struct Photo: Decodable {
            var id: Int
            var sizes: [Size]
            
            struct Size: Decodable {
                var height: UInt
                var type: String
                var width: UInt
                var url: String
            }
        }
    }
}
