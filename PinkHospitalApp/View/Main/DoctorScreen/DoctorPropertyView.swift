import SwiftUI

struct DoctorPropertyView: View {
    
    let propertyModel: DoctorPropertyUIModel
    
    init(propertyModel: DoctorPropertyUIModel) {
        self.propertyModel = propertyModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let experience = propertyModel.experience {
                property(image: Image(.timeout), name: "Опыт работы: \(experience) лет")
            }
            if let specificDegree = propertyModel.specificDegree {
                property(image: Image(.firstAidKit), name: specificDegree)
            }
            if !propertyModel.university.isEmpty {
                property(image: Image(.graduation), name: propertiesToString(to: propertyModel.university))
            }
            if !propertyModel.workExpirience.isEmpty
            {
                property(image: Image(.position), name: propertiesToString(to:propertyModel.workExpirience))
            }
        }
    }
    
    private func property(image: Image, name: String) -> some View{
        HStack( spacing: 12) {
            image
            Text(name)
                .font(.sub2)
            Spacer()
        }
        .foregroundColor(.docDarkgray)
    }
    
    private func propertiesToString(to properties:[String]) -> String {
        var propertyString = ""
        for i in 0..<properties.count {
            if i < properties.count - 1 {
                propertyString += properties[i] + ", "
            } else {
                propertyString += properties[i]
            }
        }
        return propertyString
    }

}

#Preview {
    DoctorPropertyView(propertyModel: .example)
}
