import Foundation

enum Endpoint {
    
    case main
    
    static var baseURL: URL {
        URL(string:"https://api.jsonbin.io")!
    }
        
    var path: String {
        switch self {
        case .main:     return "/v3/b/655b754e0574da7622c94aa4"
        }
    }
    
    var url: URL? {
        switch self {
        case .main:      return URL(string: Endpoint.main.path, relativeTo: Endpoint.baseURL)
        }
    }
}
