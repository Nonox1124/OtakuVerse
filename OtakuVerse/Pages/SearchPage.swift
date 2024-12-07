//
//  SearchPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchText: String = ""
    @State var currentPage: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkBlue.ignoresSafeArea()
                ScrollView {
                    
                }
                .searchable(text: $searchText)
                .withToolBarModel(currentPage: currentPage)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SearchPage(currentPage: "SearchPage")
}
