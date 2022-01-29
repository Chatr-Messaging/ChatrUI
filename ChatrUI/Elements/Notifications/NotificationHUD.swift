//
//  NotificationHUD.swift
//  
//
//  Created by Brandon Shaw on 1/28/22.
//

import SwiftUI

public struct NotificationHUD: View {
    @State var showHUD: Bool = false
    let delayDuration = 3.5

    private let image: String
    private let color: Color
    private let title: String
    private let subtitle: String
    
    public init(image: String, color: Color, title: String) {
        self.image = image
        self.color = color
        self.title = title
        self.subtitle = ""
    }

    public init(image: String, color: Color, title: String, subtitle: String) {
        self.image = image
        self.color = color
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        ZStack {
            Button(action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                withAnimation(.easeInOut(duration: 0.45)){
                    showHUD = false
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                    getRootController().view.subviews.forEach { view in
                        if view.tag == 1009 {
                            view.removeFromSuperview()
                        }
                    }
                }
            }, label: {
                HStack(spacing: 10) {
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28, alignment: .center)
                        .foregroundColor(color)
                        .font(Font.title.weight(.regular))
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .font(.none)
                            .fontWeight(subtitle == "" ? .medium : .semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)

                        if subtitle != "" {
                            Text(subtitle)
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                        }
                    }
                }.padding(10)
                .padding(.horizontal)
                .padding(.trailing, subtitle == "" ? 0 : 10)
                .overlay(
                    Capsule()
                        .foregroundColor(.clear)
                        .overlay(Capsule().stroke(Color("blurBorder"), lineWidth: 2))
                )
                .background(
                    BlurView(style: .systemMaterial)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 8)
                )
            })
            .buttonStyle(ClickInteractiveStyle())
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y: showHUD ? 0 : -200)
            .onAppear {
                withAnimation(.spring(response: 0.45, dampingFraction: 0.7, blendDuration: 0)){
                    showHUD = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + delayDuration) {
                    withAnimation(.easeInOut(duration: 0.45)){
                        showHUD = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                        guard !showHUD else { return }

                        getRootController().view.subviews.forEach { view in
                            if view.tag == 1009 {
                                view.removeFromSuperview()
                            }
                        }
                    }
                }
            }
        }
    }
    
    public func getRootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.last?.rootViewController else {
            return .init()
        }

        return root
    }
}

