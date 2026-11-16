//
//  DoctorDetailView.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 27.09.2026.
//

import Foundation
import SwiftUI

struct DoctorDetailView: View{
    let doctor: Doctor
    var body: some View{
        VStack{
            VStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack(spacing: 28){
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
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text(doctor.surName)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)
                            HStack(spacing: 0){
                                Text(doctor.Name)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.black)
                                
                                if let patronymic = doctor.patronymicName {
                                    Text(patronymic)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                       Spacer()

                    }
                    
                    HStack{
                        Image("img2.1")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gray)
                            .frame(width: 24, height: 24)
                        
                        Text("Опыт работы: \(doctor.seniority) лет")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.DG)
                    }
                    HStack{
                        Image("img3")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gray)
                            .frame(width: 24, height: 24)
                        
                        Text("Врач \(doctor.categoryLabel) категория")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.DG)
                    }
                    
                    if let education = doctor.educationTypeLabel{
                        HStack{
                            Image("img4")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text(education.name)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.DG)
                            
                        }
                    }
                    if let clinic = doctor.workExpirience.first?.organization{
                        HStack{
                            Image("img5")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                                .frame(width: 24, height: 24)
                            
                            Text(clinic)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.DG)
                        }
                    }
                }
                .padding(.top, 20)
                               
                NavigationLink{
                    PriceView(doctor: doctor)
                }label: {
                    HStack(alignment: .center){
                        Text("Стоимость услуг")
                        Spacer()
                        Text("от 600 ₽")
                    }
                    .padding()
                    .background(Color.white)
                    .font(.system(size: 16, weight: .semibold))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        
                    )
                }
                .buttonStyle(.plain)
                
                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    .font(.system(size: 14))
                    .foregroundStyle(.black)
                
            }
            
            Spacer()
            .safeAreaInset(edge: .bottom){
                Btn(text: "Записаться")
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатор")
                    .font(.system(size: 20, weight: .medium))
            }
        }
        .padding(.horizontal, 16)
        Spacer()
    }
}
