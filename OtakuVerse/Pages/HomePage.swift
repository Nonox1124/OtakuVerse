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
    @State private var works = ["salut", "hi", "Hello", "test"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkBlue.ignoresSafeArea()
                ScrollView {
                    ForEach(self.works, id: \.self) { work in
                        CardHomePageModel()
                    }
                }
                .searchable(text: $searchText)
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
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomePage(currentPage: "HomePage")
}
