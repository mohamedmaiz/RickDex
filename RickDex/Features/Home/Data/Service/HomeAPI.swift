import Foundation

enum HomeAPI : Endpoint {
    case fetchCharacters(name: String? , nextUrl: String?)
    
    var path: String {"character"}
    var method: HTTPMethod {.get}
    var queryItems: [URLQueryItem]? {
        switch self {
        case .fetchCharacters(let name , _ ):
            var queries: [URLQueryItem]?
            if let name = name {
                queries = [URLQueryItem(name: "name", value: name)]
            }
            return queries
        }
    }
    var customURL: String? {
        switch self {
        case .fetchCharacters(_, let nextUrl):
            if let nextUrl = nextUrl {return nextUrl} else {return nil}
        }
    }
    
}
