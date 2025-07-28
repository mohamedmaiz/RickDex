import SwiftUI

struct ErrorView: View {
    let message: String
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            // Error Icon
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 120, height: 120)

                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.red)
            }

            // Main Title
            Text("Oops! Something went wrong")
                .font(.title2.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            // Sub Message
            Text(message)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)


            // Retry Button
            Button(action: onRetry) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Try Again")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.horizontal, 32)
        }
        .padding()
    }
}

