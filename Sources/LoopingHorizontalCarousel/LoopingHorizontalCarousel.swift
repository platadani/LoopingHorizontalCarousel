// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct CarouselElement {
    let text: String
    let image: String

    public init(text: String, image: String) {
        self.text = text
        self.image = image
    }
}

public struct LoopingHorizontalCarousel: View {
    @State private var scrollOffset: CGFloat = 0
    private let itemWidth: CGFloat = 160

    private var itemCount: Int {
        elements.count * repeatsNumber
    }

    private var speed: Double = 8
    private var repeatsNumber = 20
    private var spacing: CGFloat = 20
    private var backgroundColor: Color = .gray
    private var foregroundColor: Color = .black
    private var scrollable: Bool = false

    private var elements: [CarouselElement] = [
        CarouselElement(text: "American football", image: "figure.american.football"),
        CarouselElement(text: "Soccer", image: "figure.soccer"),
        CarouselElement(text: "Swim", image: "figure.pool.swim"),
        CarouselElement(text: "Running", image: "figure.run")
    ]

    private func getElement(index: Int) -> CarouselElement {
        let i = index % elements.count
        return elements[i]
    }

    public init() {}

    public init(elements: [CarouselElement],
                speed: Double = 8,
                spacing: CGFloat = 20,
                backgroundColor: Color = .gray,
                foregroundColor: Color = .black,
                scrollable: Bool = false) {
        self.elements = elements
        self.speed = speed
        self.spacing = spacing
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.scrollable = scrollable
    }

    public var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(0..<itemCount, id: \.self) { index in
                        ZStack {
                            backgroundColor
                            VStack {
                                HStack {
                                    Image(systemName: getElement(index: index).image)
                                        .font(.system(size: 30))
                                        .foregroundStyle(foregroundColor)
                                        .padding(20)
                                        .padding(.top, 10)
                                    Spacer()
                                }.frame(height: 60)
                                HStack {
                                    Text(getElement(index: index).text)
                                        .padding([.leading, .trailing], 20)
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(foregroundColor)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }.cornerRadius(10)
                            .offset(x: -scrollOffset)
                    }
                }
                .frame(width: CGFloat(itemCount) * (itemWidth + spacing))
            }.allowsHitTesting(scrollable)
            .onAppear() {
                let totalWidth = CGFloat(itemCount) * (itemWidth + spacing)
                let screenWidth = geometry.size.width
                let duration = Double(totalWidth / screenWidth) / (speed * 0.1) // Adjusts the speed
                withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    scrollOffset = totalWidth
                }
            }
        }
        .frame(height: 180)
    }
}
