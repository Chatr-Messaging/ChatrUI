//
//  StringExtension.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/28/22.
//

import Foundation

public extension Character {
    static let alphabetValue = zip("abcdefghijklmnopqrstuvwxyz", 1...26).reduce(into: [:]) { $0[$1.0] = $1.1 }
    var lowercased: Character { .init(lowercased()) }
    var letterValue: Int? { Self.alphabetValue[lowercased] }
}

public extension String {
    var wordValue: Int { compactMap(\.letterValue).reduce(0, +) }
}
