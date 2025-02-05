//
//  WorkInformationPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI

struct WorkInformationPage: View {
    
    @Binding var workInformation: WorkGetResponse
    @Binding var workList: [UserWorkGetResponse]
    
    @State private var showAllTitle: Bool = false
    @Environment(\.openURL) var openURL
    
    func addToList() {
        if (workList.contains(where: { $0.id_of_work == workInformation.id_of_work })) {
            return
        }
        let work: UserWorkGetResponse = UserWorkGetResponse(
            id_of_work: workInformation.id_of_work,
            title: workInformation.title,
            author: workInformation.author,
            status: workInformation.status,
            synopsis: workInformation.synopsis,
            number_of_chapters: workInformation.number_of_chapters,
            type: workInformation.type,
            category: workInformation.category,
            genre: workInformation.genre,
            current_chapter: 0,
            appreciate_book: 0,
            url: workInformation.url,
            image_url: workInformation.image_url
        )
        workList.append(work)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkBlue.ignoresSafeArea()
            ScrollView {
                VStack {
                    Text(workInformation.title)
                        .font(.title)
                        .bold()
                        .padding()
                        .lineLimit(!showAllTitle ? 1 : nil)
                        .onTapGesture {
                            showAllTitle.toggle()
                        }
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 400)
                    VStack {
                        Text("Genres:")
                            .font(.title)
                            .bold()
                        Text(workInformation.genre)
                            .font(.caption)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    VStack {
                        Text("Category:")
                            .font(.title)
                            .bold()
                        Text(workInformation.category)
                            .font(.caption)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    HStack {
                        Spacer()
                        VStack {
                            Text("Type:")
                                .font(.title)
                                .bold()
                            Text(workInformation.type)
                                .font(.caption)
                                .fontWeight(.light)
                        }
                        Spacer()
                        VStack {
                            Text("Status:")
                                .font(.title)
                                .bold()
                            Text(workInformation.status)
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundStyle(BookStatus(rawValue: workInformation.status)?.statusColor() ?? .gray)
                        }
                        Spacer()
                    }
                    .padding()
                    VStack {
                        Text("Total Chapters:")
                            .font(.title)
                            .bold()
                        Text("\(workInformation.number_of_chapters)")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                    .padding()
                    VStack {
                        Text("Synopsis:")
                            .font(.title)
                            .bold()
                        Text(workInformation.synopsis)
                            .font(.caption)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    VStack {
                        Text("Team:")
                            .font(.title)
                            .bold()
                        Text("\(workInformation.author)")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                    .padding()
                    VStack {
                        Text("Link:")
                            .font(.title)
                            .bold()
                        Button(action: {
                            if let url = URL(string: workInformation.url) {
                                openURL(url)
                            }
                        }) {
                            Text(workInformation.url)
                                .foregroundColor(.blue)
                                .underline()
                                .font(.caption)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to Library") {
                        addToList()
                    }
                }
            }
            .padding()
        }
    }
}
