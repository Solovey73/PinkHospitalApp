import Kingfisher
import SwiftUI

struct AvatarView: View {
    
    let urlString: String?
    
    var body: some View {
        VStack {
            if let urlString = urlString,
                let url = URL(string: urlString) {
                KFImage.url(url)
                    .resizable()
                    .placeholder {
                        Image(.noAvatar)
                            .foregroundColor(.docDarkgray)
                    }
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(25)
            } else {
                Image(.noAvatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(25)
                    .foregroundColor(.docDarkgray)
            }
        }
    }
    
    static let preview = AvatarView(urlString: "https://s3-alpha-sig.figma.com/img/5f49/2534/33f57cd84e006f761451a94ae688c02a?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jHUtiZW4jlshY4jSqpQCqmlO4h9UP04gixNU5G2~KjMdyQnO~H7OFYw41gokiVRIoEVYk-CmmrxLbstDCudXJGMq4wC7lnz9080g1T51hsXlnEdY9em-O7dTYt8STvcqQ1vd6RA1U0TDj0bdhh9kWQvcQuOAIYiGEabWy0D8H~7WoeMeNXWiayzuJluJOnxPWYgZYb4yZbD9UKNF1MbfL7BuJOJfkoQy3pO9HSz6tP5TWXePOA~wnURcbDi2~YqRNYYvlZjrIQR-nGYxRpVMkKMUurc8-xo7dY5--ugH1eGgzMjYt2b3kfEX1K9JN4qJcbfU3z88ijeu5p3SjKQGDw__")
    static let noAvatar = AvatarView(urlString: nil)
}

#Preview {
    AvatarView.preview
}

#Preview {
    AvatarView.noAvatar
}
