//
//  SearchPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct SearchPage: View {
    
    @ObservedObject var navigationController: NavigationController
    
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                
            }
            .searchable(text: $searchText)
            .withToolBarModel(navigationController: _navigationController)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Filters", systemImage: "line.3.horizontal.decrease.circle") {
                        Text("Filter 1")
                        Text("Filter 2")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    SearchPage(path: Binding<NavigationPath>)
//}
