//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/11/2024.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject var navigationController: NavigationController
    @Binding var works: [UserWorkGetResponse]
    
    @State private var searchText: String = ""
    @State private var selectedItem: [SearchableType: String] = [:]
    
    var searchableWorks: [UserWorkGetResponse] {
        var filteredWorks: [UserWorkGetResponse] = []
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
    
    private var totalWorks: Int {
        return works.count
    }
    
    private var totalChapters: Int {
        let allChapters: [Int] = works.map(\.self.number_of_chapters)
        return allChapters.reduce(0, +)
    }
    
    private var totalUnreadChapters: Int {
        let allChapters: [Int] = works.map(\.self.number_of_chapters)
        let allCurrentChapters: [Int] = works.map(\.self.current_chapter)
        let totalUnread: [Int] = zip(allChapters, allCurrentChapters).map(-)
        return totalUnread.reduce(0, +)
    }
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                ForEach(self.searchableWorks, id: \.self) { work in
                    if let index = works.firstIndex(where: { $0.id_of_work == work.id_of_work }) {
                        CardHomePageModel(navigationController: navigationController, works: $works, workInformation: $works[index])
                    }
                }
            }
        }
        .withToolBarModel(navigationController: _navigationController) {
            AnyView(
                Group {
                    Menu("Information", systemImage: "info.circle") {
                        Text("Total works: \(totalWorks)")
                        Text("Total chapters: \(totalChapters)")
                        Text("Total unread chapters: \(totalUnreadChapters)")
                    }
                    DropFilterButton(selectedItems: $selectedItem)
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .searchable(text: $searchText)
    }
}
