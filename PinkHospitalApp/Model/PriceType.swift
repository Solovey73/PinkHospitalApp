import Foundation

enum PriceType {
    case chat
    case video
    case home
    case hospital
    
    var name: String {
        switch self {
        case .chat:
            "Час с врачом"
        case .video:
            "Видеоконсультация"
        case .home:
            "Прием дома"
        case .hospital:
            "Прием в клинике"
        }
    }
    
    var comment: String {
        switch self {
        case .chat:
            "30 мин"
        case .video:
            "30 мин"
        case .home:
            "Вызов домой"
        case .hospital:
            "В клинике"
        }
    }
}
