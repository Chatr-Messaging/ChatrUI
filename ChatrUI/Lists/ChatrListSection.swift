//
//  ChatrUIList.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/22/22.
//

import SwiftUI

public struct ChatrListSection<Content: View>: View {

    let content: Content
    let title: String

    public init(title: String, @ViewBuilder _ content: () -> Content) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {

            Text(title + ":")
                .font(.caption)
                .fontWeight(.regular)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.horizontal)

            VStack(alignment: .center, spacing: 0) {
                content
            }
            .background(Color("baseButton"))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
            .shadow(color: Color.black.opacity(0.15), radius: 15, x: 0, y: 8)
            .padding(.horizontal)
            .padding(.bottom, 5)

        }
    }
}