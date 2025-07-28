import SwiftUI

struct EpisodeItemView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.pink.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Image(systemName: "play.fill")
                    .foregroundColor(.pink)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color("CardBackground"))
        .cornerRadius(16)
    }
}
