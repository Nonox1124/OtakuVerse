//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/11/2024.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject var navigationController: NavigationController
    
    @State private var searchText: String = ""
    @Binding var works: [UserWorkGetResponse]
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                ForEach(self.works.indices, id: \.self) { index in
                    CardHomePageModel(navigationController: navigationController, workInformation: $works[index], index: index)
                }
            }
        }
        .withToolBarModel(navigationController: _navigationController) {
            AnyView(
                Group {
                    Menu("Information", systemImage: "info.circle") {
                        Text("Total works: 2")
                        Text("Total chapters: 300")
                        Text("Total unread chapters: 50")
                    }
                    Menu("Filters", systemImage: "line.3.horizontal.decrease.circle") {
                        Text("Filter 1")
                        Text("Filter 2")
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .searchable(text: $searchText)
    }
}
