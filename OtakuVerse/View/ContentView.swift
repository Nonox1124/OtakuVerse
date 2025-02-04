//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 02/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationController = NavigationController()
    
    @State private var works: [UserWorkGetResponse] = [UserWorkGetResponse(id_of_work: 1, title: "Solo Leveling", author: "Hiroyuki Takei", status: "On Going", synopsis: "This is a synopsis", number_of_chapters: 200, type: "Webtoon", category: "Shonen", genre: "Action - Fantasy - Adventure", current_chapter: 150, appreciate_book: 1, url: "https://www.google.com", image_url: "https://www.google.com"), UserWorkGetResponse(id_of_work: 2, title: "Salut les gens, je m'appelle Yuki", author: "Hiroyuki Takei", status: "Completed", synopsis: "This is a synopsis", number_of_chapters: 100, type: "Webtoon", category: "Shonen", genre: "Action - Fantasy - Adventure", current_chapter: 10, appreciate_book: 0, url: "https://www.google.com", image_url: "https://www.google.com")]

    var body: some View {
        NavigationStack(path: $navigationController.path) {
            HomePage(navigationController: navigationController, works: $works)

            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .home:
                    HomePage(navigationController: navigationController, works: $works)
                case .author:
                    AuthorPage(navigationController: navigationController)
                case .research:
                    SearchPage(navigationController: navigationController)
                case .workCreation:
                    WorkCreationPage(navigationController: navigationController)
                case .logIn:
                    LogInPage(navigationController: navigationController)
                case .signUp:
                    SignUpPage(navigationController: navigationController)
                }
            }
            .navigationDestination(for: SecondaryDestination.self) { destination in
                switch destination {
                case .userWorkInformation(let id):
                    UserWorkInformationPage(workInformation: $works[id], navigationController: navigationController, index: id)
                case .modifyUserWork(let id):
                    ModifiableUserWorkInformationPage(workInformation: $works[id])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

