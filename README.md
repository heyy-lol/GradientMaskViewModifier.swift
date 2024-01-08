# GradientMaskViewModifier.swift
* Adds a gradient mask to the view
* Supports animation
## Usage
```
struct GradientMaskPreview: View {
    @State private var gradientColors: [Color] = [.random, .random]
    
    var body: some View {
        Text("Tap to randomize")
            .gradientMask(colors: $gradientColors)
            .onTapGesture {
                gradientColors = [.random, .random]
            }
    }
}
```
