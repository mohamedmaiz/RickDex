import SwiftUI

struct CharacterHeaderView : View {
    let character: Character
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(character.name)
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("ID")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("#\(character.id)")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            
            HStack(spacing: 10) {
                Circle()
                    .fill(
                        getStatusColor(character.status)
                    )
                    .frame(width: 8, height: 8)
                Text("\(character.status)")
                    .foregroundColor(
                        getStatusColor(character.status)
                    )
                    .font(.system(size: 16 , weight: .bold))
                Circle()
                    .fill(AppColor.hintText)
                    .frame(width: 5, height: 5)
                    .foregroundColor(.gray)
                Text("\(character.gender)")
                    .foregroundColor(.white)
            }
            .font(.subheadline)
        }
    }
}
