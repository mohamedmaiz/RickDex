import SwiftUI

struct CharacterCard : View {
    let character: Character
    let isLastItem: Bool
    let fetchMore: ()-> Void
    var body: some View {
        HStack{
            NetworkImageView(
                url: character.image,
                width: 56,
                height: 56
            )
            .padding(.leading , 16)
            VStack (alignment: .leading){
                Text("\(character.name)")
                    .foregroundColor(.white)
                
                HStack {
                    Circle()
                        .fill(
                            getStatusColor(character.status)
                        )
                        .frame(width: 6 , height: 6)
                    
                    Text("\(character.species)")
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                
            }
            .padding(.leading , 8)
            .onAppear{
                if isLastItem {
                    fetchMore()
                }
            }
            Spacer()
            Image(systemName: "chevron.forward")
                .tint(AppColor.hintText )
                .padding(.trailing , 16)
        }
        .frame( height: 80)
        .background(AppColor.cardBackground)
        .cornerRadius(AppCornerRadius.medium)
        .overlay(
            RoundedRectangle(cornerRadius: AppCornerRadius.medium)
                .stroke(AppColor.borderDefault, lineWidth: 1)
        )
    }
}
