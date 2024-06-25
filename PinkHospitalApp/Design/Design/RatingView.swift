import SwiftUI

struct RatingView: View {
    let rating: Double
    
    init(rating: Double) {
        self.rating = rating
    }
    
    var body: some View {
        ZStack {
            HStack(spacing:0) {
                ForEach(0..<5) { index in
                    Image(.star)
                        .foregroundColor(Double(index) <= (rating - 1) ? .docPink : .docDarkgray)
                }
            }
        }
    }
}

#Preview {
    RatingView(rating: 5)
}
