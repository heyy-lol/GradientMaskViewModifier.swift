import SwiftUI

struct GradientMaskViewModifier: ViewModifier {
    @Binding var colors: [Color]
    @State private var animatedColors: [Color] = []
        
    init(colors: Binding<[Color]>) {
        self._colors = colors
        self._animatedColors = State(initialValue: colors.wrappedValue)
    }
    
    // MARK: - ViewModifier
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.clear)
            .background {
                LinearGradient(colors: animatedColors,
                               startPoint: .leading,
                               endPoint: .trailing)
                .mask(content)
            }
            .onChange(of: colors) { _, newColors in
                withAnimation {
                    self.animatedColors = newColors
                }
            }
    }
}

// MARK: - Extension

extension View {
    func gradientMask(colors: Binding<[Color]>) -> some View {
        modifier(GradientMaskViewModifier(colors: colors))
    }
}

// MARK: - Preview

struct GradientMaskPreview: View {
    @State private var gradientColors: [Color] = [.random, .random]
    
    var body: some View {
        Text("Tap to randomize")
            .gradientMask(colors: $gradientColors)
            .onTapGesture {
                self.gradientColors = [.random, .random]
            }
    }
}


#Preview {
    GradientMaskPreview()
}
