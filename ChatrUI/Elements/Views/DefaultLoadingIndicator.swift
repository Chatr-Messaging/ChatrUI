//
//  DefaultLoadingIndicator.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/28/22.
//

import SwiftUI

public struct DefaultLoadingView: View {
    @State private var isLoading = false

    private var animation: Animation {
        Animation.linear(duration: 0.55)
        .repeatForever(autoreverses: false)
    }
    
    public init() { }
    
    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(Color.primary, style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
            .rotationEffect(.init(degrees: self.isLoading ? 360 : 0))
            .frame(width: 25, height: 25)
            .animation(animation)
            .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
            .onAppear() {
                self.isLoading.toggle()
            }
    }

}
