//
//  SearchPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct SearchPage: View {
    
    @ObservedObject var navigationController: NavigationController
    @Binding var worksSearch: [WorkGetResponse]
    
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                ForEach(self.worksSearch.indices, id: \.self) { index in
                    CardSearchPageModel(navigationController: navigationController, workInformation: $worksSearch[index], index: index)
                }
            }
        }
        .searchable(text: $searchText)
        .withToolBarModel(navigationController: _navigationController) {
            AnyView(
                Menu("Filters", systemImage: "line.3.horizontal.decrease.circle") {
                    Text("Filter 1")
                    Text("Filter 2")
                }
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}
