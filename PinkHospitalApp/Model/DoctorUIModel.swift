import Foundation

struct DoctorUIModel {
    let id: String
    let specialization: String
    let firstName: String
    let lastName: String
    let patronymic: String?
    let avatarURLString: String?
    let property: DoctorPropertyUIModel
    let minPrice: Int
    let comment: String?
    let isFree: Bool
    
    init(id: String,
         specialization: String,
         firstName: String,
         lastName: String,
         patronymic: String?,
         avatarURLString: String?,
         property: DoctorPropertyUIModel,
         minPrice: Int,
         comment: String?,
         isFree: Bool) {
        self.id = id
        self.specialization = specialization
        self.firstName = firstName
        self.lastName = lastName
        self.patronymic = patronymic
        self.avatarURLString = avatarURLString
        self.property = property
        self.minPrice = minPrice
        self.comment = comment
        self.isFree = isFree
    }
    
    init(networkModel: User) {
        self.id = networkModel.id
        self.specialization = ConverterNetworkModel.getSpecialization(specialization: networkModel.specialization,
                                                                      workExpirience: networkModel.workExpirience,
                                                                      advancedTraining: networkModel.advancedTraining).last ?? ""
        self.firstName = networkModel.firstName
        self.lastName = networkModel.lastName
        self.patronymic = networkModel.patronymic
        self.avatarURLString = networkModel.avatar
        self.property = DoctorPropertyUIModel(netWorkModel: networkModel)
        self.minPrice = ConverterNetworkModel.getMinPrice(text: networkModel.textChatPrice,
                                                          video: networkModel.videoChatPrice,
                                                          home: networkModel.homePrice,
                                                          hospital: networkModel.hospitalPrice)
        self.comment = DoctorUIModel.comment
        self.isFree = !networkModel.freeReceptionTime.isEmpty
    }
    
    static let example = DoctorUIModel(id:"1",
                                       specialization: "Педиатр",
                                       firstName: "Дарья",
                                       lastName: "Семенова",
                                       patronymic: "Сергеевна",
                                       avatarURLString: "https://s3-alpha-sig.figma.com/img/d50e/08cd/b9d9ac569033b1ee8ac335f543c3bce0?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FsOVkAnFFyqWpC5cDbXGECI3eqg7HvczmgrNSnrBYspthbQAGbxDOiVCqFb-m37wQlzkjjM2ufop7RfVFtmjmV4A~cIrO6pEDBX2vKdwqsmolmqblRkfFKXTEcSjnCGWPoCMDnsoYMQR1sWvJYEK0jMj~Gaozsbf1qBAnmAyb0XTkt3GIkrO98H7tOb4HPQWwcIluOSJFf62w4KuZXT3I-3JoUxKUJSuttCHsI5Gxlan0fruXAHz-sLnLj9GNfAwXOgPpqZyl2SVNgGftvMOjc-nNC09Ky6ZvlK7wPbQNpRnPrq6miLoCGVymoDSWelp-pcHPGvuXVBFuG8eQSAFHQ__",
                                       property: .example,
                                       minPrice: 600,
                                       comment: DoctorUIModel.comment,
                                       isFree: true)
    
    static let comment = "Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке."
    
}

