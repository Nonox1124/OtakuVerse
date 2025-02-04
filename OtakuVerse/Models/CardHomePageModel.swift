//
//  CardView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct CardHomePageModel: View {
    
    @ObservedObject var navigationController: NavigationController
    @Binding var workInformation: UserWorkGetResponse
    let index: Int
    
    @State private var size: CGSize = .zero
    
    var progression: Float {
        let progression: Float = Float(workInformation.current_chapter) / Float(workInformation.number_of_chapters)
        return progression
    }
    
    var body: some View {
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
                        if (workInformation.current_chapter + 1 < workInformation.number_of_chapters) {
                            workInformation.current_chapter += 1
                        }
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
                        Button(action: {
                            navigationController.navigateToSecondaryDestination(SecondaryDestination.userWorkInformation(index))
                        }) {
                            Image(systemName: "info.circle.fill")
                        }
                        .foregroundStyle(Color.ligthPurple)
                        .font(.system(size: 25))
                        Spacer().frame(width: self.size.width / 14)
                        Button(action: {
                            if (workInformation.appreciate_book == AppreciatedBook.none.rawValue) {
                                workInformation.appreciate_book = AppreciatedBook.like.rawValue
                            } else {
                                workInformation.appreciate_book = AppreciatedBook.none.rawValue
                            }
                        }) {
                            Image(systemName: AppreciatedBook(rawValue: workInformation.appreciate_book)?.iconName() ?? "heart")
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
        .frame(height: 200)
    }
}
