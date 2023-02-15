//
//  UserDefaults.swift
//  Yummie
//
//  Created by Maheen on 15/02/2023.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    var hasOnboarded: Bool {
        get { bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue) }
        
        set { setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue) }
    }
}
