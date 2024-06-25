import SwiftUI

struct DoctorScreenView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    let model: DoctorUIModel
    let viewModel: MainViewModel
    
    init(model: DoctorUIModel, viewModel: MainViewModel) {
        self.model = model
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        names
                        properties
                        priceAndComment
                    }
                }
                button
            }
            .padding()
            .background(Color.docLightgray)
            .modifyNavigation(title: model.specialization) {
                coordinator.pop()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    var names: some View {
        HStack(alignment:.center, spacing:16) {
            doctorAvatar
            VStack(alignment:.leading, spacing: 8) {
                Text(model.lastName)
                Text(model.firstName + " " + (model.patronymic ?? ""))
            }
            .font(.h4)
            .foregroundColor(.docBlack)
        }
    }
    
    private var doctorAvatar: some View {
        AvatarView(urlString: model.avatarURLString)
    }
    
    private var properties: some View {
        DoctorPropertyView(propertyModel: model.property)
    }
    
    private var priceAndComment: some View {
        VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Text("Стоимость услуг")
                    Spacer()
                    Text("от \(model.minPrice) ₽")
                }
                .font(.h4)
                .foregroundColor(.docBlack)
                .padding(.horizontal, 16)
                .frame(height: 57)
                .background(Color.docWhite)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.docGrey, lineWidth: 1)
                }
                .onTapGesture {
                    let user = viewModel.getUser(id: model.id)
                    coordinator.push(.price, user: user)
                }
            
            if let comment = model.comment {
                Text(comment)
                    .foregroundColor(.docBlack)
                    .font(.sub2)
                    .lineSpacing(8)
            }
        }
    }
    
    private var button: some View {
        SignUpButton(isFree: model.isFree) {
            print("Press записаться")
        }
    }
}

#Preview {
    DoctorScreenView(model: .example, viewModel: .prewiev)
}
