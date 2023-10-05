// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let temperatures = try? JSONDecoder().decode(Temperatures.self, from: jsonData)

import Foundation

// MARK: - Temperatures
struct Credits: Codable {
    var id: Int
    var cast, crew: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    var adult: Bool
    var gender, id: Int
    var knownForDepartment: String?
    var name, originalName: String
    var popularity: Double
    var profilePath: String?
    var castID: Int?
    var character: String?
    var creditID: String?
    var order: Int?
    var department: String?
    var job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment
        case name
        case originalName
        case popularity
        case profilePath
        case castID
        case character
        case creditID
        case order, department, job
    }
}
