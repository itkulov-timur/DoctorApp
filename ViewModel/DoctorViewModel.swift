//
//  DoctorViewModel.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 26.09.2026.
//

import Foundation
import SwiftUI
import Combine



enum SortType{
    case price
    case seniority
    case rating
}

class DoctorViewModel: ObservableObject{
    @Published  var searchText = ""
    @Published  var sortType: SortType = .price
    @Published var doctors: [Doctor] = []
    @Published var isAscending = false
    
    init(){
        loadDoctors()
    }
    
    var filteredDoctors: [Doctor] {
            let filtered = searchText.isEmpty ? doctors : doctors.filter {
                $0.lastName.localizedCaseInsensitiveContains(searchText)
            }
        let sorted: [Doctor]
        switch sortType {
        case .price:
            sorted = filtered.sorted { ($0.minPrice ?? 0) < ($1.minPrice ?? 0) }
        case .seniority:
            sorted = filtered.sorted { $0.seniority < $1.seniority }
        case .rating:
            sorted = filtered.sorted { $0.ratingsRating < $1.ratingsRating }
        }
        return isAscending ? sorted : sorted.reversed()

        }
    
    
    func loadDoctors() {
        let response = loadJSONFromBundle("doctors", as: DoctorsResponse.self)
        doctors = response?.record.data.users ?? []
    }
    
    func selectSort(_ type: SortType){
        if sortType == type {
            isAscending = !isAscending
        } else {
           sortType = type
             isAscending = false
            
        }
    }
}
