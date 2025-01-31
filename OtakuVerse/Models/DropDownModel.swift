//
//  DropDownModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/01/2025.
//

import SwiftUI

struct DropList: View {
    
    @Binding var selectedOption: String
    @State private var showSheet: Bool = false
    let options: [String]

    var body: some View {
        VStack {
            Button(action: { showSheet.toggle() }) {
                HStack {
                    Text(selectedOption)
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.myGray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 30).stroke(Color.myGray, lineWidth: 1))
                .foregroundColor(.black)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showSheet) {
            OptionSelectionSheet(selectedOption: $selectedOption, options: options)
        }
    }
}

struct OptionSelectionSheet: View {
    @Binding var selectedOption: String
    @Environment(\.dismiss) var dismiss
    let options: [String]

    var body: some View {
        NavigationView {
            List(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                    dismiss()
                }) {
                    Text(option)
                }
            }
            .navigationTitle("Select an Option")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selOption: String = "Choose an option..."
    let options: [String] = (1...10).map { "Option \($0)" }
    
    DropList(selectedOption: $selOption, options: options)
}

struct WheelPicker: View {
    
    @Binding var selectedOption: String
    let options: [String]

    var body: some View {
        Picker("Select an option", selection: $selectedOption) {
            ForEach(options, id: \.self) { option in
                Text(option).tag(option)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(height: 150)
        .clipped()
    }
}

#Preview {
    @Previewable @State var selOption: String = "Choose an option..."
    let options = (1...5).map { "Option \($0)" }
    
    WheelPicker(selectedOption: $selOption, options: options)
}

struct DropListSelectorButton: View {
    @State private var isSheetPresented = false
    @State private var selectedItems: Set<String> = []
    @Binding var selectedOption: String
    let options: [String]
    let title: String

    var body: some View {
        VStack {
            Button(action: {isSheetPresented.toggle()}) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.ligthPurple)
                    .padding()
                    .background(Color.paleLavender)
                    .cornerRadius(30)
            }
        }
        .fullScreenCover(isPresented: $isSheetPresented) {
            SelectionSheet(selectedItems: $selectedItems, options: options)
        }
        .onChange(of: selectedItems) { oldValue, newValue in
            selectedOption = newValue.joined(separator: " - ")
        }
    }
}

struct SelectionSheet: View {
    @Binding var selectedItems: Set<String>
    let options: [String]
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            List(options, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    if selectedItems.contains(item) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedItems.contains(item) {
                        selectedItems.remove(item)
                    } else {
                        selectedItems.insert(item)
                    }
                }
            }
            .navigationTitle("Select Options")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedOption: String = ""
    DropListSelectorButton(selectedOption: $selectedOption, options: GENRES, title: "Select genres")
}
