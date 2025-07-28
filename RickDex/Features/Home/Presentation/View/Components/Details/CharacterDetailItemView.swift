import SwiftUI
struct DetailItemView: View {
    var icon: String
    var title: String
    var value: String
    var iconColor: Color = .green
    var showLinkIcon: Bool = false

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(iconColor.opacity(0.2))
                    .frame(width: 46, height: 46)

                Image(systemName: icon)
                    .foregroundColor(iconColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.body.bold())
                    .foregroundColor(.white)
            }

            Spacer()

            if showLinkIcon {
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(iconColor)
            }
        }
        .padding()
        .frame( height: 80)
        .background(AppColor.cardBackground)
        .cornerRadius(AppCornerRadius.medium)
        .overlay(
            RoundedRectangle(cornerRadius: AppCornerRadius.medium)
                .stroke(AppColor.borderDefault, lineWidth: 1)
        )
        .padding(.leading , 16)
        .padding(.trailing , 16)
    }
}
