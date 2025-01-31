//
//  CardView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct CardHomePageModel: View {
    
    @State private var size: CGSize = .zero
    @State var workInformation: UserWorkGetResponse
    
    var progression: Float {
        let progression: Float = Float(workInformation.current_chapter) / Float(workInformation.number_of_chapters)
        return progression
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                HStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 100)
                    Spacer().frame(width: self.size.width / 10)
                    VStack {
                        Text(workInformation.title)
                            .foregroundStyle(Color.black)
                            .bold()
                            .lineLimit(1)
                            .truncationMode(.tail)
                        Text(workInformation.genre)
                            .foregroundStyle(Color.black)
                            .font(.system(size: 10))
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .multilineTextAlignment(.center)
                        Text("\(workInformation.current_chapter) / \(workInformation.number_of_chapters)")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 10))
                        ProgressView(value: progression)
                        Group {
                            Text("Status: ").foregroundStyle(Color.black) +
                            Text(workInformation.status)
                                .foregroundStyle(BookStatus(rawValue: workInformation.status)?.statusColor() ?? .gray)
                        }
                        .font(.system(size: 10))
                        Button("Read") {
                            print("Read")
                        }
                        .foregroundStyle(Color.ligthPurple)
                        .tint(Color.paleLavender)
                        .controlSize(.small)
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(width: self.size.width / 4.5)
                    Spacer().frame(width: self.size.width / 10)
                    VStack {
                        HStack {
                            NavigationLink(destination: UserWorkInformationPage(workInformation: workInformation)) {
                                Image(systemName: "info.circle.fill")
                            }
                            .foregroundStyle(Color.ligthPurple)
                            .font(.system(size: 25))
                            Spacer().frame(width: self.size.width / 14)
                            Button(action: {
                                print("Heart")
                            }) {
                                Image(systemName: "heart")
                            }
                            .foregroundStyle(Color.ligthPurple)
                            .font(.system(size: 25))
                        }
                        Spacer().frame(height: self.size.height / 6)
                        Button(action: {
                            print("Trash")
                        }) {
                            Image(systemName: "trash")
                        }
                        .foregroundStyle(Color.ligthPurple)
                        .font(.system(size: 25))
                    }
                }
                .padding()
            }
            .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
            } action: {
                size = $0
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    let workInformation: UserWorkGetResponse = UserWorkGetResponse(id_of_work: 1, title: "Solo Leveling", author: "Hiroyuki Takei", status: "On Going", synopsis: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, molestias!", number_of_chapters: 200, type: "Manga", category: "Shonen", genre: "Action-Fantasy-Adventure", current_chapter: 150, appreciate_book: "Like", url: "https://www.google.com", image_url: "https://www.google.com")
    CardHomePageModel(workInformation: workInformation)
}
