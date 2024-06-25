import SwiftUI

struct PriceScreenView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    let model: PricesUIModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment:.leading, spacing: 24) {
                    if let video = model.video {
                        PriceView(model: video)
                    }
                    if let chat = model.chat {
                        PriceView(model: chat)
                    }
                    if let hospital = model.hospital {
                        PriceView(model: hospital)
                    }
                    if let home = model.home {
                        PriceView(model: home)
                    }
                    
                }
                .padding()
            }
            .background(Color.docLightgray)
            .modifyNavigation(title: "Стоимость услуг") {
                coordinator.pop()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PriceScreenView(model: .example)
}
