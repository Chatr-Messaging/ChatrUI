//
//  ChatrColors.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/25/22.
//

import SwiftUI

enum AppColor: Hashable, CaseIterable {
    case primary
    case secondary
    case red
    
    var color: Color {
        switch self {
        case .primary:
            return Color.primary
        case .secondary:
            return Color.secondary
        case .red:
            return Color("alertRed")
        }
    }
}
