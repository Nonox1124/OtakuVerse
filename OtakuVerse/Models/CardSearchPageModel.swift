//
//  CardSearchPageModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI

struct CardSearchPageModel: View {
    
    let workInformation: WorkGetResponse
    @State private var size: CGSize = .zero
    
    var body: some View {
        NavigationLink(destination: WorkInformationPage(workInformation: workInformation)) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                HStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 100)
                    Spacer().frame(width: 20)
                    Text(workInformation.title)
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
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
    let workInformation: WorkGetResponse = WorkGetResponse(id_of_work: 1, title: "Solo Leveling", author: "Hiroyuki Takei", status: "On Going", synopsis: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, molestias!", number_of_chapters: 200, type: "Manga", category: "Shonen", genre: "Action-Fantasy-Adventure", url: "https://www.google.com", image_url: "https://www.google.com")
    CardSearchPageModel(workInformation: workInformation)
}
