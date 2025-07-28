
protocol HomeServiceProtocol {
    func fetchCharacters(name: String?, next: String?) async throws -> Result<CharacterResponse , APIError>
}

class HomeService: HomeServiceProtocol {
    func fetchCharacters(name: String? = nil , next: String? = nil)async throws  -> Result<CharacterResponse , APIError> {
        
         return try await APIClient.shared.request(
            CharacterResponse.self,
            endpoint: HomeAPI.fetchCharacters(name: name , nextUrl: next )
        )
    }
}
