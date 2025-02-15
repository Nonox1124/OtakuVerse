//
//  SignUpPage.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 06/12/2024.
//

import SwiftUI

struct SignUpPage: View {
    
    @ObservedObject var navigationController: NavigationController
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var email: String = ""
    @State private var confirmEmail: String = ""
    @State private var isSignUp: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.darkBlue.ignoresSafeArea()
            VStack {
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.ligthPurple)
                Spacer()
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .font(.system(size: 30))
                Spacer()
                Group {
                    TextField("Email", text: $email)
                    TextField("Confirm Email", text: $email)
                }
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 30))
                Spacer()
                Group {
                    TextField("Password", text: $password)
                    TextField("Confirm Password", text: $confirmPassword)
                }
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 30))
                Spacer()
                Button(action: {
                    navigationController.goRoot()
                }) {
                    Text("Sign Up")
                }
            }
            .padding()
        }
    }
}
