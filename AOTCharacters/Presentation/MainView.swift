//
//  MainView.swift
//  AOTCharacters
//
//  Created by Bahaa Alramlawi on 09/06/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            CharacterListView(viewModel: viewModel)
                .navigationTitle(Strings.appTitle)
                .task {
                    await viewModel.loadCharacters()
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

