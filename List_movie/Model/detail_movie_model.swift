// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailMovieModal = try? JSONDecoder().decode(DetailMovieModal.self, from: jsonData)

import Foundation

// MARK: - DetailMovieModal
struct DetailMovieModel: Codable {
    var adult: Bool
    var backdropPath: String
    var belongsToCollection: BelongsToCollection?
    var budget: Int
    var genres: [Genre]
    var homepage: String
    var id: Int
    var imdbId, originalLanguage, originalTitle, overview: String
    var popularity: Double
    var posterPath: String
    var productionCompanies: [ProductionCompany]
    var productionCountries: [ProductionCountry]
    var releaseDate: String
    var revenue, runtime: Int
    var spokenLanguages: [SpokenLanguage]
    var status, tagline, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case belongsToCollection
        case budget, genres, homepage, id
        case imdbId
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case productionCompanies
        case productionCountries
        case releaseDate
        case revenue, runtime
        case spokenLanguages
        case status, tagline, title, video
        case voteAverage
        case voteCount
    }
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int
    var name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    var id: Int?
    var logoPath, name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath
        case name
        case originCountry
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    var iso31661, name: String

    enum CodingKeys: String, CodingKey {
        case iso31661
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    var englishName, iso6391, name: String

    enum CodingKeys: String, CodingKey {
        case englishName
        case iso6391
        case name
    }
}

struct BelongsToCollection: Codable {
    var id: Int
    var name: String
    var posterPath, backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath
        case backdropPath
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
