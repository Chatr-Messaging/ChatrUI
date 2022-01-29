//
//  EmptyAvatarView.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/28/22.
//

import SwiftUI

public struct EmptyAvatarView: View {
    
    private let fullName: String
    private let size: CGFloat

    public init(fullName: String, size: CGFloat) {
        self.fullName = fullName
        self.size = size
    }

    public var body: some View {
        Circle()
            .frame(width: size, height: size, alignment: .center)
            .foregroundColor(Color("baseBackground"))
            .shadow(color: Color.black.opacity(0.15), radius: size > 40 ? (size / 7) : size < 25 ? 3 : 5, x: 0, y: size > 40 ? (size / 8) : size < 25 ? 3 : 5)
            .overlay(
                ZStack(alignment: .center) {
                    getGradient(name: fullName)
                        .clipShape(Circle())

                    Text(firstLetters(name: fullName))
                        .font(.system(size: size <= 28 ? 12 : size >= 60 ? 26 : size / 2.33))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primary)
                }
            )
    }

    private func getGradient(name: String) -> LinearGradient {
        let wordValue = name.wordValue

        let divisible = Int(wordValue / ChatrGradients.emptyAvatarGradients.count)
        let reminders = ChatrGradients.emptyAvatarGradients.count * divisible
        let result = wordValue - reminders

        return ChatrGradients.emptyAvatarGradients[result]
    }

    private func firstLetters(name: String) -> String {
        guard !name.isEmpty else {
            return "?"
        }

        let stringInputArr = name.components(separatedBy: " ")
        var stringNeed: String = ""

        for string in stringInputArr {
            if stringNeed.count >= 3 {
                return stringNeed
            } else {
                if let firstLetter = string.first {
                    stringNeed = stringNeed + String(firstLetter)
                }
            }
        }

        return stringNeed
    }

}
