//
//  AlertBadge.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/25/22.
//

import SwiftUI

struct AlertBadge: View {
    @Binding var count: Int

    var body: some View {
        HStack {
            Text(String(count))
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.footnote)
                .padding(.horizontal, 5)
        }
        .background(Capsule().frame(height: 22).frame(minWidth: 22).foregroundColor(Color("alertRed")).shadow(color: Color("alertRed").opacity(0.75), radius: 5, x: 0, y: 5))
        .opacity(count > 0 ? 1 : 0)
    }
}
