//
//  ChatrFonts.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/24/22.
//

import SwiftUI

enum AppFont: String, Hashable, CaseIterable {
    case regular
    case rounded
    case monospaced
    case serif
    
    var font: Font.Design {
        switch self {
        case .regular:
            return Font.Design.default
        case .rounded:
            return Font.Design.rounded
        case .monospaced:
            return Font.Design.monospaced
        case .serif:
            return Font.Design.serif
        }
    }
}

enum AppFontSize: String, Hashable, CaseIterable {
    case small
    case medium
    case large
    case extraLarge
    
    var size: Font.Design {
        switch self {
        case .small:
            return Font.Design.default
        case .medium:
            return Font.Design.rounded
        case .large:
            return Font.Design.monospaced
        case .extraLarge:
            return Font.Design.serif
        }
    }
}
