//
//  PriceView.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 05.11.2026.
//

import Foundation
import SwiftUI

struct PriceView: View{
    @Environment(\.dismiss) private var dismiss
    let doctor: Doctor
    var body: some View{
        
        ScrollView{
            VStack(alignment: .leading, spacing: 24){
                
                
                ServicePriceSection(title: "Видеоконсультация",
                                    price: "\(doctor.videoChatPrice)",
                                    tm: "30 мин")
                
                ServicePriceSection(title: "Чат с врачем",
                                    price: "\(doctor.textChatPrice)",
                                    tm: "30 мин")
                
                ServicePriceSection(title: "Прием в клинике",
                                    price: "\(doctor.hospitalPrice)",
                                    tm: "В клинике")
            }
            .padding(.top, 24)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Стоимость услуг")
                    .font(.system(size: 20, weight: .medium))
            }
        }
    }
}
