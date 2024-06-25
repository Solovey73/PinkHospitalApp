import Foundation

struct DoctorPropertyUIModel {
    let experience: Int?
    let specificDegree: String?
    let university: [String]
    let workExpirience: [String]
    
    init(experience: Int?,
         specificDegree: String?,
         university: [String],
         workExpirience: [String]) {
        self.experience = experience
        self.specificDegree = specificDegree
        self.university = university
        self.workExpirience = workExpirience
    }
    
    init(netWorkModel: User) {
        self.experience = netWorkModel.seniority
        self.specificDegree = netWorkModel.scientificDegreeLabel
        self.university = ConverterNetworkModel.getEducation(educationTypeLabel: netWorkModel.educationTypeLabel,
                                                             higherEducation: netWorkModel.higherEducation,
                                                             advancedTraining: netWorkModel.advancedTraining)
        self.workExpirience = ConverterNetworkModel.getWorkExpirience(worksExpirience: netWorkModel.workExpirience)
        
    }
    
    static let example = DoctorPropertyUIModel(experience: 10,
                                               specificDegree:"Врач высшей категории",
                                               university: ["1-й ММИ им. И.М.Сеченова"],
                                               workExpirience: ["Больница1","Больница2"])
}

