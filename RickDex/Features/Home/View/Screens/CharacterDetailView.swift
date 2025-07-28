import SwiftUI

struct CharacterDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let character: Character
    var body: some View {
        
        ZStack {
            ScrollView{
                NetworkImageView(
                    url: character.image,
                    width: .infinity,
                    height: 350,
                    cornerRadius: 0
                )
                .clipped()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            AppColor.background,
                            AppColor.background.opacity(0.1)]),
                        startPoint: .bottom,
                        endPoint: .center
                    )
                )
            
                CharacterHeaderView(character: character)
                    .padding(.leading , 30)
                    .padding(.trailing , 30)
                    .padding(.bottom , 30)
                
                // Details
                VStack(spacing: 12) {
                    DetailItemView(
                    icon: "timelapse",
                    title: "Species",
                    value: "\(character.species)",
                    iconColor: .green
                    )
                    DetailItemView(
                        icon: "flask",
                        title: "Type",
                        value: "\(character.type)",
                        iconColor: .purple
                    )
                    DetailItemView(
                        icon: "paperplane",
                        title: "Origin",
                        value: "\(character.origin.name)",
                        iconColor: .blue,
                        showLinkIcon: true
                    )
                    DetailItemView(icon: "mappin.and.ellipse", title: "Last Location", value: "\(character.location.name)", iconColor: .orange, showLinkIcon: true)
                }
                .padding(.bottom , 16)
                
                
                // Episodes
                EpisodeListView(character: character)
                    .padding(.bottom , 16)
                
                // Metadata
                MetadataItemView(label: "MetaData", value: "\(formatDate(character.created))")
                    .padding(.leading , 16)
                    .padding(.trailing , 16)
                    .padding(.bottom , 16)
                
            }
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(AppColor.background.opacity(0.9)))
            }
            .position(x: 36  , y: 80)
        }.screenBackground()
            .navigationBarBackButtonHidden(true)
        
        
        
    }
}


