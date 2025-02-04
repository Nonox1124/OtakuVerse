//
//  SructureModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUICore
import SwiftUI

struct UserWorkGetResponse: Hashable {
    var id_of_work: Int
    var title: String
    var author: String
    var status: String
    var synopsis: String
    var number_of_chapters: Int
    var type: String
    var category: String
    var genre: String
    var current_chapter: Int
    var appreciate_book: Int
    var url: String
    var image_url: String
}

struct WorkGetResponse: Hashable {
    var id_of_work: Int
    var title: String
    var author: String
    var status: String
    var synopsis: String
    var number_of_chapters: Int
    var type: String
    var category: String
    var genre: String
    var url: String
    var image_url: String
}

struct WorkCreationRequest {
    var title: String
    var author: String
    var status: String
    var synopsis: String
    var number_of_chapters: Int
    var type: String
    var category: String
    var genre: String
    var url: String
    var image_url: String
}

enum BookStatus: String, CaseIterable {
    case completed = "Completed"
    case ongoing = "On Going"
    case dropped = "Dropped"
    case pending = "Pending"
    
    func statusColor() -> Color {
        switch self {
            case .completed: return .red
            case .ongoing: return .green
            case .dropped: return .black
            case .pending: return .orange
        }
    }
}

enum AppreciatedBook: Int {
    case none = 0
    case like = 1
    
    func iconName() -> String {
        switch self {
            case .none: return "heart"
            case .like: return "heart.fill"
        }
    }
}

enum Destination: Hashable {
    case author
    case home
    case research
    case workCreation
    case logIn
    case signUp
}

enum SecondaryDestination: Hashable {
    case userWorkInformation(Int)
    case modifyUserWork(Int)
}

class NavigationController: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var oldDestination: Destination = .home
    
    func navigateToDestination(_ destination: Destination) {
        if (!path.isEmpty) {
            path.removeLast()
        }
        oldDestination = destination
        path.append(destination)
    }
    
    func navigateToSecondaryDestination(_ secondaryDestination: SecondaryDestination) {
        path.append(secondaryDestination)
    }
    
    func getPreviousDestination() -> Destination {
        return oldDestination
    }
    
    func goBack() {
        if (!path.isEmpty) {
            path.removeLast()
        }
    }
    
    func goRoot() {
        if (!path.isEmpty) {
            path.removeLast(path.count)
        }
    }
}
