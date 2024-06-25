import Foundation

class ConverterNetworkModel {
    
    static func getUser(from answer: Answer) -> [User] {
        return answer.record.data.users
    }
    
    static func getSpecialization(specialization: [Specialization],
                                   workExpirience: [WorkExpirience],
                                  advancedTraining: [AdvancedTraining]) -> [String] {
        var specs = [String]()
        specialization.forEach { specs.append($0.name) }
        workExpirience.forEach { specs.append($0.position)}
        advancedTraining.forEach { specs.append($0.position)}
        return specs
    }
    
    static func getMinPrice(text: Int, video: Int, home: Int, hospital: Int) -> Int {
        let minPrice = [text, video, home, hospital].filter { $0 != 0 }
        return minPrice.min() ?? 0
    }
    
    static func getEducation(educationTypeLabel: EducationTypeLabel?,
                             higherEducation: [HigherEducation],
                             advancedTraining: [AdvancedTraining]) -> [String] {
        var edu = [String]()
        if let educationTypeLabel {
            edu.append(educationTypeLabel.name)
        }
        higherEducation.forEach { edu.append($0.university) }
        advancedTraining.forEach { edu.append($0.organization) }
        return edu
    }
    
    static func getWorkExpirience(worksExpirience: [WorkExpirience]) -> [String] {
        var works = [String]()
        worksExpirience.forEach { workExpirience in
            if workExpirience.untilNow {
                works.append(workExpirience.organization)
            }
        }
        return works
    }
    
    static func getPrices(networkModel: User) -> PricesUIModel {
        
        var pricesUIModel = PricesUIModel()
        if networkModel.textChatPrice != 0 {
            pricesUIModel.chat = PriceUIModel(type: .chat, price: networkModel.textChatPrice)
        }
        if networkModel.videoChatPrice != 0 {
            pricesUIModel.video = PriceUIModel(type: .video, price: networkModel.videoChatPrice)
        }
        if networkModel.homePrice != 0 {
            pricesUIModel.home = PriceUIModel(type: .home, price: networkModel.homePrice)
        }
        if networkModel.hospitalPrice != 0 {
            pricesUIModel.hospital = PriceUIModel(type: .hospital, price: networkModel.hospitalPrice)
        }
        return pricesUIModel
    }
    
}
