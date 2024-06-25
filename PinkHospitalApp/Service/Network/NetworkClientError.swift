import Foundation

enum NetworkClientError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
    case urlParsingError
    case customError(String)
}

extension NetworkClientError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .httpStatusCode(let code):
            switch code {
            case 429: return "httpStatusCode429"
            case 400..<500:
                return "httpStatusCode4xx"
            case 500..<600:
                return "httpStatusCode5xx"
            default: return "httpStatusCode"
            }
        case .urlRequestError:
            return "urlRequestError"
        case .urlSessionError:
            return "urlSessionError"
        case .urlParsingError:
            return "parsingError"
        case .customError(let message):
            return message
        }
    }
}

