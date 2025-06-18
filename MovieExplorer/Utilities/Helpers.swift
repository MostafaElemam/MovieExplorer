//
//  Helpers.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import UIKit

#if canImport(SwiftMessages)
import SwiftMessages
#endif


class Helpers {
    
    @MainActor
    static func showBanner(title: String = "Error", _ message: String, theme: Theme = .error) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureDropShadow()
        let textAlignment : NSTextAlignment = UIApplication.isRTL ? .right : .left
        view.titleLabel?.textAlignment = textAlignment
        view.bodyLabel?.textAlignment = textAlignment
        
        view.titleLabel?.font = UIFont(name: "Inter-Regular_SemiBold", size: 16)
        view.bodyLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 0)
        
        view.configureContent(title: NSLocalizedString(title, comment: ""), body: message)
        view.button?.isHidden = true
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        SwiftMessages.show(config: config, view: view)
        
        
    }
    
}
