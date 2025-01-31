//
//  Array.swift
//  OtakuVerse
//
//  Created by Noa Calvet on 30/01/2025.
//

let TEAMS: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var STATUSES: [String] {
    let statuses: [String] = ["Ended", "On Going", "Paused", "Dropped"]
    return statuses.sorted()
}

var GENRES: [String] {
    let genres: [String] = ["Action", "Adventure", "Comedy", "Detective", "Drama", "Fantasy", "Harem",
                            "Historical", "Horror", "Mystery", "Psychological", "Romance", "Returner",
                            "Sci-fi", "Slice of Life", "Supernatural", "Thriller", "Tragedy", "Yaoi",
                            "Isekai", "Magical", "Martial Arts", "Mecha", "Military", "Music", "Parody",
                            "School Life", "Shounen Ai", "Sports", "Super Power", "Vampire", "Ecchi",
                            "Medical", "Monster", "Time Travel", "Revenge", "Romance Comedy",
                            "Surnatural", "Sport", "Spy", "War", "Superhero", "Fight", "Shojo",
                            "Shonen", "Seinen", "Shonen Ai", "Dungeon", "BL", "Reincarnation"]
    return genres.sorted()
}

var TYPES: [String] {
    let types: [String] = ["Manga", "Novel", "Webtoon", " Manhwa", "Manhua", "One Shot"]
    return types.sorted()
}
