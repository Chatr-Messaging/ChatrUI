//
//  ChatrUIDefaultInteractiveStyle.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/22/22.
//

import SwiftUI

public struct ChatrDefaultInteractiveStyle: ButtonStyle {
    public func makeBody(configuration: ChatrDefaultInteractiveStyle.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            .background(configuration.isPressed ? Color("baseButton_selected") : Color("baseButton"))
    }
}

public struct ClickInteractiveStyle: ButtonStyle {
    public func makeBody(configuration: ChatrDefaultInteractiveStyle.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            .background(configuration.isPressed ? Color("baseButton_selected") : Color("baseButton"))
    }
}
