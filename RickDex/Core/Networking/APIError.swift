import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case noInternet
    case badResponse(error: String? = nil)
    case notFound
    case decodingError
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .noInternet: return "No internet connection"
        case .badResponse(let code): return code ?? "Bad Response"
        case .notFound:
                    return "No characters matched your search."
        case .decodingError: return "Failed to decode data"
        case .unknown(let error): return error.localizedDescription
        }
    }
}
