//
//  AlertBadge.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/25/22.
//

import SwiftUI

public struct AlertBadge: View {
    var count: Binding<Int>
    
    public init(count: Binding<Int>) {
        self.count = count
    }

    public var body: some View {
        HStack {
            Text("\(count.wrappedValue)")
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.footnote)
                .padding(.horizontal, 5)
        }
        .background(Capsule().frame(height: 22).frame(minWidth: 22).foregroundColor(Color("alertRed")).shadow(color: Color("alertRed").opacity(0.75), radius: 4, x: 0, y: 3))
        .opacity(count.wrappedValue > 0 ? 1 : 0)
    }
}
