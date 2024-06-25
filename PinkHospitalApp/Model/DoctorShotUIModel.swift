import Foundation

struct DoctorShotUIModel {
    let id: String
    let firstName: String
    let lastName: String
    let patronymic: String
    let avatarStringURL: String?
    let isFavorite: Bool
    let rating: Double
    var specilization: [String]
    
    let experience: Int
    let minPrice: Int
    let isFree: Bool
    
    init(id: String,
         firstName: String,
         lastName: String,
         patronymic: String,
         avatarStringURL: String?,
         isFavorite: Bool,
         rating: Double,
         specilization: [String],
         experience: Int,
         minPrice: Int,
         isFree: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.patronymic = patronymic
        self.avatarStringURL = avatarStringURL
        self.isFavorite = isFavorite
        self.rating = rating
        self.specilization = specilization
        self.experience = experience
        self.minPrice = minPrice
        self.isFree = isFree
    }
    
    init(networkModel: User) {
        self.id = networkModel.id
        self.firstName = networkModel.firstName
        self.lastName = networkModel.lastName
        self.patronymic = networkModel.patronymic
        self.avatarStringURL = networkModel.avatar
        self.isFavorite = networkModel.isFavorite
        self.rating = networkModel.ratingsRating
        self.specilization = ConverterNetworkModel.getSpecialization(specialization: networkModel.specialization,
                                                                     workExpirience: networkModel.workExpirience, advancedTraining: networkModel.advancedTraining)
        self.experience = networkModel.seniority
        self.minPrice = ConverterNetworkModel.getMinPrice(text: networkModel.textChatPrice,
                                                      video: networkModel.videoChatPrice,
                                                      home: networkModel.homePrice,
                                                      hospital: networkModel.hospitalPrice)
        self.isFree = !networkModel.freeReceptionTime.isEmpty
    }
    

    
    static let example = DoctorShotUIModel(id: "1",
                                           firstName: "Кирилл",
                                           lastName: "Осташков",
                                           patronymic: "Вячеславович",
                                           avatarStringURL: "https://s3-alpha-sig.figma.com/img/5f49/2534/33f57cd84e006f761451a94ae688c02a?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jHUtiZW4jlshY4jSqpQCqmlO4h9UP04gixNU5G2~KjMdyQnO~H7OFYw41gokiVRIoEVYk-CmmrxLbstDCudXJGMq4wC7lnz9080g1T51hsXlnEdY9em-O7dTYt8STvcqQ1vd6RA1U0TDj0bdhh9kWQvcQuOAIYiGEabWy0D8H~7WoeMeNXWiayzuJluJOnxPWYgZYb4yZbD9UKNF1MbfL7BuJOJfkoQy3pO9HSz6tP5TWXePOA~wnURcbDi2~YqRNYYvlZjrIQR-nGYxRpVMkKMUurc8-xo7dY5--ugH1eGgzMjYt2b3kfEX1K9JN4qJcbfU3z88ijeu5p3SjKQGDw__",
                                           isFavorite: false,
                                           rating: 5.0,
                                           specilization: ["Педиатр"],
                                           experience: 10,
                                           minPrice: 600,
                                           isFree: true)
    
    static let examples: [DoctorShotUIModel] = [DoctorShotUIModel(id: "2",
                                                                  firstName: "Кирилл",
                                                                  lastName: "Осташков",
                                                                  patronymic: "Вячеславович",
                                                                  avatarStringURL: "https://s3-alpha-sig.figma.com/img/5f49/2534/33f57cd84e006f761451a94ae688c02a?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jHUtiZW4jlshY4jSqpQCqmlO4h9UP04gixNU5G2~KjMdyQnO~H7OFYw41gokiVRIoEVYk-CmmrxLbstDCudXJGMq4wC7lnz9080g1T51hsXlnEdY9em-O7dTYt8STvcqQ1vd6RA1U0TDj0bdhh9kWQvcQuOAIYiGEabWy0D8H~7WoeMeNXWiayzuJluJOnxPWYgZYb4yZbD9UKNF1MbfL7BuJOJfkoQy3pO9HSz6tP5TWXePOA~wnURcbDi2~YqRNYYvlZjrIQR-nGYxRpVMkKMUurc8-xo7dY5--ugH1eGgzMjYt2b3kfEX1K9JN4qJcbfU3z88ijeu5p3SjKQGDw__",
                                                                  isFavorite: false,
                                                                  rating: 5.0,
                                                                  specilization: ["Педиатр"],
                                                                  experience: 10,
                                                                  minPrice: 600,
                                                                  isFree: true),
                                                DoctorShotUIModel(id:"3",
                                                                  firstName: "Дарья",
                                                                  lastName: "Семенова",
                                                                  patronymic: "Сергеевна",
                                                                  avatarStringURL: "https://s3-alpha-sig.figma.com/img/db3a/25c5/e8059ddc791569ce8ae2d2b6fe1929c7?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CC1OkwW0RRowzXNL1KYZ9bp9FRKp901gQFTbVLmM5Zq0VzkbucJTLauWjzXuyLPosmaOxaIe3K1ghzlMakdiiaTRZSU8PL-ghU~TA95OLBVe1JNS6KmvIZns6zrHYs~kEx2NZ6OqwgORAkuwHSg3GBTEns-9UNQYtxLqUVDRF9XsMR-P4fuOt1dPuV9T4Fvm8mDN6CsUZF4HghUPNafz6Gd7wAGVveiUQTPyEnt2qvD7B6IH76uE18RraYJxIsWIFhq7BDBG6xRvQbN7qTXbYN~APwkGswccZFq6aYDJv1hypXM260PKXwprh1Brag6Q2sAt95mvvaQ1XBGrlhL21Q__",
                                                                  isFavorite: true,
                                                                  rating: 5.0,
                                                                  specilization: ["Педиатр"],
                                                                  experience: 27,
                                                                  minPrice: 900,
                                                                  isFree: false),
                                                DoctorShotUIModel(id: "4",
                                                                  firstName: "Кристина",
                                                                  lastName: "Бардо",
                                                                  patronymic: "Алексеевна",
                                                                  avatarStringURL: "https://s3-alpha-sig.figma.com/img/2ed3/536b/709de19d6a5629092c5937b227f5c0de?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=P92Is2OZVGSH8nq0yqRjaWxCXsKkqMite1Ujr892huoVqIIcwuS7t4Ka3rouRjF4WS1eUqliU43r3oxNquJAC9rZWx~WWT-uRhX0m33Ezscphnw4JnQot9ukM4OeH61~CO1nC~jDRMGoYwliZo9nwvjmQjajXbYCrR47LZsAbm17VHHAXq8XkfyF2CH1nk1TB6wB0BrlHRE7xTmAdYdrOBVKDotUvdQjQn36jgjrL2dIKfwxZpUCxCxMcW6~l~FXfpnoDpVIhDuk8L9iX~ZbCXLZ38FYZmZpgsB-9DDGXZdYhgY9q4kFhZ4HMlhvMnc3JOa2NmU~vMyYa-zpfq6dzg__",
                                                                  isFavorite: false,
                                                                  rating: 4.0,
                                                                  specilization: ["Педиатр", "Офтальмолог"],
                                                                  experience: 10,
                                                                  minPrice: 800,
                                                                  isFree: true)
    ]
}
