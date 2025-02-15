//
//  SearchPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct SearchPage: View {
    
    @ObservedObject var navigationController: NavigationController
    @Binding var works: [WorkGetResponse]
    
    @State private var searchText: String = ""
    @State private var selectedItem: [SearchableType: String] = [:]
    
    var searchableWorks: [WorkGetResponse] {
        var filteredWorks: [WorkGetResponse] = []
        filteredWorks = works.filter { !searchText.isEmpty ? ($0.title.lowercased().contains(searchText.lowercased())) : true }
        if let selectedAuthor = selectedItem[.author] {
            filteredWorks = filteredWorks.filter { $0.author == selectedAuthor }
        }
        if let selectedCategory = selectedItem[.category] {
            filteredWorks = filteredWorks.filter { $0.category == selectedCategory }
        }
        if let selectedGenre = selectedItem[.genre] {
            filteredWorks = filteredWorks.filter { $0.genre == selectedGenre }
        }
        if let selectedStatus = selectedItem[.status] {
            filteredWorks = filteredWorks.filter { $0.status == selectedStatus }
        }
        return filteredWorks
    }
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                ForEach(self.searchableWorks, id: \.self) { work in
                    if let index = works.firstIndex(where: { $0.id_of_work == work.id_of_work }) {
                        CardSearchPageModel(navigationController: navigationController, workInformation: $works[index], works: $works)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .withToolBarModel(navigationController: _navigationController) {
            AnyView(
                DropFilterButton(selectedItems: $selectedItem)
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}
