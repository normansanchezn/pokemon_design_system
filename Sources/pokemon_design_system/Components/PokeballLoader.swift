//
//  PokeballLoader.swift
//  pokemon_design_system
//
//  Created by Norman Sánchez on 25/03/26.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
import Lottie

public struct PokeballLoader: View {
    private let size: CGFloat

    public init(size: CGFloat = 140) {
        self.size = size
    }

    public var body: some View {
        LottieView(
            size: size,
            source: .named("pokeball_loading", bundle: .main),
            loopMode: .loop,
            contentMode: .scaleAspectFit,
            speed: 1.0
        )
        .frame(width: size, height: size)
        .accessibilityLabel(Text("Loading"))
    }
}

// MARK: - Lottie SwiftUI wrapper
private struct LottieView: UIViewRepresentable {
    let size: CGFloat

    enum Source {
        case named(String, bundle: Bundle)
        case data(Data)
        case url(URL)
    }

    let source: Source
    let loopMode: LottieLoopMode
    let contentMode: UIView.ContentMode
    let speed: CGFloat

    @MainActor
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView()
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.animationSpeed = speed
        animationView.backgroundBehavior = .pauseAndRestore

        switch source {
        case let .named(name, bundle):
            animationView.animation = LottieAnimation.named(name, bundle: bundle)
        case let .data(data):
            animationView.animation = try? LottieAnimation.from(data: data)
        case let .url(url):
            animationView.animation = LottieAnimation.filepath(url.path)
        }

        animationView.play()
        return animationView
    }

    @MainActor
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
        // Static looping loader, no state updates required.
    }

    @MainActor
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: LottieAnimationView, context: Context) -> CGSize? {
        CGSize(width: size, height: size)
    }
}

#else
public struct PokeballLoader: View {
    private let size: CGFloat

    public init(size: CGFloat = 140) {
        self.size = size
    }

    public var body: some View {
        ProgressView()
            .frame(width: size, height: size)
            .accessibilityLabel(Text("Loading"))
    }
}
#endif

#Preview {
    PokeballLoader()
}
