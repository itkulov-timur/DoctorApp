//
//  SortButton.swift
//  DoctorApp
//
//  Created by Timur Itkulov on 14.11.2026.
//

import SwiftUI
import Combine

struct SortButton: View{
    @ObservedObject var viewModel: DoctorViewModel
    let title: String
    let type: SortType
    var body: some View{
        
        Button {
            viewModel.selectSort(type)
        } label: {
            HStack(spacing: 4) {
                Text(title)
                if viewModel.sortType == type {
                    Image(systemName: viewModel.isAscending ? "arrow.up" : "arrow.down")
                }
            }
            .font(.system(size: 18))
            .foregroundStyle(viewModel.sortType == type ? .white : .gray)
            .frame(maxWidth: .infinity)
            .frame(height: 42)
            .background {
                if viewModel.sortType == type {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink)
                }
            }
        }
    }
}
