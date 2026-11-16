//
//  ServicePriceSection.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 06.11.2026.
//

import Foundation
import SwiftUI


struct ServicePriceSection: View {
    let title: String
    let price: String
    let tm: String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            
            HStack{
                Text(tm)
                Spacer()
                Text("\(price) ₽")
            }
            .padding()
            .background(Color.white)
            .font(.system(size: 16, weight: .semibold))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1))
            
            
        }
        .padding(.horizontal, 16)
        
    }
}
    
