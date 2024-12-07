//
//  CardView.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 01/12/2024.
//

import SwiftUI

struct CardHomePageModel: View {
    
    @State private var size: CGSize = .zero
    
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
                    Text("Name")
                        .foregroundStyle(Color.black)
                        .bold()
                    Text("Genres")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 10))
                    Text("10 / 80")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 10))
                    ProgressView(value: 0.1)
                    Group {
                        Text("Status: ").foregroundStyle(Color.black) +
                        Text("Ended").foregroundStyle(Color.red)
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
                .frame(width: self.size.width / 5)
                Spacer().frame(width: self.size.width / 10)
                VStack {
                    HStack {
                        Button(action: {
                            print("Info")
                        }) {
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
        .frame(height: 200)
    }
}

#Preview {
    CardHomePageModel()
}
