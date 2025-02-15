//
//  UserWorkInformationPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI

struct UserWorkInformationPage: View {
    
    @Binding var workInformation: UserWorkGetResponse
    @ObservedObject var navigationController: NavigationController
    let index: Int
    
    @State private var showAllTitle: Bool = false
    @Environment(\.openURL) var openURL
    
    var progression: Float {
        let progression: Float = Float(workInformation.current_chapter) / Float(workInformation.number_of_chapters)
        return progression
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
                    HStack {
                        Spacer()
                        VStack {
                            Text("Chapters:")
                                .font(.title)
                                .bold()
                            Text("\(workInformation.current_chapter) / \(workInformation.number_of_chapters)")
                                .font(.caption)
                                .fontWeight(.light)
                            ProgressView(value: progression)
                                .frame(width: 125)
                        }
                        Spacer()
                        Button(action: {
                            if (workInformation.appreciate_book == AppreciatedBook.none.rawValue) {
                                workInformation.appreciate_book = AppreciatedBook.like.rawValue
                            } else {
                                workInformation.appreciate_book = AppreciatedBook.none.rawValue
                            }
                        }) {
                            Image(systemName: AppreciatedBook(rawValue: workInformation.appreciate_book)?.iconName() ?? "heart")
                        }
                        .font(.system(size: 25))
                        .foregroundStyle(.paleLavender)
                        Spacer()
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
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    navigationController.navigateToSecondaryDestination(SecondaryDestination.modifyUserWork(index))
                }) {
                    Image(systemName: "gearshape.circle")
                }
            }
            ToolbarItem(placement: .status) {
                HStack {
                    Button(action: {
                        if (workInformation.current_chapter + 1 <= workInformation.number_of_chapters) {
                            workInformation.current_chapter += 1
                        }
                    }) {
                        Text("Read")
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        if (workInformation.current_chapter - 1 >= 0) {
                            workInformation.current_chapter -= 1
                        }
                    }) {
                        Text("Unread")
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
