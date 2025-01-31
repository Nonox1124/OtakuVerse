//
//  SructureModel.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 31/01/2025.
//

struct WorkGetResponse {
    var id_of_book: Int
    var title: String
    var author: String
    var status: String
    var synopsis: String
    var number_of_chapters: Int
    var type: String
    var category: String
    var genre: String
    var current_chapter: Int
    var appreciate_book: String
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
