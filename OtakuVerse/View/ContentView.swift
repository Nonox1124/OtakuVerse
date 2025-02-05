//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 02/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationController = NavigationController()
    
    @State private var works: [UserWorkGetResponse] = []
    @State private var worksSearch: [WorkGetResponse] = [WorkGetResponse(id_of_work: 1, title: "Solo Leveling", author: "A", status: "On Going", synopsis: "This is a synopsis", number_of_chapters: 200, type: "Webtoon", category: "Shonen", genre: "Action - Fantasy - Adventure", url: "https://www.google.com", image_url: "https://www.google.com"), WorkGetResponse(id_of_work: 2, title: "Salut les gens, je m'appelle Yuki", author: "B", status: "Completed", synopsis: "This is a synopsis", number_of_chapters: 100, type: "Webtoon", category: "Shonen", genre: "Action", url: "https://www.google.com", image_url: "https://www.google.com"),WorkGetResponse(id_of_work: 3, title: "Salut les gens", author: "c", status: "Completed", synopsis: "This is a synopsis", number_of_chapters: 100, type: "Manga", category: "Shonen", genre: "Action", url: "https://www.google.com", image_url: "https://www.google.com")]

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
                    SearchPage(navigationController: navigationController, works: $worksSearch)
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
                case .workInformation(let id):
                    WorkInformationPage(workInformation: $worksSearch[id], workList: $works)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

