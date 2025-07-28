import SwiftUI

extension View {
    func screenBackground(_ color: Color = .black) -> some View {
        self
            .background(AppColor.background)
            .ignoresSafeArea(.container, edges: .top)
    }
}
