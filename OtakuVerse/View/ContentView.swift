//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 02/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationController = NavigationController()

    var body: some View {
        NavigationStack(path: navigationController.bindingForPath()) {
            HomePage(navigationController: navigationController)

            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .home:
                    HomePage(navigationController: navigationController)
                case .author:
                    AuthorPage(navigationController: navigationController)
                case .research:
                    SearchPage(navigationController: navigationController)
                case .workCreation:
                    WorkCreationPage(navigationController: navigationController)
                case .userWorkInformation(var workInformation):
                    UserWorkInformationPage(workInformation: workInformation, navigationController: navigationController)
                case .logIn:
                    LogInPage(navigationController: navigationController)
                case .signUp:
                    SignUpPage(navigationController: navigationController)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

