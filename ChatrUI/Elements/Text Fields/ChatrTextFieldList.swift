//
//  ChatrTextFieldDefault.swift
//  ChatrUI
//
//  Created by Brandon Shaw on 1/24/22.
//

import SwiftUI

struct ChatrTextFieldList: View {
    
    @State var text: String = ""

    @State private var hasText: Bool = false
    @State private var exceededLimit: Bool = false
    @FocusState private var focusedField: Bool

    private let placeholder: String
    private var textLimit: Int = 0
    private var systemImage: String = ""
    private var localImage: String = ""
    private let onEditingChanged: (String) -> Void
    private let onCommit: () -> Void

    public init(text: String, placeholder: String, textLimit: Int?, onEditingChanged: @escaping (String) -> Void = { _ in }, onCommit: @escaping () -> Void) {
        self.text = text
        self.placeholder = placeholder
        self.textLimit = textLimit ?? 0
        self.onCommit = onCommit
        self.onEditingChanged = onEditingChanged
    }

    public init(text: String, placeholder: String, systemImage: String, textLimit: Int?, onEditingChanged: @escaping (String) -> Void = { _ in }, onCommit: @escaping () -> Void) {
        self.text = text
        self.placeholder = placeholder
        self.systemImage = systemImage
        self.textLimit = textLimit ?? 0
        self.onCommit = onCommit
        self.onEditingChanged = onEditingChanged
    }

    public init(text: String, placeholder: String, localImage: String, textLimit: Int?, onEditingChanged: @escaping (String) -> Void = { _ in }, onCommit: @escaping () -> Void) {
        self.text = text
        self.placeholder = placeholder
        self.localImage = localImage
        self.textLimit = textLimit ?? 0
        self.onCommit = onCommit
        self.onEditingChanged = onEditingChanged
    }

    public init(placeholder: String, onEditingChanged: @escaping (String) -> Void = { _ in }, onCommit: @escaping () -> Void) {
        self.placeholder = placeholder
        self.onCommit = onCommit
        self.onEditingChanged = onEditingChanged
    }

    public var body: some View{
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 2.5) {
                if !systemImage.isEmpty {
                    Image(systemName: systemImage)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primary)
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(.trailing, 5)
                        .offset(y: hasText ? 5 : 0)
                } else if !localImage.isEmpty {
                    Image(localImage)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.primary)
                        .frame(width: 26, height: 26, alignment: .center)
                        .padding(.trailing, 5)
                        .offset(y: hasText ? 5 : 0)
                }
                
                TextField("", text: $text)
                    .focused($focusedField)
                    .offset(y: hasText ? 5 : 0)
                    .onSubmit { self.onCommit() }
                    .onChange(of: text) { text in
                        self.onEditingChanged(text)

                        if text.count >= textLimit, textLimit != 0 {
                            exceededLimit = true
                            HapticFeedback.lightHapticFeedback()
                        } else {
                            exceededLimit = false
                        }

                        guard text.isEmpty, hasText else {
                            withAnimation(.spring(response: 0.25, dampingFraction: 0.85, blendDuration: 0)) {
                                hasText = true
                            }

                            return
                        }

                        withAnimation(.spring(response: 0.25, dampingFraction: 0.85, blendDuration: 0)) {
                            hasText = false
                        }
                    }
            }
            .padding(.top, hasText ? 10 : 0)
            .background(
                HStack(alignment: .center, spacing: 0) {
                    Text(placeholder)
                        .scaleEffect(hasText ? 0.8 : 1)
                        .foregroundColor(hasText ? (exceededLimit ? .red : (focusedField ? .blue : .secondary)) : .secondary)

                    Text("\(text.count)" + "/" + "\(textLimit)")
                        .font(.caption)
                        .foregroundColor(exceededLimit ? .red : .secondary)
                        .offset(x: -5)
                        .opacity(hasText && textLimit != 0 ? 1 : 0)
                    Spacer()
                }.offset(x: (hasText ? -15 : !systemImage.isEmpty ? 30 : !localImage.isEmpty ? 35 : 0), y: hasText ? -15 : 0)
            , alignment: .leading)
            .padding(.horizontal)

            Rectangle()
                .fill(exceededLimit ? .red.opacity(0.6) : (focusedField ? .blue.opacity(0.6) : .primary.opacity(0.2)))
                .frame(height: 1)
        }
        .padding(.vertical, 15)
        .background(Color("baseButton"))
        .cornerRadius(10)
        .onAppear() {
            if !text.isEmpty {
                hasText = true
            }

            if text.count >= textLimit, textLimit != 0 {
                exceededLimit = true
            } else {
                exceededLimit = false
            }
        }
    }
    
}