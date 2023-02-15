//
//  StringExtension.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
