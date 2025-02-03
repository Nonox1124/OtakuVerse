//
//  AuthorCreationPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI

struct AuthorPage: View {
    
    @ObservedObject var navigationController: NavigationController
    
    @State private var isCreatedSelected: Bool = true
    @State private var isDeletedSelected: Bool = false
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            if (isCreatedSelected) {
                AuthorCreatorView()
            } else {
                AuthorDeletedView()
            }
        }
        .withToolBarModel(navigationController: _navigationController)
        .toolbar {
            ToolbarItem(placement: .status) {
                HStack {
                    Button(action: {
                        isCreatedSelected = true
                        isDeletedSelected = false
                    }) {
                        Text("Create")
                            .foregroundStyle(isCreatedSelected ? .ligthPurple : .white)
                    }
                    .disabled(isCreatedSelected)
                    .padding(.horizontal)
                    
                    Button(action: {
                        isCreatedSelected = false
                        isDeletedSelected = true
                    }) {
                        Text("Delete")
                            .foregroundStyle(isDeletedSelected ? .ligthPurple : .white)
                    }
                    .disabled(isDeletedSelected)
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    AuthorPage(path: $path)
//}

struct AuthorCreatorView: View {
    
    @State private var authorName: String = ""
    
    var body: some View {
        VStack {
            MyTextField(title: "Team name", isNumPad: false, text: $authorName)
                .padding(.bottom, 40)
            Button(action: {
                
            }) {
                Text("Save")
            }
        }
    }
}

struct AuthorDeletedView: View {
    
    @State private var selectedAuthor: String = "Select a team"
    
    var body: some View {
        VStack {
            DropList(selectedOption: $selectedAuthor, options: TEAMS)
                .padding(.bottom, 40)
            Button(action: {
                
            }) {
                Text("Remove")
            }
        }
    }
}
