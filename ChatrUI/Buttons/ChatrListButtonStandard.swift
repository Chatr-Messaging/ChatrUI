//
//  ChatrUIListButton.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/22/22.
//

import SwiftUI

public struct ChatrListButtonStandard: View {

    private let title: String
    private var systemImage: String = ""
    private var localImage: String = ""
    private let isLast: Bool
    private let action: () -> Void

    // System Image
    public init(title: String, systemImage: String, isLast: Bool, action: @escaping () -> Void) {
        self.title = title
        self.systemImage = systemImage
        self.isLast = isLast
        self.action = action
    }

    // Local Image
    public init(title: String, localImage: String, isLast: Bool, action: @escaping () -> Void) {
        self.title = title
        self.localImage = localImage
        self.isLast = isLast
        self.action = action
    }

    // Text Only
    public init(title: String, isLast: Bool, action: @escaping () -> Void) {
        self.title = title
        self.isLast = isLast
        self.action = action
    }

    public var body: some View {

        ZStack(alignment: .center) {

            Button(action: action) {
                VStack(alignment: .trailing, spacing: 0) {
                    HStack(alignment: .center) {
                        if !systemImage.isEmpty {
                            Image(systemName: systemImage)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.primary)
                                .frame(width: 20, height: 20, alignment: .center)
                                .padding(.trailing, 5)
                        } else if !localImage.isEmpty {
                            Image(localImage)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.primary)
                                .frame(width: 32, height: 32, alignment: .center)
                                .padding(.trailing, 5)
                        } else {
                            EmptyView().frame(height: 20)
                        }

                        Text(title)
                            .font(.none)
                            .fontWeight(.none)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .font(Font.title.weight(.bold))
                            .scaledToFit()
                            .frame(width: 7, height: 15, alignment: .center)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, localImage.isEmpty ? 15 : 10)

                    Divider()
                        .frame(width: Constants.screenWidth - (localImage.isEmpty ? 80 : 95))
                        .opacity(!isLast ? 1 : 0)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(ChatrDefaultInteractiveStyle())
            .frame(minWidth: 100, maxWidth: Constants.screenWidth)

        }.simultaneousGesture(TapGesture().onEnded { HapticFeedback.rigidHapticFeedback() })
    }
}
