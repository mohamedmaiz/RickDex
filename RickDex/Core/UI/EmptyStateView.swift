import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 24) {
            // Icon Circle
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 120, height: 120)
                
                Image(systemName: "person.3.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundColor(Color.gray.opacity(0.6))
            }
            
            // Title
            Text("No Characters Found")
                .font(.title3.bold())
                .foregroundColor(.white)
            
            // Description
            Text("We couldn't find any characters matching your search. Try adjusting your search terms or check back later.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .padding()
    }
}
