//
//  ToolBarModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct ToolBarModel: ViewModifier {
    
    @State var currentPage: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Menu", systemImage: "line.3.horizontal.circle") {
                        NavigationLink("Home Page", destination: HomePage(currentPage: "HomePage")).disabled(currentPage == "HomePage")
                        NavigationLink("Search Page", destination: SearchPage(currentPage: "SearchPage")).disabled(currentPage == "SearchPage")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Filters", systemImage: "line.3.horizontal.decrease.circle") {
                        Text("Filter 1")
                        Text("Filter 2")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: LogInPage()) {
                        Label("User Account Button", systemImage: "person.crop.circle")
                    }
//                    Button("User Account Button", systemImage: "person.crop.circle") {
//                        print("User Page")
//                    }
                }
            }
    }
}

extension View {
    func withToolBarModel(currentPage: String) -> some View {
        self.modifier(ToolBarModel(currentPage: currentPage))
    }
}

