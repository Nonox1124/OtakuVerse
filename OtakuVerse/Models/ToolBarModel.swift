//
//  ToolBarModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct ToolBarModel: ViewModifier {
    
    @ObservedObject var navigationController: NavigationController
    
    var extraToolbar: () -> AnyView
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Menu", systemImage: "line.3.horizontal.circle") {
                        Button("Home Page") {
                            navigationController.navigateTo(Destination.home)
                        }
                        .disabled(navigationController.oldDestination == Destination.home)
                        Button("Search Page") {
                            navigationController.navigateTo(Destination.research)
                        }
                        .disabled(navigationController.oldDestination == Destination.research)
                        Button("Create Work Page") {
                            navigationController.navigateTo(Destination.workCreation)
                        }
                        .disabled(navigationController.oldDestination == Destination.workCreation)
                        Button("Author Page") {
                            navigationController.navigateTo(Destination.author)
                        }
                        .disabled(navigationController.oldDestination == Destination.author)
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    extraToolbar()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        navigationController.navigateTo(Destination.logIn)
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
    }
}

extension View {
    func withToolBarModel(navigationController: ObservedObject<NavigationController>, @ViewBuilder extraToolbar: @escaping () -> AnyView = { AnyView(EmptyView()) }) -> some View {
        self.modifier(ToolBarModel(navigationController: navigationController.wrappedValue, extraToolbar: extraToolbar))
    }
}


