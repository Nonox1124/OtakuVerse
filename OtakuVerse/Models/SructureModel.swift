//
//  SructureModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

import SwiftUICore

struct UserWorkGetResponse: Identifiable {
    var id: Int { id_of_work }
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

struct WorkGetResponse: Identifiable {
    var id: Int { id_of_work }
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
