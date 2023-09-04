//
//  Constant.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

import Foundation
mport UIKit

enum Constants {
    enum Indentifiers {
        static let photoViewCell = "PhotoCell"
        static let friendViewCell = "FriendCell"
        static let groupViewCell = "GroupCell"
    }
    
    enum Views {
        enum Detector {
            static let width: CGFloat = 10
            static let offlineColor: UIColor = .systemGray
            static let onlineColor: UIColor = .systemGreen
        }
        enum Icon {
            static let width: CGFloat = 50
        }
    }
    
    enum Offset {
        
        enum TableViewCell {
            static let circleW: CGFloat = 50
        }
        enum CollectionViewCell{
            
        }
    }
}
