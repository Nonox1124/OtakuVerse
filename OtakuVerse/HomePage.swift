//
//  ContentView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/11/2024.
//

import SwiftUI

struct HomePage: View {
    
    @State private var searchText: String = ""
    @State private var works = ["salut", "hi", "Hello", "test"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkBlue.ignoresSafeArea()
                ScrollView {
                    ForEach(self.works, id: \.self) { work in
                        CardView()
                    }
                }
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Menu("Menu", systemImage: "line.3.horizontal.circle") {
                            Text("Navigation List")
                        }
                    }
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
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("User Account Button", systemImage: "person.crop.circle") {
                            print("User Page")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
