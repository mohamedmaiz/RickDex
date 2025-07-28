import SwiftUI



#Preview {
    CharacterCardPlaceholder()
}

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = -0.6

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height

                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.4),
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: width * 2, height: height * 2)
                    .rotationEffect(.degrees(30))
                    .offset(x: width * phase, y: 0)
                    .blendMode(.plusLighter)
                }
            )
            .mask(content)
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 1.5)
                        .repeatForever(autoreverses: false)
                ) {
                    phase = 0.6
                }
            }
    }
}

// Reusable modifier function
extension View {
    func shimmer() -> some View {
        modifier(ShimmerModifier())
    }
}

struct CharacterCardPlaceholder: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.white.opacity(0.1))
                    .frame(width: 56, height: 56)
                    .shimmering(
                        gradient:Gradient(
                            colors: [
                                .white.opacity(0.2) ,
                                .white.opacity(0.3) ,
                                .white.opacity(0.3) ,
                                .white.opacity(0.2) ,
                            ]
                        )
                    )
                
                VStack (alignment: .leading){
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.white.opacity(0.1))
                        .frame(width: 180, height: 16)
                        .shimmering(
                            gradient:Gradient(
                                colors: [
                                    .white.opacity(0.2) ,
                                    .white.opacity(0.3) ,
                                    .white.opacity(0.3) ,
                                    .white.opacity(0.2) ,
                                    
                                ]
                            )
                        )
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.white.opacity(0.1))
                        .frame(width: 100, height: 14)
                        .shimmering(
                            gradient:Gradient(
                                colors: [
                                    .white.opacity(0.2) ,
                                    .white.opacity(0.3) ,
                                    .white.opacity(0.3) ,
                                    .white.opacity(0.2) ,
                                    
                                ]
                            )
                        )
                   
                }
                Spacer()
            }

            
        }
        .padding()
        .frame(height: 80)
        .background(AppColor.cardBackground.opacity(0.6))
        .cornerRadius(16)
        .shadow(radius: 2)
        
    }
}



