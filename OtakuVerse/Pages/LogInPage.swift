//
//  LogInPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 06/12/2024.
//

import SwiftUI

struct LogInPage: View {
    
    @ObservedObject var navigationController: NavigationController
    
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            VStack(alignment: .center) {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.ligthPurple)
                Spacer()
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textContentType(.username)
                    .font(.system(size: 30))
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .font(.system(size: 30))
                Spacer()
                Button("Log In") {
                    navigationController.goBack()
                }
                .padding(.bottom)
                Button(action: {
                    navigationController.navigateToDestination(Destination.signUp)
                }) {
                    Text("Sign Up")
                }
            }
            .padding()
        }
    }
}
