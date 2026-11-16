//
//  ButtonBottom.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 26.09.2026.
//

import Foundation
import SwiftUI

struct ButtonBottom: View{
    var text: String
    var body: some View{
        VStack{
            VStack{
                Text(text)
                    .font(.system(size: 16, weight: .semibold))
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .backgroundStyle(.red)
            .clipShape(Capsule())
        }
        .padding(.horizontal, 20)
    }
}

struct Btn: View{
    var text: String
    var body: some View{
        VStack{
            VStack{
                Text(text)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .background(.colorPink)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        
    }
}
