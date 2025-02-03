//
//  WorkInformationPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI

struct WorkInformationPage: View {
    
    @State var workInformation: WorkGetResponse
    
    @State private var showAllTitle: Bool = false
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack() {
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
                            
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("WorkInformationPage")
    }
}

#Preview {
    let workInformation: WorkGetResponse = WorkGetResponse(id_of_work: 1, title: "Solo Leveling", author: "Hiroyuki Takei", status: "On Going", synopsis: "This is a synopsis, so long", number_of_chapters: 200, type: "Manga", category: "Shonen", genre: "Action-Fantasy-Adventure", url: "https://www.google.com", image_url: "https://www.google.com")
    WorkInformationPage(workInformation: workInformation)
}
