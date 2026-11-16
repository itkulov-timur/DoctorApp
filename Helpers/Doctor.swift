//
//  Doctor.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 25.09.2026.
//

import Foundation


struct Doctor: Identifiable, Codable{
    let id: String
    let firstName: String
    let lastName: String
    let patronymic: String?
    let avatar: String?
    let ratingsRating: Double
    let videoChatPrice: Int
    let textChatPrice: Int
    let hospitalPrice: Int
    let isFavorite: Bool
    let seniority: Int
    let categoryLabel: String
    let educationTypeLabel: EducationType?
    let specialization: [Specialization]
    let workExpirience: [WorkExpirience]
    
    
    var minPrice: Int? {
        [videoChatPrice, textChatPrice, hospitalPrice].filter { $0 > 0 }.min()
    }
    
    var surName: String{
        "\(lastName)"
    }
    
    var Name: String {
        "\(firstName) "
    }
    var patronymicName: String? {
        if let patronymic = patronymic, !patronymic.isEmpty {
            return patronymic
        }
        return nil
    }

}

struct Specialization: Codable {
    let id: Int
    let name: String
}

struct DoctorsResponse: Codable {
    let record: RecordData
}

struct RecordData: Codable {
    let data: UsersData
}

struct UsersData: Codable {
    let users: [Doctor]
}

struct EducationType: Codable {
    let id: Int
    let name: String
}

struct WorkExpirience: Codable{
    let organization: String
}
