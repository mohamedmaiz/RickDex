import SwiftUI
struct EpisodeListView: View {
    let character: Character // Your dynamic list
    @State private var showAll = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Episodes")
                    .font(.system(size: 18 , weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text("\(character.episode.count) episode")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            ForEach(Array((showAll ? character.episode : Array(character.episode.prefix(3))).enumerated()), id: \.1) { index, episode in
                EpisodeItemView(
                    title: "Episode \(index + 1)",
                    subtitle: episode // or any logic using the link
                )
            }
            
            if character.episode.count > 3 {
                Button(action: {
                    withAnimation {
                        showAll.toggle()
                    }
                }) {
                    Text(showAll ? "Show Less" : "Show More")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.leading , 20)
                }
            }
        }
        .padding(.leading , 16)
        .padding(.trailing , 16)
        
    }
}
