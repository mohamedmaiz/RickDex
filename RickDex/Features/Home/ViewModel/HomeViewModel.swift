import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {

    private let homeService: HomeService = HomeService()
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Published Properties
    @Published var isLoading: Bool = true
    @Published var errorMessage: APIError?
    @Published var paginationErrorMessage: String?
    @Published var characters: [Character] = []
    @Published var nextPage: String?
    @Published var name: String = ""

    // MARK: - Init
    init() {
        setupSearchDebounce()
        Task {
            try await fetchCharacters()
        }
    }

    // MARK: - Search Debounce
    private func setupSearchDebounce() {
        $name
            .removeDuplicates()
            .debounce(for: .milliseconds(700), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    try await self.fetchCharacters(initial: true)
                }
            }
            .store(in: &cancellables)
    }

    // MARK: - Public Methods
    func refresh() {
        Task {
            try await fetchCharacters(initial: true)
        }
    }

    func fetchCharacters(initial: Bool = false) async throws {
        paginationErrorMessage = nil

        if initial {
            isLoading = true
            reset()
        }

        let result = try await homeService.fetchCharacters(
            name: name,
            next: nextPage
        )

        switch result {
        case .success(let response):
            characters.append(contentsOf: response.results)
            nextPage = response.info.next
        case .failure(let error):
            if nextPage != nil {
                paginationErrorMessage = error.localizedDescription
            } else {
                errorMessage = error
            }
        }

        isLoading = false
    }

    // MARK: - Reset
    private func reset() {
        characters = []
        errorMessage = nil
        paginationErrorMessage = nil
        nextPage = nil
    }
}
