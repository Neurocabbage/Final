//
//  ThemeSaver.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

import Foundation
final class ThemeSaver {
    static func putData() {
        let theme = Theme.currentTheme.type
        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
    }
    
    static func getData() {
        let theme = UserDefaults.standard.string(forKey: "theme")
        let themeType = AllAppTheme(rawValue: theme ?? "white")
        switch themeType {
        case .white: Theme.currentTheme = WhiteTheme()
        case .blue: Theme.currentTheme = BlueTheme()
        case .green: Theme.currentTheme = GreenTheme()
        default: Theme.currentTheme = WhiteTheme()
        }
    }
}
