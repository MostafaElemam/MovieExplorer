//
//  UIApplication.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import UIKit

extension UIApplication {
    static var isRTL: Bool {
        UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
}
