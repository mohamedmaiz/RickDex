import SwiftUI

struct HomeView: View {
    @ObservedObject  private var  viewModel =  HomeViewModel()
    var body: some View {
        NavigationStack{
            ScrollViewReader{ scrollProxy in
                ScrollView {
                    LazyVStack( pinnedViews: [.sectionHeaders]){
                        Section(header:
                                    
                                    SearchBarView(viewModel: viewModel)
                            .padding(.top , 40)
                            .padding(.bottom , 12)
                            .background(AppColor.background)
                                
                        ) {
                            
                            if viewModel.isLoading {
                                ScrollView{ ForEach(0..<8, id: \.self) { _ in
                                    CharacterCardPlaceholder()
                                }
                                }
                                .scrollDisabled(true)
                                .padding(20)
                            }else if let error = viewModel.errorMessage {
                                switch error {
                                case .notFound:
                                    EmptyStateView()
                                default:
                                    ErrorView(
                                        message: error.localizedDescription
                                    ) {
                                        Task {
                                            try await viewModel
                                                .fetchCharacters(
                                                    initial: true
                                                )
                                        }
                                    }
                                }
                                
                            } else {
                                ListCharactersView(viewModel: viewModel)
                            }
                        }
                        .onChange(of: viewModel.name) {
                            withAnimation {
                                scrollProxy.scrollTo("Top", anchor: .top)
                            }
                        }
                        
                        
                    }
                    
                    
                }
                .screenBackground()
                
                .refreshable {
                    viewModel.refresh()
                }
            }
        }
        
    }
    
}

#Preview {
    HomeView()
}

