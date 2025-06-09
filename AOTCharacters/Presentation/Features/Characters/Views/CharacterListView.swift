//
//  CharacterListView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterViewModel
    @State private var isGridView = false

    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            HStack {
                SearchBar(text: $viewModel.searchText)
                Button(action: {
                    withAnimation {
                        isGridView.toggle()
                    }
                }) {
                    Image(systemName: isGridView ? "list.bullet" : "square.grid.2x2")
                        .imageScale(.large)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)

            ScrollView {
                if isGridView {
                    LazyVGrid(columns: gridColumns, spacing: 16) {
                        characterItems
                    }
                    .padding()
                } else {
                    LazyVStack(spacing: 12) {
                        characterItems
                    }
                    .padding()
                }

                // Loading Spinner
                if viewModel.isLoading {
                    ProgressView().padding()
                }
            }
            .refreshable {
                await viewModel.refresh()
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    ErrorView(error: error) {
                        Task {
                            await viewModel.refresh()
                        }
                    }
                }
            }
        }
        .navigationTitle(Strings.characters)
    }

    @ViewBuilder
    private var characterItems: some View {
        ForEach(viewModel.filteredCharacters) { character in
            CharacterRowView(character: character, isGrid: isGridView)
                .onAppear {
                    if character.id == viewModel.characters.last?.id {
                        Task {
                            await viewModel.loadMoreCharacters()
                        }
                    }
                }
        }
    }
}
