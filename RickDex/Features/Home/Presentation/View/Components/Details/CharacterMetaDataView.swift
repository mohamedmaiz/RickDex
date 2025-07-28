import SwiftUI

struct MetadataItemView: View {
    var label: String
    var value: String
    var isLink: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            Text("Metadata")
                .font(.system(size: 18 , weight: .bold))
                .foregroundColor(.white)
            
            
            HStack {
                Text(label)
                    .foregroundColor(.gray)
                
                Spacer()
                
                if isLink {
                    HStack(spacing: 4) {
                        Text("View")
                        Image(systemName: "arrow.up.right.square")
                    }
                    .foregroundColor(.blue)
                    .font(.subheadline.bold())
                } else {
                    Text(value)
                        .foregroundColor(.white)
                }
            }
            
            .padding()
            .frame( height: 60)
            .background(AppColor.cardBackground)
            .cornerRadius(AppCornerRadius.medium)
            .overlay(
                RoundedRectangle(cornerRadius: AppCornerRadius.medium)
                    .stroke(AppColor.borderDefault, lineWidth: 1)
                
            )
        }
        
    }
}


