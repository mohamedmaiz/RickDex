import SwiftUI

struct ListCharactersView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView{
            LazyVStack {
                ForEach(viewModel.characters) {character in
                    NavigationLink(destination: CharacterDetailView(character: character)){  CharacterCard(
                        character: character,
                        isLastItem: character.id == viewModel.characters.last?.id && viewModel.nextPage != nil) {
                            Task{ try await viewModel.fetchCharacters() }
                        }}
                }
                if viewModel.nextPage != nil && viewModel.paginationErrorMessage == nil {
                    HStack {
                        Spacer()
                        ProgressView()
                            .tint(.white)
                        Spacer()
                    }
                }
                if let paginationError = viewModel.paginationErrorMessage {
                    HStack {
                        Spacer()
                        VStack {
                            Text(paginationError)
                                .foregroundColor(.red)
                            
                            Button("Retry") {
                                Task {
                                    try await viewModel
                                        .fetchCharacters()
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            .accentColor(.white)
            .padding(20)
        }
        .refreshable {
            viewModel.refresh()
        }
    }
}


