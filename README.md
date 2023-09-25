#### ▶️ Demo

<img width=250 src="Assets/example.gif">

#### 💾 Installation
    
#### [Swift Package Manager][SPM]
Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the Swift compiler.

Once you have your Swift package set up, adding LoopingHorizontalCarousel as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```Swift
dependencies: [
    .package(url: "https://github.com/platadani/LoopingHorizontalCarousel.git", branch(“main”))
]
```

#### ❓ How to use

1. Import LoopingHorizontalCarousel in your file
2. Create array with CarouselElement values
3. Configure Carousel view using the init method

```Swift
import SwiftUI
import LoopingHorizontalCarousel

struct ContentView: View {
    let testElements: [CarouselElement] = [
        CarouselElement(text: "American football", image: "figure.american.football"),
        CarouselElement(text: "Soccer", image: "figure.soccer"),
        CarouselElement(text: "Swim", image: "figure.pool.swim"),
        CarouselElement(text: "Running", image: "figure.run")
    ]
    var body: some View {
        LoopingHorizontalCarousel(elements: testElements,
                                  speed: 2,
                                  backgroundColor: Color.red.opacity(0.8),
                                  foregroundColor: .black.opacity(0.9))
    }
}
```
Using the init method you can configure styles, speed and the possibility to allow the carousel to be scrolled by the user (default false)

```Swift
public init(elements: [CarouselElement],
            speed: Double = 8,
            repeatsNumber: Int = 20,
            spacing: CGFloat = 20,
            backgroundColor: Color = .gray,
            foregroundColor: Color = .black,
            scrollable: Bool = false)
```

You can set the speed using the speed parameter. If you use negative values you can reverse the direction of the animation.

#### 💡 Use cases

I developed this component to show the benefits of a premium subscription. Instead of showing a simple listing, showing the benefits with this view can draw more attention.
