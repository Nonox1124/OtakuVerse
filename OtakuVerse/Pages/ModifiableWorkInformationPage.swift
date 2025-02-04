//
//  ModifiableWorkInformationPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 03/02/2025.
//

import SwiftUI

struct ModifiableUserWorkInformationPage: View {
    
    @Binding var workInformation: UserWorkGetResponse
    
    @State private var title: String = ""
    @State private var numberOfChapters: String = ""
    @State private var synopsis: String = ""
    @State private var author: String = ""
    @State private var selectedTeam: String = "Select a team"
    @State private var urlWork: String = ""
    @State private var selectedType: String = "Select a type"
    @State private var selectedStatus: String = "Select the status"
    @State private var selectedGenres: String = ""
//    @State private var selectedImage: Data = Data()
    
    func initValues() {
        title = workInformation.title
        numberOfChapters = String(workInformation.number_of_chapters)
        synopsis = workInformation.synopsis
        author = workInformation.author
        selectedTeam = workInformation.author
        urlWork = workInformation.url
        selectedType = workInformation.type
        selectedStatus = workInformation.status
        selectedGenres = workInformation.genre
    }
    
    func save() {
        workInformation.title = title
        workInformation.number_of_chapters = Int(numberOfChapters) ?? 0
        workInformation.synopsis = synopsis
        workInformation.author = author
        workInformation.url = urlWork
        workInformation.type = selectedType
        workInformation.status = selectedStatus
        workInformation.genre = selectedGenres
    }
    
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
//                ImagePicker(title: "Select an Image", imageData: $selectedImage)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: {
                    save()
                }) {
                    Text("Save to the DB")
                }
            }
        }
        .onAppear() {
            initValues()
        }
    }
}
