import SwiftUI
import SDWebImageSwiftUI

struct NetworkImageView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    var cornerRadius: CGFloat = 12

    var body: some View {
        WebImage(url: URL(string: url))  
            .resizable()
            .indicator(.activity) // Spinner while loading
            .transition(.fade(duration: 0.25)) // Fade-in
            .scaledToFill()
            .frame(width: width, height: height)
            .clipped()
            .cornerRadius(cornerRadius)
    }
}
