//
//  ClickInteractiveStyle.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/29/22.
//

import SwiftUI

public struct ClickInteractiveStyle: ButtonStyle {
    public func makeBody(configuration: ChatrDefaultInteractiveStyle.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
    }
}
