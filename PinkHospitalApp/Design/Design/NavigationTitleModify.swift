import SwiftUI

struct NavigationTitleModify: ViewModifier {
    
    var title: String
    var backAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(.backNavButton)
                        .foregroundColor(.docDarkgray)
                        .onTapGesture {
                            backAction()
                        }
                }
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(title)
                            .font(.h3)
                            .foregroundColor(Color.black)
                    }
                }
            }
    }
}

extension View {
    func modifyNavigation(title: String, backAction: @escaping () -> Void) -> some View {
        self.modifier(NavigationTitleModify(title: title, backAction: backAction))
    }
}
