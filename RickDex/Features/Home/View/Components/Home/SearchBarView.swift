//
//  SearchBarView.swift
import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .tint(AppColor.hintText)
                .padding(.leading , 8)
                .padding(.trailing , 8)
            TextField("serach by name" , text: $viewModel.name)
                .foregroundColor(.white)
            
                .padding(.trailing , 8)
            
        }
        
        .frame(height: 50)
        .background(AppColor.cardBackground)
        .cornerRadius(AppCornerRadius.medium)
        .overlay(
            RoundedRectangle(cornerRadius: AppCornerRadius.medium)
                .stroke(AppColor.borderDefault, lineWidth: 1)
        )
        .foregroundColor(.white)
        .padding(.top , 30)
        .padding(.leading , 16)
        .padding(.trailing , 16)
    }
}
