import Foundation

enum DoctorSort: CaseIterable {
    case price
    case experience
    case rating
    
    var name: String {
        switch self {
        case .price:
            "По цене"
        case .experience:
            "По стажу"
        case .rating:
            "По рейтингу"
        }
    }
}
