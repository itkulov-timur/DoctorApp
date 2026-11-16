//
//  CardDoctor.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 26.09.2026.
//

import Foundation
import SwiftUI

struct CardDoctor: View {
    @State private var doctors: [Doctor] = []
    var doctor: Doctor
    var body: some View {
        
        VStack(alignment: .leading){
            VStack(alignment: .leading,spacing: 20){
                VStack(alignment: .leading,spacing: 12){
                    
                    HStack(alignment: .top, spacing: 12){
                        if let avatarUrl = doctor.avatar, let url = URL(string: avatarUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .foregroundStyle(.gray)
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundStyle(.gray)
                                .frame(width: 50, height: 50)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(doctor.surName) \(doctor.Name) \(doctor.patronymicName ?? "")")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .frame(height: 50)
                            
                            
                            HStack(spacing: 2) {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < Int(doctor.ratingsRating) ? "star.fill" : "star")
                                        .foregroundStyle(.colorPink)
                                        .font(.system(size: 12))
                                    
                                }
                            }
                            HStack{
                                Text(doctor.specialization.first?.name ?? "Врач")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray)
                                Text("·")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(.gray)
                                Text("стаж \(doctor.seniority) лет")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray)
                                
                            }
                            
                            if let price = doctor.minPrice {
                                Text("от \(price) ₽")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.black)
                                
                            } else {
                                Text("Цена не указана")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.black)
                            }
                            
                        }
                        Spacer()
                        Image("img1")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gray)
                            .frame(width: 24, height: 24)
                    }
                    
                }
                Btn(text: "Записаться")
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 16)
    }
}




