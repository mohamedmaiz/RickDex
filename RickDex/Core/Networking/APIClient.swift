import Foundation

final class APIClient {
    static let shared = APIClient()
    
    func request<T: Decodable>(_ type: T.Type ,endpoint: Endpoint) async throws -> Result<T , APIError> {
        guard NetworkChecker.shared.isConnected else {
            return .failure( APIError.noInternet)
        }
        
        guard let url = endpoint.url else {
            return .failure( APIError.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(APIError.badResponse(error: "Invalid response"))
            }
            
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                if httpResponse.statusCode == 404 {
                    return .failure(APIError.notFound)
                }
                let errorMessage: String
                
                if let apiErrorResponse = try? JSONDecoder().decode(APIErrorResponse.self, from: data) {
                    errorMessage = apiErrorResponse.error
                } else {
                    errorMessage = "Unexpected error (HTTP \(httpResponse.statusCode))"
                }
                
                return .failure(APIError.badResponse(error: errorMessage))
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return .success(decoded)
            } catch {
                return .failure(APIError.decodingError)
            }
        } catch {
            return .failure(APIError.unknown(error))
        }
    }
}
