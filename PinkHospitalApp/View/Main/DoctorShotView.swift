import SwiftUI

struct DoctorShotView: View {
    
    private let doctorModel: DoctorShotUIModel
    private let handler: () -> Void
    
    init(doctorModel: DoctorShotUIModel,
         handler: @escaping () -> Void) {
        self.doctorModel = doctorModel
        self.handler = handler
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment:.top, spacing: 16) {
                doctorAvatar
                doctorInformation
                isFavoriteButton
            }
            button
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.docWhite)
    }
    
    private var doctorAvatar: some View {
        AvatarView(urlString: doctorModel.avatarStringURL)
    }
    
    private var doctorInformation: some View {
        VStack(alignment:.leading, spacing: 8) {
            VStack(alignment:.leading, spacing: 8) {
                Text(doctorModel.lastName)
                    .multilineTextAlignment(.leading)
                Text(doctorModel.firstName + " " + doctorModel.patronymic)
                    .multilineTextAlignment(.leading)
            }
            .font(.h4)
            .foregroundColor(.docBlack)
            
            HStack {
                RatingView(rating: doctorModel.rating)
                Spacer()
            }
            
            Text(getSpecialization())
                .font(.sub2)
                .foregroundColor(.docDarkgray)
                .multilineTextAlignment(.leading)
            
            Text("от \(doctorModel.minPrice) ₽")
                .font(.h4)
                .foregroundColor(.docBlack)
        }
    }
    
    private var isFavoriteButton: some View {
        Button(action: {
          // пост заброс добавить/убрать доктора из избранного
        }, label: {
            Image(.like)
                .foregroundColor(doctorModel.isFavorite ? .docPink : .docSilver)
        })
    }
    
    private var button: some View {
        SignUpButton(isFree: doctorModel.isFree,
                     completion: handler)
    }
    
    private func getSpecialization() -> String {
        var text = ""
        doctorModel.specilization.forEach { special in
            text += special + "・"
        }
        text += "Стаж \(doctorModel.experience) лет"
        return text
    }
}

#Preview {
    DoctorShotView(doctorModel: .example) {
        
    }
}

