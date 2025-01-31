//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/11/2024.
//

import SwiftUI

struct HomePage: View {
    
    @State private var searchText: String = ""
    @State var currentPage: String
    @State private var works: [UserWorkGetResponse] = [UserWorkGetResponse(id_of_work: 1, title: "Solo Leveling", author: "Hiroyuki Takei", status: "On Going", synopsis: "This is a synopsis", number_of_chapters: 200, type: "Webtoon", category: "Shonen", genre: "Action-Fantasy-Adventure", current_chapter: 150, appreciate_book: "Like", url: "https://www.google.com", image_url: "https://www.google.com"), UserWorkGetResponse(id_of_work: 2, title: "Test 2", author: "Hiroyuki Takei", status: "Completed", synopsis: "This is a synopsis", number_of_chapters: 100, type: "Webtoon", category: "Shonen", genre: "Action-Fantasy-Adventure", current_chapter: 10, appreciate_book: "Like", url: "https://www.google.com", image_url: "https://www.google.com")]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkBlue.ignoresSafeArea()
                ScrollView {
                    ForEach(self.works) { work in
                        CardHomePageModel(workInformation: work)
                    }
                }
            }
            .withToolBarModel(currentPage: currentPage)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Information", systemImage: "info.circle") {
                        Text("Total works: 0")
                        Text("Total chapters: 0")
                        Text("Total unread chapters: 0")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Filters", systemImage: "line.3.horizontal.decrease.circle") {
                        Text("Filter 1")
                        Text("Filter 2")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    HomePage(currentPage: "HomePage")
}
