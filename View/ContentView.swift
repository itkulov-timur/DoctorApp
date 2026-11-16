//
//  ContentView.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 23.09.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DoctorViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    
                    Text("Педиаторы")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.black)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("Поиск", text: $viewModel.searchText)
                        
                    }
                    .padding()
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .background(Color.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    
                    
                    HStack(spacing: 0) {
                        
                        SortButton(viewModel: viewModel, title: "По цене", type: .price)
                        SortButton(viewModel: viewModel, title: "По стажу", type: .seniority)
                        SortButton(viewModel: viewModel, title: "По рейтингу", type: .rating)
                        
                    }
                    .buttonStyle(.plain)
                    .padding(4)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    }
                    .padding(.horizontal)
                    
                    ForEach(viewModel.filteredDoctors) { doctor in
                        VStack {
                            
                            NavigationLink{
                                DoctorDetailView(doctor: doctor)
                                
                            }label: {
                                CardDoctor(doctor: doctor)
                                    .background(.white)
                            }
                        }
                    }
                }
            }
        }
    }
    
}
#Preview {
    ContentView()
}
