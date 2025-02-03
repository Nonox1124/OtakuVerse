//
//  WorkCreationPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/01/2025.
//

import SwiftUI

struct WorkCreationPage: View {
    
    @ObservedObject var navigationController: NavigationController
    
    @State private var title: String = ""
    @State private var numberOfChapters: String = ""
    @State private var synopsis: String = ""
    @State private var author: String = ""
    @State private var selectedTeam: String = "Select a team"
    @State private var urlWork: String = ""
    @State private var selectedType: String = "Select a type"
    @State private var selectedStatus: String = "Select the status"
    @State private var selectedGenres: String = ""
    @State private var selectedImage: Data = Data()
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                MyTextField(title: "Title", isNumPad: false, text: $title)
                MyTextField(title: "Number of chapters", isNumPad: true, text: $numberOfChapters)
                MyTextField(title: "Synopsis", isNumPad: false, text: $synopsis)
                DropList(selectedOption: $selectedTeam, options: TEAMS)
                MyTextField(title: "URL of the work", isNumPad: false, text: $urlWork)
                DropList(selectedOption: $selectedType, options: TYPES)
                DropList(selectedOption: $selectedStatus, options: STATUSES)
                DropListSelectorButton(selectedOption: $selectedGenres, options: GENRES, title: "Select genres")
                ImagePicker(title: "Select an Image", imageData: $selectedImage)
            }
            .padding()
        }
        .withToolBarModel(navigationController: _navigationController)
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: {
                    
                }) {
                    Text("Save to the DB")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    WorkCreationPage(currentPage: "WorkCreationPage")
//}
