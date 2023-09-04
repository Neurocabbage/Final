//
//  Theme.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

import UIKit

protocol AppTheme {
    var type: AllAppTheme { get set }
    var backgroundColor: UIColor { get }
    
}
enum AllAppTheme: String {
    case white = "white"
    case blue = "blue"
    case green = "green"
}

final class Theme {
    static var currentTheme: AppTheme = WhiteTheme()
}

final class WhiteTheme: AppTheme {
    var type: AllAppTheme = .white
    var backgroundColor: UIColor = .white
}

final class BlueTheme: AppTheme {
    var type: AllAppTheme = .blue
    var backgroundColor: UIColor = UIColor(red: 220/255, green: 230/255, blue: 1, alpha: 1)
}

final class GreenTheme: AppTheme {
    var type: AllAppTheme = .green
    var backgroundColor: UIColor = UIColor(red: 200/255, green: 1, blue: 160/255, alpha: 1)
}
