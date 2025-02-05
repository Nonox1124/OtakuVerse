//
//  SructureModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUICore
import SwiftUI

let TEAMS: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var STATUSES: [String] {
    let statuses: [String] = BookStatus.allCases.map(\.rawValue)
    return statuses.sorted()
}

var GENRES: [String] {
    let genres: [String] = ["Action", "Adventure", "Comedy", "Detective", "Drama", "Fantasy", "Harem",
                            "Historical", "Horror", "Mystery", "Psychological", "Romance", "Returner",
                            "Sci-fi", "Slice of Life", "Supernatural", "Thriller", "Tragedy",
                            "Isekai", "Magical", "Martial Arts", "Mecha", "Military", "Music", "Parody",
                            "School Life", "Sports", "Super Power", "Vampire", "Ecchi",
                            "Medical", "Monster", "Time Travel", "Revenge", "Romance Comedy",
                            "Surnatural", "Sport", "Spy", "War", "Superhero", "Fight",
                            "Dungeon", "Reincarnation"]
    return genres.sorted()
}

var TYPES: [String] {
    let types: [String] = ["Manga", "Novel", "Webtoon", "Manhwa", "Manhua", "One Shot"]
    return types.sorted()
}

var CATEGORIES: [String] {
    let categories: [String] = ["Shōnen", "Shōjo", "Seinen", "Josei", "Kodomo", "Shōnen Ai", "Yaoi"]
    return categories.sorted()
}

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
    case workInformation(Int)
}

enum SearchableType: String, CaseIterable {
    case author = "Author"
    case category = "Category"
    case genre = "Genre"
    case status = "Status"
    case type = "Type"
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
