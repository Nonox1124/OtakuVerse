//
//  CardSearchPageModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI

struct CardSearchPageModel: View {

    @StateObject var navigationController: NavigationController
    @Binding var workInformation: WorkGetResponse
    @Binding var works: [WorkGetResponse]

    @State private var size: CGSize = .zero
    
    var body: some View {
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
            .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
            } action: {
                size = $0
            }
        }
        .frame(height: 200)
        .onTapGesture {
            let index: Int = self.works.firstIndex(of: self.workInformation)!
            navigationController.navigateToSecondaryDestination(SecondaryDestination.workInformation(index))
        }
    }
}
