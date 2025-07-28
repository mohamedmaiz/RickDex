import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
    var url: URL? { get }
    var customURL: String? {get}
}

extension Endpoint {
    var baseURL: String {
        return "https://rickandmortyapi.com/api/"
    }

    var url: URL? {
        if let customURL = customURL {return URL(string: customURL)} else {
            var components = URLComponents(string: baseURL + path)
              components?.queryItems = queryItems
            return components?.url
        }
    }
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? { nil }   // default: none
    var body: Data? { nil }   // default: none
    var customURL: String? {nil}
}
