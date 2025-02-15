//
//  PickerModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    let title: String
    @Binding var imageData: Data
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                Text("No Image Selected")
                    .foregroundColor(.gray)
            }

            PhotosPicker(selection: $selectedItem, matching: .images) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.ligthPurple)
                    .padding()
                    .background(Color.paleLavender)
                    .cornerRadius(30)
            }
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        self.imageData = data
                        self.selectedImage = UIImage(data: data)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var imageData: Data = Data()
    ImagePicker(title: "Select an Image", imageData: $imageData)
}
